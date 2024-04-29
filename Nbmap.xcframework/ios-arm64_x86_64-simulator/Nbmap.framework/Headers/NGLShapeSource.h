#import "NGLFoundation.h"
#import "NGLTypes.h"
#import "NGLSource.h"

NS_ASSUME_NONNULL_BEGIN

@protocol NGLFeature;
@class NGLPointFeature;
@class NGLPointFeatureCluster;
@class NGLShape;

/**
 Options for `NGLShapeSource` objects.
 */
typedef NSString *NGLShapeSourceOption NS_STRING_ENUM;

/**
 An `NSNumber` object containing a Boolean enabling or disabling clustering.
 If the `shape` property contains point shapes, setting this option to
 `YES` clusters the points by radius into groups. The default value is `NO`.
 
 This option corresponds to the
 <a href="https://www.nbmap.com/nbmap-gl-style-spec/#sources-geojson-cluster"><code>cluster</code></a>
 source property in the Nbmap Style Specification.
 
 This option only affects point features within an `NGLShapeSource` object; it
 is ignored when creating an `NGLComputedShapeSource` object.

 #### Related examples
 See the <a href="https://docs.nbmap.com/ios/maps/examples/clustering/">Cluster point data</a> and <a href="https://docs.nbmap.com/ios/maps/examples/clustering-with-images/">Use images to cluster point data</a> examples to learn how to cluster point data with this `NGLShapeSourceOption`.
 */
FOUNDATION_EXTERN NGL_EXPORT const NGLShapeSourceOption NGLShapeSourceOptionClustered;

/**
 An `NSNumber` object containing an integer; specifies the radius of each
 cluster if clustering is enabled. A value of 512 produces a radius equal to
 the width of a tile. The default value is 50.
 
 This option only affects point features within an `NGLShapeSource` object; it
 is ignored when creating an `NGLComputedShapeSource` object.
 */
FOUNDATION_EXTERN NGL_EXPORT const NGLShapeSourceOption NGLShapeSourceOptionClusterRadius;

/**
 An `NSDictionary` object where the key is an `NSString`. The dictionary key will
 be the feature attribute key. The resulting attribute value is
 aggregated from the clustered points. The dictionary value is an `NSArray`
 consisting of two `NSExpression` objects.

 The first object determines how the attribute values are accumulated from the
 cluster points. It is an `NSExpression` with an expression function that accepts
 two or more arguments, such as `sum` or `max`. The arguments should be
 `featureAccumulated` and the previously defined feature attribute key. The
 resulting value is assigned to the specified attribute key.

 The second `NSExpression` in the array determines which
 attribute values are accessed from individual features within a cluster.

 ```swift
 let firstExpression = NSExpression(format: "sum:({$featureAccumulated, sumValue})")
 let secondExpression = NSExpression(forKeyPath: "magnitude")
 let clusterPropertiesDictionary = ["sumValue" : [firstExpression, secondExpression]]
 
 let options : [NGLShapeSourceOption : Any] = [.clustered : true,
                                            .clusterProperties: clusterPropertiesDictionary]
 ```

 This option corresponds to the
 <a href="https://www.nbmap.com/nbmap-gl-style-spec/#sources-geojson-clusterProperties"><code>clusterProperties</code></a>
 source property in the Nbmap Style Specification.

 This option only affects point features within an `NGLShapeSource` object; it
 is ignored when creating an `NGLComputedShapeSource` object.
 */
FOUNDATION_EXTERN NGL_EXPORT const NGLShapeSourceOption NGLShapeSourceOptionClusterProperties;
/**
 An `NSNumber` object containing an integer; specifies the maximum zoom level at
 which to cluster points if clustering is enabled. Defaults to one zoom level
 less than the value of `NGLShapeSourceOptionMaximumZoomLevel` so that, at the
 maximum zoom level, the shapes are not clustered.
 
 This option corresponds to the
 <a href="https://www.nbmap.com/nbmap-gl-style-spec/#sources-geojson-clusterMaxZoom"><code>clusterMaxZoom</code></a>
 source property in the Nbmap Style Specification.
 
 This option only affects point features within an `NGLShapeSource` object; it
 is ignored when creating an `NGLComputedShapeSource` object.
 */
FOUNDATION_EXTERN NGL_EXPORT const NGLShapeSourceOption NGLShapeSourceOptionMaximumZoomLevelForClustering;

/**
 An `NSNumber` object containing an integer; specifies the minimum zoom level at
 which to create vector tiles. The default value is 0.

 This option corresponds to the
 <a href="https://www.nbmap.com/nbmap-gl-style-spec/#sources-geojson-minzoom"><code>minzoom</code></a>
 source property in the Nbmap Style Specification.
 */
FOUNDATION_EXTERN NGL_EXPORT const NGLShapeSourceOption NGLShapeSourceOptionMinimumZoomLevel;

