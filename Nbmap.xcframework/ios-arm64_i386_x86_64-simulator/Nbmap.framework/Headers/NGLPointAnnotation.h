#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>

#import "NGLFoundation.h"
#import "NGLShape.h"

NS_ASSUME_NONNULL_BEGIN

/**
 An `NGLPointAnnotation` object represents a one-dimensional shape located at a
 single geographical coordinate. Depending on how it is used, an
 `NGLPointAnnotation` object is known as a point annotation or point shape. For
 example, you could use a point shape to represent a city at low zoom levels, an
 address at high zoom levels, or the location of a long press gesture.

 You can add point shapes to the map by adding them to an `NGLShapeSource`
 object. Configure the appearance of an `NGLShapeSource`’s or
 `NGLVectorTileSource`’s point shapes collectively using an `NGLCircleStyleLayer` or
 `NGLSymbolStyleLayer` object.

 For more interactivity, add a selectable point annotation to a map view using
 the `-[NGLMapView addAnnotation:]` method. Alternatively, define your own model
 class that conforms to the `NGLAnnotation` protocol. Configure a point
 annotation’s appearance using
 `-[NGLMapViewDelegate mapView:imageForAnnotation:]` or
 `-[NGLMapViewDelegate mapView:viewForAnnotation:]` (iOS only). A point
 annotation’s `NGLShape.title` and `NGLShape.subtitle` properties define the
 default content of the annotation’s callout (on iOS) or popover (on macOS).

 To group multiple related points together in one shape, use an
 `NGLPointCollection` or `NGLShapeCollection` object. To access
 a point’s attributes, use an `NGLPointFeature` object.

 A point shape is known as a
 <a href="https://tools.ietf.org/html/rfc7946#section-3.1.2">Point</a> geometry
 in GeoJSON.
 
 #### Related examples
 See the <a href="https://docs.nbmap.com/ios/maps/examples/marker/">
 Mark a place on the map with an annotation</a>, <a href="https://docs.nbmap.com/ios/maps/examples/marker-image/">
 Mark a place on the map with an image</a>, and <a href="https://docs.nbmap.com/ios/maps/examples/default-callout/">
 Default callout usage</a> examples to learn how to add `NGLPointAnnotation`
 objects to your map.
 */
NGL_EXPORT
@interface NGLPointAnnotation : NGLShape

/**
 The coordinate point of the shape, specified as a latitude and longitude.
 */
@property (nonatomic, assign) CLLocationCoordinate2D coordinate;

@end

NS_ASSUME_NONNULL_END
