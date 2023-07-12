#import <Foundation/Foundation.h>

#import "NGLFoundation.h"
#import "NGLAnnotation.h"

NS_ASSUME_NONNULL_BEGIN

/**
 `NGLShape` is an abstract class that represents a shape or annotation. Shapes
 constitute the content of a map — not only the overlays atop the map, but also
 the content that forms the base map.

 Create instances of `NGLPointAnnotation`, `NGLPointCollection`, `NGLPolyline`,
 `NGLMultiPolyline`, `NGLPolygon`, `NGLMultiPolygon`, or `NGLShapeCollection` in
 order to use `NGLShape`'s methods. Do not create instances of `NGLShape`
 directly, and do not create your own subclasses of this class. The shape
 classes correspond to the
 <a href="https://tools.ietf.org/html/rfc7946#section-3.1">Geometry</a> object
 types in the GeoJSON standard, but some have nonstandard names for backwards
 compatibility.

 Although you do not create instances of this class directly, you can use its
 `+[NGLShape shapeWithData:encoding:error:]` factory method to create one of the
 concrete subclasses of `NGLShape` noted above from GeoJSON data. To access a
 shape’s attributes, use the corresponding `NGLFeature` class instead.

 You can add shapes to the map by adding them to an `NGLShapeSource` object.
 Configure the appearance of an `NGLShapeSource`’s or `NGLVectorTileSource`’s
 shapes collectively using a concrete instance of `NGLVectorStyleLayer`.
 Alternatively, you can add some kinds of shapes directly to a map view as
 annotations or overlays.
 
 You can filter the features in a `NGLVectorStyleLayer` or vary their layout or
 paint attributes based on the features’ geographies. Pass an `NGLShape` into an
 `NSPredicate` with the format `SELF IN %@` or `%@ CONTAINS SELF` and set the
 `NGLVectorStyleLayer.predicate` property to that predicate, or set a layout or
 paint attribute to a similarly formatted `NSExpression`.
 */
NGL_EXPORT
@interface NGLShape : NSObject <NGLAnnotation, NSSecureCoding>

#pragma mark Creating a Shape

/**
 Returns an `NGLShape` object initialized with the given data interpreted as a
 string containing a GeoJSON object.

 If the GeoJSON object is a geometry, the returned value is a kind of
 `NGLShape`. If it is a feature object, the returned value is a kind of
 `NGLShape` that conforms to the `NGLFeature` protocol. If it is a feature
 collection object, the returned value is an instance of
 `NGLShapeCollectionFeature`.

 ### Example

 ```swift
 let url = mainBundle.url(forResource: "amsterdam", withExtension: "geojson")!
 let data = try! Data(contentsOf: url)
 let feature = try! NGLShape(data: data, encoding: String.Encoding.utf8.rawValue) as! NGLShapeCollectionFeature
 ```

 @param data String data containing GeoJSON source code.
 @param encoding The encoding used by `data`.
 @param outError Upon return, if an error has occurred, a pointer to an
    `NSError` object describing the error. Pass in `NULL` to ignore any error.
 @return An `NGLShape` object representation of `data`, or `nil` if `data` could
    not be parsed as valid GeoJSON source code. If `nil`, `outError` contains an
    `NSError` object describing the problem.
 */
+ (nullable NGLShape *)shapeWithData:(NSData *)data encoding:(NSStringEncoding)encoding error:(NSError * _Nullable *)outError;

#pragma mark Accessing the Shape Attributes

/**
 The title of the shape annotation.

 The default value of this property is `nil`.

 This property is ignored when the shape is used in an `NGLShapeSource`. To name
 a shape used in a shape source, create an `NGLFeature` and add an attribute to
 the `NGLFeature.attributes` property.
 */
@property (nonatomic, copy, nullable) NSString *title;

/**
 The subtitle of the shape annotation. The default value of this property is
 `nil`.

 This property is ignored when the shape is used in an `NGLShapeSource`. To
 provide additional information about a shape used in a shape source, create an
 `NGLFeature` and add an attribute to the `NGLFeature.attributes` property.
 */
@property (nonatomic, copy, nullable) NSString *subtitle;

#if !TARGET_OS_IPHONE

/**
 The tooltip of the shape annotation.

 The default value of this property is `nil`.

 This property is ignored when the shape is used in an `NGLShapeSource`.
 */
@property (nonatomic, copy, nullable) NSString *toolTip;

#endif

#pragma mark Creating GeoJSON Data

/**
 Returns the GeoJSON string representation of the shape encapsulated in a data
 object.

 @param encoding The string encoding to use.
 @return A data object containing the shape’s GeoJSON string representation.
 */
- (NSData *)geoJSONDataUsingEncoding:(NSStringEncoding)encoding;

@end

NS_ASSUME_NONNULL_END
