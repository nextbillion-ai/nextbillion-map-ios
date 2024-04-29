#import "NGLSource.h"

#import "NGLFoundation.h"
#import "NGLTypes.h"
#import "NGLGeometry.h"

NS_ASSUME_NONNULL_BEGIN

NGL_EXPORT
/**
 `NGLImageSource` is a content source that is used for a georeferenced raster
 image to be shown on the map. The georeferenced image scales and rotates as the
 user zooms and rotates the map. Images may also be used as icons or patterns 
 in a style layer. To register an image for use as an icon or pattern, 
 use the `-[NGLStyle setImage:forName:]` method. To configure a point 
 annotation’s image, use the `NGLAnnotationImage` class.
 
 The geographic location of the raster image content, supplied with 
 `NGLCoordinateQuad`, can be non-axis aligned.
 `NGLImageSource` supports raster content from `NSURL`, `NSImage` (macOS), or 
 `UIImage` (iOS).
 An image source is added to an `NGLStyle` object along with one or more
 `NGLRasterStyleLayer` objects. Use a raster style layer to control the
 appearance of content supplied by the image source.
 
 Each
 <a href="https://www.nbmap.com/nbmap-gl-style-spec/#sources-image"><code>image</code></a>
 source defined by the style JSON file is represented at runtime by an
 `NGLImageSource` object that you can use to initialize new style layers. You
 can also add and remove sources dynamically using methods such as
 `-[NGLStyle addSource:]` and `-[NGLStyle sourceWithIdentifier:]`.

 ### Example

 ```swift
 let coordinates = NGLCoordinateQuad(
   topLeft: CLLocationCoordinate2D(latitude: 46.437, longitude: -80.425),
   bottomLeft: CLLocationCoordinate2D(latitude: 37.936, longitude: -80.425),
   bottomRight: CLLocationCoordinate2D(latitude: 37.936, longitude: -71.516),
   topRight: CLLocationCoordinate2D(latitude: 46.437, longitude: -71.516))
 let source = NGLImageSource(identifier: "radar", coordinateQuad: coordinates, url: URL(string: "https://www.nbmap.com/nbmap-gl-js/assets/radar.gif")!)
 mapView.style?.addSource(source)
 ```
 
 #### Related examples
 See the <a href="https://docs.nbmap.com/ios/maps/examples/image-source/">
 Add an image</a> example to learn how to add an image to your map using
 `NGLImageSource`.
 */
NGL_EXPORT
@interface NGLImageSource : NGLSource

#pragma mark Initializing a Source

/**
 Returns a georeferenced image source with an identifier, coordinates and a URL.

 @param identifier A string that uniquely identifies the source.
 @param coordinateQuad the top left, top right, bottom right, and bottom left coordinates for the image.
 @param url An HTTP(S) URL, absolute file URL, or local file URL relative to the
    current application’s resource bundle.
 @return An initialized shape source.
 */
- (instancetype)initWithIdentifier:(NSString *)identifier coordinateQuad:(NGLCoordinateQuad)coordinateQuad URL:(NSURL *)url;

/**
 Returns a georeferenced image source with an identifier, coordinates and an image.

 @param identifier A string that uniquely identifies the source.
 @param coordinateQuad The top left, top right, bottom right, and bottom left coordinates for the image.
 @param image The image to display for the source.
 @return An initialized shape source.
 */
- (instancetype)initWithIdentifier:(NSString *)identifier coordinateQuad:(NGLCoordinateQuad)coordinateQuad image:(NGLImage *)image;

#pragma mark Accessing a Source’s Content

/**
 The URL to the source image.

 If the receiver was initialized using `-initWithIdentifier:coordinateQuad:image:` or
 the `image` property is set, this property is set to `nil`.
 */
@property (nonatomic, copy, nullable)NSURL *URL;

/**
 The source image.

 If the receiver was initialized using `-initWithIdentifier:coordinateQuad:URL:` or if the `URL` property is set, this property is set to `nil`.
 */
@property (nonatomic, retain, nullable)NGLImage *image;

/**
 The coordinates at which the corners of the source image will be placed.
 */
@property (nonatomic) NGLCoordinateQuad coordinates;
@end

NS_ASSUME_NONNULL_END
