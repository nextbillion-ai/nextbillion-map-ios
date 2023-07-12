
#import <Foundation/Foundation.h>
#import "NBLocation.h"
#import "NBDuration.h"
#import "NBDistance.h"
#import "NGLFoundation.h"

NGL_EXPORT
@interface NBRouteLeg : NSObject

@property(nonatomic, copy) NBDistance *distance;
@property(nonatomic, copy) NBDuration *duration;
@property(nonatomic, copy)NBLocation *endLocation;
@property(nonatomic, copy)NBLocation *startLocation;
@property(nonatomic, copy)NSArray *steps;
-(instancetype)intiWithDictionary: (NSDictionary *) dict;

@end
