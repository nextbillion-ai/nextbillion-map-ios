#import <Foundation/Foundation.h>
#import "NGLFoundation.h"

NGL_EXPORT
@interface NBDistance : NSObject

@property(nonatomic) int value;
-(instancetype)intiWithDictionary: (NSDictionary *) dict;

@end