/**
 An `NSNumber` object containing an integer; specifies the maximum zoom level at
 which to create vector tiles. A greater value produces greater detail at high
 zoom levels. The default value is 18.
 
 This option corresponds to the
 <a href="https://www.nbmap.com/nbmap-gl-style-spec/#sources-geojson-maxzoom"><code>maxzoom</code></a>
 source property in the Nbmap Style Specification.
 */
FOUNDATION_EXTERN NGL_EXPORT const NGLShapeSourceOption NGLShapeSourceOptionMaximumZoomLevel;

/**
 An `NSNumber` object containing an integer; specifies the size of the tile
 buffer on each side. A value of 0 produces no buffer. A value of 512 produces a
 buffer as wide as the tile itself. Larger values produce fewer rendering
 artifacts near tile edges and slower performance. The default value is 128.
 
 This option corresponds to the
 <a href="https://www.nbmap.com/nbmap-gl-style-spec/#sources-geojson-buffer"><code>buffer</code></a>
 source property in the Nbmap Style Specification.
 */
FOUNDATION_EXTERN NGL_EXPORT const NGLShapeSourceOption NGLShapeSourceOptionBuffer;

/**
 An `NSNumber` object containing a double; specifies the Douglas-Peucker
 simplification tolerance. A greater value produces simpler geometries and
 improves performance. The default value is 0.375.
 
 This option corresponds to the
 <a href="https://www.nbmap.com/nbmap-gl-style-spec/#sources-geojson-tolerance"><code>tolerance</code></a>
 source property in the Nbmap Style Specification.
 */
FOUNDATION_EXTERN NGL_EXPORT const NGLShapeSourceOption NGLShapeSourceOptionSimplificationTolerance;

/**
 An `NSNumber` object containing a Boolean enabling or disabling calculating line distance metrics. 
 
 Set this property to `YES` in order for the `NGLLineStyleLayer.lineGradient` property to have its intended effect.
 The default value is `NO`.
 
 This option corresponds to the
 <a href="https://www.nbmap.com/nbmap-gl-js/style-spec/#sources-geojson-lineMetrics"><code>lineMetrics</code></a>
 source property in the Nbmap Style Specification.
 */
FOUNDATION_EXTERN NGL_EXPORT const NGLShapeSourceOption NGLShapeSourceOptionLineDistanceMetrics;

/**
 `NGLShapeSource` is a map content source that supplies vector shapes to be
 shown on the map. The shapes may be instances of `NGLShape` or `NGLFeature`,
 or they may be defined by local or external
 <a href="http://geojson.org/">GeoJSON</a> code. A shape source is added to an
 `NGLStyle` object along with an `NGLVectorStyleLayer` object. The vector style
 layer defines the appearance of any content supplied by the shape source. You
 can update a shape source by setting its `shape` or `URL` property.
 
 `NGLShapeSource` is optimized for data sets that change dynamically and fit
 completely in memory. For large data sets that do not fit completely in memory,
 use the `NGLComputedShapeSource` or `NGLVectorTileSource` class.

 Each
 <a href="https://www.nbmap.com/nbmap-gl-style-spec/#sources-geojson"><code>geojson</code></a>
 source defined by the style JSON file is represented at runtime by an
 `NGLShapeSource` object that you can use to refine the map’s content and
 initialize new style layers. You can also add and remove sources dynamically
 using methods such as `-[NGLStyle addSource:]` and
 `-[NGLStyle sourceWithIdentifier:]`.

 Any vector style layer initialized with a shape source should have a `nil`
 value in its `sourceLayerIdentifier` property.

 ### Example

 ```swift
 var coordinates: [CLLocationCoordinate2D] = [
     CLLocationCoordinate2D(latitude: 37.77, longitude: -122.42),
     CLLocationCoordinate2D(latitude: 38.91, longitude: -77.04),
 ]
 let polyline = NGLPolylineFeature(coordinates: &coordinates, count: UInt(coordinates.count))
 let source = NGLShapeSource(identifier: "lines", features: [polyline], options: nil)
 mapView.style?.addSource(source)
 ```
 
 #### Related examples
 See the <a href="https://docs.nbmap.com/ios/maps/examples/clustering/">Cluster point data</a>, <a href="https://docs.nbmap.com/ios/maps/examples/clustering-with-images/">Use images to cluster point data</a>, and <a href="https://docs.nbmap.com/ios/maps/examples/live-data/">Add live data</a> examples to learn how to add data to your map using this `NGLSource` object.
 */
NGL_EXPORT
@interface NGLShapeSource : NGLSource

#pragma mark Initializing a Source

