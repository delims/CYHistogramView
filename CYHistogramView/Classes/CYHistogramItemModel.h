//
//  CYHistogramItemModel.h
//  CYHistogramView_Demo
//
//  Created by delims on 2020/8/24.
//  Copyright © 2020 delims. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface CYHistogramItemModel : NSObject

@property (nonatomic,copy) NSString    *name;
@property (nonatomic,assign) float      percent;
+ (instancetype)modelWithName:(NSString*)name percent:(float)percent;
@end

NS_ASSUME_NONNULL_END
