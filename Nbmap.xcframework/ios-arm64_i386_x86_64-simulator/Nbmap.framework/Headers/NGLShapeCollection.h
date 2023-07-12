#import <Foundation/Foundation.h>

#import "NGLFoundation.h"
#import "NGLShape.h"

#import "NGLTypes.h"

NS_ASSUME_NONNULL_BEGIN

/**
 An `NGLShapeCollection` object represents a shape consisting of zero or more
 distinct but related shapes that are instances of `NGLShape`. The constituent
 shapes can be a mixture of different kinds of shapes.

 `NGLShapeCollection` is most commonly used to add multiple shapes to a single
 `NGLShapeSource`. Configure the appearance of an `NGLShapeSource`’s or
 `NGLVectorTileSource`’s shape collection collectively using an
 `NGLSymbolStyleLayer` object, or use multiple instances of
 `NGLCircleStyleLayer`, `NGLFillStyleLayer`, and `NGLLineStyleLayer` to
 configure the appearance of each kind of shape inside the collection.

 You cannot add an `NGLShapeCollection` object directly to a map view as an
 annotation. However, you can create individual `NGLPointAnnotation`,
 `NGLPolyline`, and `NGLPolygon` objects from the `shapes` array and add those
 annotation objects to the map view using the `-[NGLMapView addAnnotations:]`
 method.

 To represent a collection of point, polyline, or polygon shapes, it may be more
 convenient to use an `NGLPointCollection`, `NGLMultiPolyline`, or
 `NGLMultiPolygon` object, respectively. To access a shape collection’s
 attributes, use the corresponding `NGLFeature` object.

 A shape collection is known as a
 <a href="https://tools.ietf.org/html/rfc7946#section-3.1.8">GeometryCollection</a>
 geometry in GeoJSON.
 */
NGL_EXPORT
@interface NGLShapeCollection : NGLShape

/**
 An array of shapes forming the shape collection.
 */
@property (nonatomic, copy, readonly) NSArray<NGLShape *> *shapes;

/**
 Creates and returns a shape collection consisting of the given shapes.

 @param shapes The array of shapes defining the shape collection. The data in
    this array is copied to the new object.
 @return A new shape collection object.
 */
+ (instancetype)shapeCollectionWithShapes:(NSArray<NGLShape *> *)shapes;

@end

NS_ASSUME_NONNULL_END
