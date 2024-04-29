
#import <Foundation/Foundation.h>
#import "NBLocation.h"
#import "NGLFoundation.h"

NGL_EXPORT
@interface NBLegStep : NSObject

@property(nonatomic, copy)NBLocation *endLocation;
@property(nonatomic, copy)NBLocation *startLocation;
@property(nonatomic, copy)NSString *geometry;
-(instancetype)intiWithDictionary: (NSDictionary *) dict;
@end
