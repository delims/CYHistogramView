//
//  CYHistogramView.h
//  Farm
//
//  Created by delims on 2020/2/25.
//  Copyright © 2020 bestdew. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CYHistogramItemModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface CYHistogramView : UIView

/// an array that contains CYHistogramItemModels
@property (nonnull,nonatomic,strong) NSArray<CYHistogramItemModel*> * itemModels;

///Width of pillar
@property (nonatomic,assign) CGFloat itemWidth;
 
/**
@brief Highlighted item's text
*/
@property (nullable,nonatomic,copy) NSString* selectedItemText;


@property (nullable,nonatomic,strong) UIColor* selectedItemTextColor;

@property (nullable,nonatomic,strong) UIColor* itemTextColor;

@property (nullable,nonatomic,strong) UIColor* verticalLineColor;

@property (nullable,nonatomic,strong) UIColor* textColor;

/// an array contains gradientColors, the colors must be `CGColor`
@property (nullable,nonatomic,copy) NSArray* gradientColors;


@end

NS_ASSUME_NONNULL_END
