//
//  DistanceMatrixResponse.h
//  ios
//
//  Created by Lin Dan on 27/9/21.
//  Copyright © 2021 Nbmap. All rights reserved.
//

#ifndef DistanceMatrixResponse_h
#define DistanceMatrixResponse_h
#import "NGLFoundation.h"

NGL_EXPORT

@interface DistanceMatrixResponse : NSObject

-(instancetype)intiWithDictionary: (NSDictionary *) dict;
@property(nonatomic, copy) NSString *status;
@property(nonatomic, copy) NSArray *rows;
@end
#endif /* DistanceMatrixResponse_h */
