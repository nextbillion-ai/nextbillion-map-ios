#import <Foundation/Foundation.h>
#import "NGLFoundation.h"

NGL_EXPORT
@interface NBLocation : NSObject

@property (nonatomic) double latitude;
@property (nonatomic) double longitude;

-(instancetype)intiWithDictionary: (NSDictionary *) dict;
-(instancetype)intiWithValues: (double) lat lng:(double) lng;

@end
