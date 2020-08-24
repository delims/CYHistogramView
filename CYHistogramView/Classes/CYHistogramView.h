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

///Highlighted name
@property (nullable,nonatomic,copy) NSString* selectedName;

@end

NS_ASSUME_NONNULL_END
