//
//  NBRouteResponse.m
//  iosapp
//
//  Created by Lin Dan on 20/9/21.
//  Copyright © 2021 Nbmap. All rights reserved.
//

#import <Foundation/Foundation.h>
// NBRoute
#import "NGLFoundation.h"

NGL_EXPORT

@interface NBDirectionResponse : NSObject

@property(nonatomic, copy) NSString *errorMessage;
@property(nonatomic, copy) NSString *mode;
@property(nonatomic, copy) NSString *status;
@property(nonatomic, copy) NSArray *routes;
-(instancetype)intiWithDictionary: (NSDictionary *) dict;
@end

