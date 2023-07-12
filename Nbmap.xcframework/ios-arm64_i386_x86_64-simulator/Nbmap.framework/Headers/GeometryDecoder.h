#import <Foundation/Foundation.h>
#import "NGLFeature.h"
#import "NGLFoundation.h"

NGL_EXPORT
@interface GeometryDecoder : NSObject

+ (NGLPolylineFeature *) covertToFeature: (NSString *) encodedString precision: (int) precision;

@end
