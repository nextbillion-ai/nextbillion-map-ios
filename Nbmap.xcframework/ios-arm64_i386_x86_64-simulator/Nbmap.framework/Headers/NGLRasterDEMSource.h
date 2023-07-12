#import "NGLFoundation.h"

#import "NGLRasterTileSource.h"

/**
 An `NSNumber` object containing an unsigned integer that specifies the encoding
 formula for raster-dem tilesets. The integer corresponds to one of
 the constants described in `NGLDEMEncoding`.
 
 The default value for this option is `NGLDEMEncodingNbmap`.
 
 This option cannot be represented in a TileJSON or style JSON file. It is used
 with the `NGLRasterDEMSource` class and is ignored when creating an
 `NGLRasterTileSource` or `NGLVectorTileSource` object.
 */
FOUNDATION_EXTERN NGL_EXPORT const NGLTileSourceOption NGLTileSourceOptionDEMEncoding;

/**
 `NGLRasterDEMSource` is a map content source that supplies rasterized
 <a href="https://en.wikipedia.org/wiki/Digital_elevation_model">digital elevation model</a>
 (DEM) tiles to be shown on the map. The location of and metadata about the
 tiles are defined either by an option dictionary or by an external file that
 conforms to the
 <a href="https://github.com/nbmap/tilejson-spec/">TileJSON specification</a>.
 A raster DEM source is added to an `NGLStyle` object along with one or more
 `NGLHillshadeStyleLayer` objects. Use a hillshade style layer to control the
 appearance of content supplied by the raster DEM source.

 Each
 <a href="https://www.nbmap.com/nbmap-gl-style-spec/#sources-raster-dem"><code>raster-dem</code></a>
 source defined by the style JSON file is represented at runtime by an
 `NGLRasterDEMSource` object that you can use to initialize new style layers.
 You can also add and remove sources dynamically using methods such as
 `-[NGLStyle addSource:]` and `-[NGLStyle sourceWithIdentifier:]`.
 
 Currently, raster DEM sources only support the format used by
 <a href="https://docs.nbmap.com/help/troubleshooting/access-elevation-data/#nbmap-terrain-rgb">Nbmap Terrain-RGB</a>.

 ### Example

 ```swift
 let terrainRGBURL = URL(string: "nbmap://nbmap.terrain-rgb")!
 let source = NGLRasterDEMSource(identifier: "hills", configurationURL: terrainRGBURL)
 mapView.style?.addSource(source)
 ```
 */
NGL_EXPORT
@interface NGLRasterDEMSource : NGLRasterTileSource

@end
