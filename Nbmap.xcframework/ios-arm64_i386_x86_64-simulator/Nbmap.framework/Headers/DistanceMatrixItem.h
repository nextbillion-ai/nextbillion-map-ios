//
//  DistanceMatrixItem.h
//  ios
//
//  Created by Lin Dan on 27/9/21.
//  Copyright © 2021 Nbmap. All rights reserved.
//

#ifndef DistanceMatrixItem_h
#define DistanceMatrixItem_h

#import "NBDistance.h"
#import "NBDuration.h"
#import "NGLFoundation.h"

NGL_EXPORT
@interface DistanceMatrixItem : NSObject
-(instancetype)intiWithDictionary: (NSDictionary *) dict;
@property(nonatomic, copy) NBDistance* distance;
@property(nonatomic, copy) NBDuration* duration;
@end

#endif /* DistanceMatrixItem_h */