/**
 Returns a shape source with an identifier, URL, and dictionary of options for
 the source.
 
 This class supports the following options: `NGLShapeSourceOptionClustered`,
 `NGLShapeSourceOptionClusterRadius`,
 `NGLShapeSourceOptionMaximumZoomLevelForClustering`,
 `NGLShapeSourceOptionMinimumZoomLevel`, `NGLShapeSourceOptionMaximumZoomLevel`,
 `NGLShapeSourceOptionBuffer`, and
 `NGLShapeSourceOptionSimplificationTolerance`. Shapes provided by a shape
 source are not clipped or wrapped automatically.

 @param identifier A string that uniquely identifies the source.
 @param url An HTTP(S) URL, absolute file URL, or local file URL relative to the
    current application’s resource bundle.
 @param options An `NSDictionary` of options for this source.
 @return An initialized shape source.
 
 #### Related examples
 See the <a href="https://docs.nbmap.com/ios/maps/examples/live-data/">
 Add live data</a> example to learn how to add live data to your map by
 updating the an `NGLShapeSource` object's `URL` property.
 */
- (instancetype)initWithIdentifier:(NSString *)identifier URL:(NSURL *)url options:(nullable NSDictionary<NGLShapeSourceOption, id> *)options NS_DESIGNATED_INITIALIZER;

/**
 Returns a shape source with an identifier, a shape, and dictionary of options
 for the source.
 
 This class supports the following options: `NGLShapeSourceOptionClustered`,
 `NGLShapeSourceOptionClusterRadius`,
 `NGLShapeSourceOptionMaximumZoomLevelForClustering`,
 `NGLShapeSourceOptionMinimumZoomLevel`, `NGLShapeSourceOptionMaximumZoomLevel`,
 `NGLShapeSourceOptionBuffer`, and
 `NGLShapeSourceOptionSimplificationTolerance`. Shapes provided by a shape
 source are not clipped or wrapped automatically.

 To specify attributes about the shape, use an instance of an `NGLShape`
 subclass that conforms to the `NGLFeature` protocol, such as `NGLPointFeature`.
 To include multiple shapes in the source, use an `NGLShapeCollection` or
 `NGLShapeCollectionFeature` object, or use the
 `-initWithIdentifier:features:options:` or
 `-initWithIdentifier:shapes:options:` methods.

 To create a shape from GeoJSON source code, use the
 `+[NGLShape shapeWithData:encoding:error:]` method.

 @param identifier A string that uniquely identifies the source.
 @param shape A concrete subclass of `NGLShape`
 @param options An `NSDictionary` of options for this source.
 @return An initialized shape source.
 
 #### Related examples
 See the <a href="https://docs.nbmap.com/ios/maps/examples/runtime-animate-line/">
 Animate a line</a> example to learn how to animate line data by continously
 updating an `NGLShapeSource`'s `shape` attribute.
 */
- (instancetype)initWithIdentifier:(NSString *)identifier shape:(nullable NGLShape *)shape options:(nullable NSDictionary<NGLShapeSourceOption, id> *)options NS_DESIGNATED_INITIALIZER;

/**
 Returns a shape source with an identifier, an array of features, and a dictionary
 of options for the source.
 
 This class supports the following options: `NGLShapeSourceOptionClustered`,
 `NGLShapeSourceOptionClusterRadius`,
 `NGLShapeSourceOptionMaximumZoomLevelForClustering`,
 `NGLShapeSourceOptionMinimumZoomLevel`, `NGLShapeSourceOptionMaximumZoomLevel`,
 `NGLShapeSourceOptionBuffer`, and
 `NGLShapeSourceOptionSimplificationTolerance`. Shapes provided by a shape
 source are not clipped or wrapped automatically.

 Unlike `-initWithIdentifier:shapes:options:`, this method accepts `NGLFeature`
 instances, such as `NGLPointFeature` objects, whose attributes you can use when
 applying a predicate to `NGLVectorStyleLayer` or configuring a style layer’s
 appearance.

 To create a shape from GeoJSON source code, use the
 `+[NGLShape shapeWithData:encoding:error:]` method.

 @param identifier A string that uniquely identifies the source.
 @param features An array of objects that conform to the NGLFeature protocol.
 @param options An `NSDictionary` of options for this source.
 @return An initialized shape source.
 */
- (instancetype)initWithIdentifier:(NSString *)identifier features:(NSArray<NGLShape<NGLFeature> *> *)features options:(nullable NSDictionary<NGLShapeSourceOption, id> *)options;

