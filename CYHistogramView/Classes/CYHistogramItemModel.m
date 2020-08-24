//
//  CYHistogramItemModel.m
//  CYHistogramView_Demo
//
//  Created by delims on 2020/8/24.
//  Copyright © 2020 delims. All rights reserved.
//

#import "CYHistogramItemModel.h"

@implementation CYHistogramItemModel

+ (instancetype)modelWithName:(NSString *)name percent:(float)percent
{
    CYHistogramItemModel *model = CYHistogramItemModel.new;
    model.name = name;
    model.percent = percent;
    return model;
}

@end
