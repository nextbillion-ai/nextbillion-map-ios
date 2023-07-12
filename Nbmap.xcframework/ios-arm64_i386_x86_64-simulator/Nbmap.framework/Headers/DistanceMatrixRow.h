//
//  DistanceMatrixRow.h
//  ios
//
//  Created by Lin Dan on 27/9/21.
//  Copyright © 2021 Nbmap. All rights reserved.
//

#ifndef DistanceMatrixRow_h
#define DistanceMatrixRow_h
#import "NGLFoundation.h"

NGL_EXPORT
@interface DistanceMatrixRow : NSObject

-(instancetype)intiWithDictionary: (NSDictionary *) dict;
@property(nonatomic, copy) NSArray *elements;
@end

#endif /* DistanceMatrixRow_h */
