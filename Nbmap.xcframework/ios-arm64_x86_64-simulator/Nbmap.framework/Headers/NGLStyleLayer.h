#import <Foundation/Foundation.h>

#import "NGLFoundation.h"
#import "NGLTypes.h"

NS_ASSUME_NONNULL_BEGIN

FOUNDATION_EXTERN NGL_EXPORT NGLExceptionName const NGLInvalidStyleLayerException;

/**
 ``NGLStyleLayer`` is an abstract base class for style layers. A style layer
 manages the layout and appearance of content at a specific z-index in a style.
 An ``NGLStyle`` object consists of one or more ``NGLStyle`` objects.

 Each style layer defined by the style JSON file is represented at runtime by an
 ``NGLStyleLayer`` object, which you can use to refine the map’s appearance. You
 can also add and remove style layers dynamically.

 Create instances of ``NGLBackgroundStyleLayer`` and the concrete subclasses of
 ``NGLForegroundStyleLayer`` in order to use ``NGLForegroundStyleLayer``'s properties and methods.
 You do not create instances of ``NGLStyleLayer`` directly, and do not
 create your own subclasses of this class.

 Do not add ``NGLStyleLayer`` objects to the `style` property of a ``NGLStyleLayer`` before
 ``NGLMapViewDelegate/mapView:didFinishLoadingStyle:`` is called.
 */
NGL_EXPORT
@interface NGLStyleLayer : NSObject

// MARK: Initializing a Style Layer

- (instancetype)init
    __attribute__((unavailable("Use -init methods of concrete subclasses instead.")));

// MARK: Identifying a Style Layer

/**
 A string that uniquely identifies the style layer in the style to which it is
 added.
 */
@property (nonatomic, copy, readonly) NSString *identifier;

// MARK: Configuring a Style Layer’s Visibility

/**
 Whether this layer is displayed. A value of `NO` hides the layer.

 #### Related examples
 TODO: Show and hide a layer, learn how to toggle an ``NGLStyleLayer``
 object's visibility.
 */
@property (nonatomic, assign, getter=isVisible) BOOL visible;

/**
 The maximum zoom level at which the layer gets parsed and appears. This value is a floating-point
 number.
 */
@property (nonatomic, assign) float maximumZoomLevel;

/**
 The minimum zoom level at which the layer gets parsed and appears. This value is a floating-point
 number.
 */
@property (nonatomic, assign) float minimumZoomLevel;

@end

NS_ASSUME_NONNULL_END
