#import "NGLFeature.h"
#import "NGLFoundation.h"
#import "NGLTileSource.h"

NS_ASSUME_NONNULL_BEGIN

/**
 `NGLVectorTileSource` is a map content source that supplies tiled vector data
 in <a href="https://www.nbmap.com/vector-tiles/">Nbmap Vector Tile</a> format
 to be shown on the map. The location of and metadata about the tiles are
 defined either by an option dictionary or by an external file that conforms to
 the
 <a href="https://github.com/nbmap/tilejson-spec/">TileJSON specification</a>.
 A vector tile source is added to an `NGLStyle` object along with one or more
 `NGLVectorStyleLayer` objects. A vector style layer defines the appearance of
 any content supplied by the vector tile source.
 
 `NGLVectorTileSource` is optimized for data sets that are too large to fit
 completely in memory, such as vector tile sets or data sets managed in
 <a href="https://www.nbmap.com/studio/">Nbmap Studio</a>. For
 <a href="http://geojson.org/">GeoJSON</a> data, use the `NGLShapeSource`
 class. For tiled data that changes dynamically, the `NGLComputedShapeSource`
 class may be a suitable alternative.

 Each
 <a href="https://www.nbmap.com/nbmap-gl-style-spec/#sources-vector"><code>vector</code></a>
 source defined by the style JSON file is represented at runtime by an
 `NGLVectorTileSource` object that you can use to initialize new style layers.
 You can also add and remove sources dynamically using methods such as
 `-[NGLStyle addSource:]` and `-[NGLStyle sourceWithIdentifier:]`.

 Within each vector tile, each geometric coordinate must lie between
 −1&nbsp;×&nbsp;<var>extent</var> and
 (<var>extent</var>&nbsp;×&nbsp;2)&nbsp;−&nbsp;1, inclusive. Any vector style
 layer initialized with a vector tile source must have a non-`nil` value in its
 `sourceLayerIdentifier` property.
 
 Commonly used vector tile sources include
 <a href="https://www.nbmap.com/vector-tiles/nbmap-streets/">Nbmap Streets</a>,
 <a href="https://www.nbmap.com/vector-tiles/nbmap-terrain/">Nbmap Terrain</a>,
 and
 <a href="https://www.nbmap.com/vector-tiles/nbmap-traffic-v1/">Nbmap Traffic</a>.

 ### Example

 ```swift
 let source = NGLVectorTileSource(identifier: "pois", tileURLTemplates: ["https://example.com/vector-tiles/{z}/{x}/{y}.mvt"], options: [
     .minimumZoomLevel: 9,
     .maximumZoomLevel: 16,
     .attributionInfos: [
         NGLAttributionInfo(title: NSAttributedString(string: "© Nbmap"), url: URL(string: "https://nbmap.com"))
     ]
 ])
 mapView.style?.addSource(source)
 ```
 
 #### Related examples
 See the <a href="https://docs.nbmap.com/ios/maps/examples/dds-circle-layer/">
 Data-driven circles</a> example to learn how to add data to your map using
 an `NGLVectorTileSource` object.
 */
NGL_EXPORT
@interface NGLVectorTileSource : NGLTileSource

#pragma mark Initializing a Source

/**
 Returns a vector tile source initialized with an identifier and configuration
 URL.

 After initializing and configuring the source, add it to a map view’s style
 using the `-[NGLStyle addSource:]` method.

 The URL may be a full HTTP or HTTPS URL or, for tilesets hosted by Nbmap, a
 Nbmap URL indicating a tileset ID (`nbmap://<tilesetid>`). The URL should
 point to a JSON file that conforms to the
 <a href="https://github.com/nbmap/tilejson-spec/">TileJSON specification</a>.

 @param identifier A string that uniquely identifies the source in the style to
    which it is added.
 @param configurationURL A URL to a TileJSON configuration file describing the
    source’s contents and other metadata.
 @return An initialized vector tile source.
 */
- (instancetype)initWithIdentifier:(NSString *)identifier configurationURL:(NSURL *)configurationURL NS_DESIGNATED_INITIALIZER;

/**
 Returns a vector tile source initialized an identifier, tile URL templates, and
 options.

 Tile URL templates are strings that specify the URLs of the vector tiles to
 load. See the “<a href="../tile-url-templates.html">Tile URL Templates</a>”
 guide for information about the format of a tile URL template.

 After initializing and configuring the source, add it to a map view’s style
 using the `-[NGLStyle addSource:]` method.

 @param identifier A string that uniquely identifies the source in the style to
    which it is added.
 @param tileURLTemplates An array of tile URL template strings. Only the first
    string is used; any additional strings are ignored.
 @param options A dictionary containing configuration options. See
    `NGLTileSourceOption` for available keys and values. Pass in `nil` to use
    the default values.
 @return An initialized tile source.
 */
- (instancetype)initWithIdentifier:(NSString *)identifier tileURLTemplates:(NSArray<NSString *> *)tileURLTemplates options:(nullable NSDictionary<NGLTileSourceOption, id> *)options NS_DESIGNATED_INITIALIZER;

#pragma mark Accessing a Source’s Content

/**
 Returns an array of map features loaded by this source, restricted to the given
 source layers and filtered by the given predicate.

 Each object in the returned array represents a feature loaded by the source and
 provides access to attributes specified as part of the loaded feature. The
 source loads a feature if the source is added to an `NGLMapView`’s style; that
 style has a layer that uses the source; and the map view has recently scrolled
 to the region containing the feature.

 Features come from tiled vector data that is converted to tiles internally, so
 feature geometries are clipped at tile boundaries and features may appear
 duplicated across tiles. For example, suppose part of a lengthy polyline
 representing a road has recently scrolled into view. The resulting array
 includes those parts of the road that lie within the map tiles that the source
 has loaded, even if the road extends into other tiles. The portion of the road
 within each map tile is included individually.
 
 Returned features may not necessarily be visible to the user at the time they
 are loaded: the style may contain a layer that forces the source’s tiles to
 load but filters out the features in question, preventing them from being
 drawn. To obtain only _visible_ features, use the
 `-[NGLMapView visibleFeaturesAtPoint:inStyleLayersWithIdentifiers:predicate:]`
 or
 `-[NGLMapView visibleFeaturesInRect:inStyleLayersWithIdentifiers:predicate:]`
 method.

 @param sourceLayerIdentifiers The source layers to include in the query. Only
    the features contained in these source layers are included in the returned
    array. This array may not be empty.
 @param predicate A predicate to filter the returned features. Use `nil` to
    include all loaded features.
 @return An array of objects conforming to the `NGLFeature` protocol that
    represent features loaded by the source that match the predicate.
 */
- (NSArray<id <NGLFeature>> *)featuresInSourceLayersWithIdentifiers:(NSSet<NSString *> *)sourceLayerIdentifiers predicate:(nullable NSPredicate *)predicate NS_SWIFT_NAME(features(sourceLayerIdentifiers:predicate:));

@end

NS_ASSUME_NONNULL_END
