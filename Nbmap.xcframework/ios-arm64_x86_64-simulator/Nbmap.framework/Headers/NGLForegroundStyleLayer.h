#import <Foundation/Foundation.h>

#import "NGLFoundation.h"
#import "NGLStyleLayer.h"

NS_ASSUME_NONNULL_BEGIN

@class NGLSource;

/**
 ``NGLForegroundStyleLayer`` is an abstract superclass for style layers whose
 content is defined by an ``NGLSource`` object.

 Create instances of ``NGLRasterStyleLayer``, ``NGLRasterStyleLayer``, and the
 concrete subclasses of ``NGLVectorStyleLayer`` in order to use
 ``NGLForegroundStyleLayer``'s methods. Do not create instances of
 ``NGLForegroundStyleLayer`` directly, and do not create your own subclasses of
 this class.
 */
NGL_EXPORT
@interface NGLForegroundStyleLayer : NGLStyleLayer

// MARK: Initializing a Style Layer

- (instancetype)init
    __attribute__((unavailable("Use -init methods of concrete subclasses instead.")));

// MARK: Specifying a Style Layer’s Content

/**
 Identifier of the source from which the receiver obtains the data to style.
 */
@property (nonatomic, readonly, nullable) NSString *sourceIdentifier;

@end

NS_ASSUME_NONNULL_END
