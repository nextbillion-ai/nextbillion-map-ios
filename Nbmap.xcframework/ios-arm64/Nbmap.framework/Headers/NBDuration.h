#import <Foundation/Foundation.h>
#import "NGLFoundation.h"

NGL_EXPORT
@interface NBDuration : NSObject

@property(nonatomic) int value;
-(instancetype)intiWithDictionary: (NSDictionary *) dict;
@end
