
#import <Foundation/Foundation.h>
#import "NBLocation.h"
#import "NGLFoundation.h"

NGL_EXPORT
@interface NBRoute: NSObject

@property(nonatomic, copy)NBLocation *endLocation;
@property(nonatomic, copy)NBLocation *startLocation;
@property(nonatomic, copy)NSString *geometry;
@property(nonatomic)double distance;
@property(nonatomic)double distanceFull;
@property(nonatomic)double duration;
@property(nonatomic, copy)NSArray *legs;
-(instancetype)intiWithDictionary: (NSDictionary *) dict;
@end