/**
 Returns a shape source with an identifier, an array of shapes, and a dictionary of
 options for the source.
 
 This class supports the following options: `NGLShapeSourceOptionClustered`,
 `NGLShapeSourceOptionClusterRadius`,
 `NGLShapeSourceOptionMaximumZoomLevelForClustering`,
 `NGLShapeSourceOptionMinimumZoomLevel`, `NGLShapeSourceOptionMaximumZoomLevel`,
 `NGLShapeSourceOptionBuffer`, and
 `NGLShapeSourceOptionSimplificationTolerance`. Shapes provided by a shape
 source are not clipped or wrapped automatically.

 Any `NGLFeature` instance passed into this initializer is treated as an ordinary
 shape, causing any attributes to be inaccessible to an `NGLVectorStyleLayer` when
 evaluating a predicate or configuring certain layout or paint attributes. To
 preserve the attributes associated with each feature, use the
 `-initWithIdentifier:features:options:` method instead.

 To create a shape from GeoJSON source code, use the
 `+[NGLShape shapeWithData:encoding:error:]` method.

 @param identifier A string that uniquely identifies the source.
 @param shapes An array of shapes; each shape is a member of a concrete subclass of NGLShape.
 @param options An `NSDictionary` of options for this source.
 @return An initialized shape source.
 */
- (instancetype)initWithIdentifier:(NSString *)identifier shapes:(NSArray<NGLShape *> *)shapes options:(nullable NSDictionary<NGLShapeSourceOption, id> *)options;

#pragma mark Accessing a Source’s Content

/**
 The contents of the source. A shape can represent a GeoJSON geometry, a
 feature, or a collection of features.

 If the receiver was initialized using `-initWithIdentifier:URL:options:`, this
 property is set to `nil`. This property is unavailable until the receiver is
 passed into `-[NGLStyle addSource:]`.

 You can get/set the shapes within a collection via this property. Actions must
 be performed on the application's main thread.
 */
@property (nonatomic, copy, nullable) NGLShape *shape;

/**
 The URL to the GeoJSON document that specifies the contents of the source.

 If the receiver was initialized using `-initWithIdentifier:shape:options:`,
 this property is set to `nil`.
 */
@property (nonatomic, copy, nullable) NSURL *URL;

/**
 Returns an array of map features for this source, filtered by the given
 predicate.

 Each object in the returned array represents a feature for the current style
 and provides access to attributes specified via the `shape` property.

 Features come from tiled GeoJSON data that is converted to tiles internally,
 so feature geometries are clipped at tile boundaries and features
 may appear duplicated across tiles. For example, suppose this source contains a
 long polyline representing a road. The resulting array includes those parts of
 the road that lie within the map tiles that the source has loaded, even if the
 road extends into other tiles. The portion of the road within each map tile is
 included individually.
 
 Returned features may not necessarily be visible to the user at the time they
 are loaded: the style may lack a layer that draws the features in question. To
 obtain only _visible_ features, use the
 `-[NGLMapView visibleFeaturesAtPoint:inStyleLayersWithIdentifiers:predicate:]`
 or
 `-[NGLMapView visibleFeaturesInRect:inStyleLayersWithIdentifiers:predicate:]`
 method.

 @param predicate A predicate to filter the returned features. Use `nil` to
    include all features in the source.
 @return An array of objects conforming to the `NGLFeature` protocol that
    represent features in the source that match the predicate.
 */
- (NSArray<id <NGLFeature>> *)featuresMatchingPredicate:(nullable NSPredicate *)predicate;

/**
 Returns an array of map features that are the leaves of the specified cluster.
 ("Leaves" are the original points that belong to the cluster.)
 
 This method supports pagination; you supply an offset (number of features to skip)
 and a maximum number of features to return.
 
 @param cluster An object of type `NGLPointFeatureCluster` (that conforms to the `NGLCluster` protocol).
 @param offset Number of features to skip.
 @param limit The maximum number of features to return
 
 @return An array of objects that conform to the `NGLFeature` protocol.
 */
- (NSArray<id <NGLFeature>> *)leavesOfCluster:(NGLPointFeatureCluster *)cluster offset:(NSUInteger)offset limit:(NSUInteger)limit;

/**
 Returns an array of map features that are the immediate children of the specified
 cluster *on the next zoom level*. The may include features that also conform to
 the `NGLCluster` protocol (currently only objects of type `NGLPointFeatureCluster`).
 
 @param cluster An object of type `NGLPointFeatureCluster` (that conforms to the `NGLCluster` protocol).
 
 @return An array of objects that conform to the `NGLFeature` protocol.
 
 @note The returned array may contain the `cluster` that was passed in, if the next
    zoom level doesn't match the zoom level for expanding that cluster. See
    `-[NGLShapeSource zoomLevelForExpandingCluster:]`.
 */
- (NSArray<id<NGLFeature>> *)childrenOfCluster:(NGLPointFeatureCluster *)cluster;

/**
 Returns the zoom level at which the given cluster expands.
 
 @param cluster An object of type `NGLPointFeatureCluster` (that conforms to the `NGLCluster` protocol).
 
 @return Zoom level. This should be >= 0; any negative return value should be
    considered an error.
 */
- (double)zoomLevelForExpandingCluster:(NGLPointFeatureCluster *)cluster;

@end

NS_ASSUME_NONNULL_END
