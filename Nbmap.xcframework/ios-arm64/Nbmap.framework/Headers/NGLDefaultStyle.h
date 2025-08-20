#import <Foundation/Foundation.h>

#import "NGLFoundation.h"

NS_ASSUME_NONNULL_BEGIN

/**
 The ``NGLDefaultStyle`` defines the predefined vendor style
 */
NGL_EXPORT
@interface NGLDefaultStyle : NSObject

/**
The style URL
 */
@property (nonatomic, retain) NSURL* url;

/**
The style name
 */
@property (nonatomic, retain) NSString* name;

/**
The style version
 */
@property (nonatomic) int version;

@end

NS_ASSUME_NONNULL_END
