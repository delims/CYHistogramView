//
//  CYHistogramView.m
//  Farm
//
//  Created by delims on 2020/2/25.
//  Copyright © 2020 bestdew. All rights reserved.
//

#import "CYHistogramView.h"

static UIColor *cy_colorWithRGB(int rgb)
{
    return [UIColor colorWithRed:(rgb >> 16 & 0xFF)/255.0 green:(rgb >> 8 & 0xFF)/255.0  blue:(rgb >> 0 & 0xFF)/255.0 alpha:1];
}

@interface CYHistogramView ()

{
    BOOL _isInitted;
}

@property (nonatomic,strong) NSArray *columnViewArray;
@property (nonatomic,strong) NSArray *columnLayerArray;
@property (nonatomic,strong) NSArray *labelArray;
@property (nonatomic,strong) NSArray *lineArray;

@end

@implementation CYHistogramView


- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    [self initialize];
    return self;
}
- (instancetype)init
{
    self = [super init];
    [self initialize];
    return self;
}

- (void)initialize
{
    if (_isInitted) return;
    _isInitted = YES;
    _itemWidth = 30;
    _verticalLineColor = cy_colorWithRGB(0x92A1B1);
    _textColor = cy_colorWithRGB(0x92A1B1);
    _gradientColors = @[(id)cy_colorWithRGB(0x2FCC72).CGColor,(id)cy_colorWithRGB(0x354a5e).CGColor];
    _selectedItemTextColor = UIColor.whiteColor;
    
    self.backgroundColor = cy_colorWithRGB(0x354a5e);
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    if (self.itemWidth == 0) return;
    if (self.itemModels.count == 0) return;
    
    CGFloat appWidth = self.bounds.size.width;
    CGFloat height = self.bounds.size.height;
    NSUInteger count = self.itemModels.count;
    
    for (int i = 0; i < count; i ++) {
        CYHistogramItemModel *model = self.itemModels[i];
        UIView *view = self.columnViewArray[i];
        CAGradientLayer *layer = self.columnLayerArray[i];
        UILabel *label = self.labelArray[i];
        UILabel *line = self.lineArray[i];
        CGFloat width = self.itemWidth;
        CGFloat space = (appWidth - count * width) / (count + 1);
        CGFloat halfSpace = space * 0.5;
        
        label.frame = CGRectMake((space + width) * i + halfSpace, 10, space + width, 13);

        CGFloat percent = model.percent;
        if (percent <= 0) {
            view.hidden = YES;
        } else {
            if (percent > 1) {
                percent = 1;
            }
            view.hidden = NO;
            CGFloat totalHeight = height - 32;
            CGFloat h = totalHeight * percent;
            CGFloat y = 32 + totalHeight * (1 - percent);
            view.frame = CGRectMake((space + width) * i + space, y, width, h);
            layer.frame = view.bounds;

            if (self.selectedItemText.length && [self.selectedItemText isEqualToString:model.text]) {
                label.font = [UIFont systemFontOfSize:14];
                label.textColor = _selectedItemTextColor;
                layer.backgroundColor = (__bridge CGColorRef)self.gradientColors.firstObject;
            } else {
                layer.colors = _gradientColors;
                layer.startPoint = CGPointMake(0, 0);
                layer.endPoint = CGPointMake(0, 1);
                layer.locations = @[@(0.0) ,@(1)];
            }
            UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:layer.frame
                                                       byRoundingCorners:UIRectCornerTopLeft|UIRectCornerTopRight
                                                             cornerRadii:CGSizeMake(self.itemWidth*0.5, self.itemWidth*0.5)];
            CAShapeLayer *shapeLayer = [CAShapeLayer layer];
            shapeLayer.path = path.CGPath;
            layer.mask = shapeLayer;
            line.frame = CGRectMake(CGRectGetMidX(view.frame) - 0.5, 32, 1, height - 32 - h);
        }
    }
}

- (void)setItemModels:(NSArray<CYHistogramItemModel *> *)itemModels
{
    if ([itemModels isKindOfClass:NSArray.class] == NO) return;
    _itemModels = itemModels;
    NSMutableArray *labels = NSMutableArray.array;
    NSMutableArray *views = NSMutableArray.array;
    NSMutableArray *layers = NSMutableArray.array;
    NSMutableArray *lines = NSMutableArray.array;

    for (int i = 0; i < _itemModels.count; i ++) {
        CYHistogramItemModel *model = _itemModels[i];
        NSAssert([model isKindOfClass:CYHistogramItemModel.class], @"itemModels must contain only `CYHistogramItemModel` instance");
        UILabel *label = [UILabel new];
        label.font = [UIFont systemFontOfSize:12];
        label.textColor = self.textColor;
        label.textAlignment = NSTextAlignmentCenter;
        label.text = model.text;
        [labels addObject:label];
        [self addSubview:label];

        UIView *view = [UIView new];
        [views addObject:view];
        [self addSubview:view];

        CAGradientLayer *layer = [CAGradientLayer layer];
        [view.layer addSublayer:layer];
        [layers addObject:layer];

        UIView *line = [UIView new];
        line.backgroundColor = self.verticalLineColor;
        [lines addObject:line];
        [self addSubview:line];
    }

    self.columnLayerArray = layers.copy;
    self.columnViewArray = views.copy;
    self.labelArray = labels.copy;
    self.lineArray = lines.copy;
    [self setNeedsLayout];
}

- (void)setVerticalLineColor:(UIColor *)verticalLineColor
{
    if ([verticalLineColor isKindOfClass:UIColor.class] == NO) return;
    _verticalLineColor = verticalLineColor;
    for (UIView *view in self.lineArray) {
        view.backgroundColor = _verticalLineColor;
    }
}

- (void)setItemWidth:(CGFloat)itemWidth
{
    if (_itemWidth == itemWidth) return;
    _itemWidth = itemWidth;
    [self setNeedsLayout];
}

- (void)setGradientColors:(NSArray *)gradientColors
{
    if ([gradientColors isKindOfClass:NSArray.class] == NO) return;
    _gradientColors = gradientColors;
    [self setNeedsLayout];
}

- (void)setTextColor:(UIColor *)textColor
{
    if ([textColor isKindOfClass:UIColor.class] == NO) return;
    _textColor = textColor;
    for (UILabel *label in self.labelArray) {
        label.textColor = _textColor;
    }
}
@end
