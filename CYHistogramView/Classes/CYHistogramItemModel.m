//
//  CYHistogramItemModel.m
//  CYHistogramView_Demo
//
//  Created by delims on 2020/8/24.
//  Copyright © 2020 delims. All rights reserved.
//

#import "CYHistogramItemModel.h"

@implementation CYHistogramItemModel

+ (instancetype)modelWithText:(NSString *)text percent:(float)percent
{
    CYHistogramItemModel *model = CYHistogramItemModel.new;
    model.text = text;
    model.percent = percent;
    return model;
}

@end
