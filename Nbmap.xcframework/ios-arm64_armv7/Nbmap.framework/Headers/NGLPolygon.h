#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>

#import "NGLFoundation.h"
#import "NGLMultiPoint.h"
#import "NGLOverlay.h"

#import "NGLTypes.h"

NS_ASSUME_NONNULL_BEGIN

/**
 An `NGLPolygon` object represents a closed shape consisting of four or more
 vertices, specified as `CLLocationCoordinate2D` instances, and the edges that
 connect them. For example, you could use a polygon shape to represent a
 building, a lake, or an area you want to highlight.

 You can add polygon shapes to the map by adding them to an `NGLShapeSource`
 object. Configure the appearance of an `NGLShapeSource`’s or
 `NGLVectorTileSource`’s polygons collectively using an `NGLFillStyleLayer` or
 `NGLSymbolStyleLayer` object. To access a polygon’s attributes, use an
 `NGLPolygonFeature` object.

 Alternatively, you can add a polygon overlay directly to a map view using the
 `-[NGLMapView addAnnotation:]` or `-[NGLMapView addOverlay:]` method. Configure
 a polygon overlay’s appearance using
 `-[NGLMapViewDelegate mapView:strokeColorForShapeAnnotation:]` and
 `-[NGLMapViewDelegate mapView:fillColorForPolygonAnnotation:]`.

 The vertices are automatically connected in the order in which you provide
 them. You should close the polygon by specifying the same
 `CLLocationCoordinate2D` as the first and last vertices; otherwise, the
 polygon’s fill may not cover the area you expect it to. To avoid filling the
 space within the shape, give the polygon a transparent fill or use an
 `NGLPolyline` object.

 A polygon may have one or more interior polygons, or holes, that you specify as
 `NGLPolygon` objects with the `+polygonWithCoordinates:count:interiorPolygons:`
 method. For example, if a polygon represents a lake, it could exclude an island
 within the lake using an interior polygon. Interior polygons may not themselves
 have interior polygons. To represent a shape that includes a polygon within a
 hole or, more generally, to group multiple polygons together in one shape, use
 an `NGLMultiPolygon` or `NGLShapeCollection` object.

 To make the polygon straddle the antimeridian, specify some longitudes less
 than −180 degrees or greater than 180 degrees.
 
 #### Related examples
 See the <a href="https://docs.nbmap.com/ios/maps/examples/polygon/">
 Add a polygon annotation</a> example to learn how to initialize an
 `NGLPolygon` object from an array of coordinates.
 */
NGL_EXPORT
@interface NGLPolygon : NGLMultiPoint <NGLOverlay>

/**
 The array of polygons nested inside the receiver.

 The area occupied by any interior polygons is excluded from the overall shape.
 Interior polygons should not overlap. An interior polygon should not have
 interior polygons of its own.

 If there are no interior polygons, the value of this property is `nil`.
 */
@property (nonatomic, nullable, readonly) NSArray<NGLPolygon *> *interiorPolygons;

/**
 Creates and returns an `NGLPolygon` object from the specified set of
 coordinates.

 @param coords The array of coordinates defining the shape. The data in this
    array is copied to the new object.
 @param count The number of items in the `coords` array.
 @return A new polygon object.
 */
+ (instancetype)polygonWithCoordinates:(const CLLocationCoordinate2D *)coords count:(NSUInteger)count;

/**
 Creates and returns an `NGLPolygon` object from the specified set of
 coordinates and interior polygons.

 @param coords The array of coordinates defining the shape. The data in this
    array is copied to the new object.
 @param count The number of items in the `coords` array.
 @param interiorPolygons An array of `NGLPolygon` objects that define regions
    excluded from the overall shape. If this array is `nil` or empty, the shape
    is considered to have no interior polygons.
 @return A new polygon object.
 */
+ (instancetype)polygonWithCoordinates:(const CLLocationCoordinate2D *)coords count:(NSUInteger)count interiorPolygons:(nullable NSArray<NGLPolygon *> *)interiorPolygons;

@end

/**
 An `NGLMultiPolygon` object represents a shape consisting of one or more
 polygons that do not overlap. For example, you could use a multipolygon shape
 to represent the body of land that consists of an island surrounded by an
 atoll: the inner island would be one `NGLPolygon` object, while the surrounding
 atoll would be another. You could also use a multipolygon shape to represent a
 group of disconnected but related buildings.

 You can add multipolygon shapes to the map by adding them to an
 `NGLShapeSource` object. Configure the appearance of an `NGLShapeSource`’s or
 `NGLVectorTileSource`’s multipolygons collectively using an `NGLFillStyleLayer`
 or `NGLSymbolStyleLayer` object.

 You cannot add an `NGLMultiPolygon` object directly to a map view using
 `-[NGLMapView addAnnotation:]` or `-[NGLMapView addOverlay:]`. However, you can
 add the `polygons` array’s items as overlays individually.
 */
NGL_EXPORT
@interface NGLMultiPolygon : NGLShape <NGLOverlay>

/**
 An array of polygons forming the multipolygon.
 */
@property (nonatomic, copy, readonly) NSArray<NGLPolygon *> *polygons;

/**
 Creates and returns a multipolygon object consisting of the given polygons.

 @param polygons The array of polygons defining the shape.
 @return A new multipolygon object.
 */
+ (instancetype)multiPolygonWithPolygons:(NSArray<NGLPolygon *> *)polygons;

@end

NS_ASSUME_NONNULL_END
