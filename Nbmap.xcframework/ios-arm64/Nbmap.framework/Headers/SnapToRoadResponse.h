//
//  SnapToRoadResponse.h
//  ios
//
//  Created by Lin Dan on 27/9/21.
//  Copyright © 2021 Nbmap. All rights reserved.
//

#ifndef SnapToRoadResponse_h
#define SnapToRoadResponse_h
#import "NGLFoundation.h"

NGL_EXPORT

@interface SnapToRoadResponse : NSObject
@property(nonatomic) int distance;
@property(nonatomic, copy) NSString *status;
@property(nonatomic, copy) NSArray *geometry;
@property(nonatomic, copy) NSArray *snappedPoints;
-(instancetype)intiWithDictionary: (NSDictionary *) dict;
@end

#endif /* SnapToRoadResponse_h */
