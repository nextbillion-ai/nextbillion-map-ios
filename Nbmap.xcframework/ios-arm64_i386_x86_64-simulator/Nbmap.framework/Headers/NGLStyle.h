#import <Foundation/Foundation.h>

#import "NGLFoundation.h"
#import "NGLStyleLayer.h"

#import "NGLTypes.h"

@class NGLSource;
@class NGLLight;

NS_ASSUME_NONNULL_BEGIN

/**
 A version number identifying the default version of the Nbmap Streets style
 obtained through the `NGLStyle.streetsStyleURL` method. This version number may also be
 passed into the `+[NGLStyle streetsStyleURLWithVersion:]` method.

 The value of this constant generally corresponds to the latest released version
 as of the date on which this SDK was published. You can use this constant to
 ascertain the style used by `NGLMapView` and `NGLTilePyramidOfflineRegion` when
 no style URL is specified. Consult the
 <a href="https://docs.nbmap.com/api/maps/#styles">Nbmap Styles API documentation</a>
 for the most up-to-date style versioning information.

 @warning The value of this constant may change in a future release of the SDK.
    If you use any feature that depends on a specific aspect of a default style
    — for instance, the minimum zoom level that includes roads — you may use the
    current value of this constant or the underlying style URL, but do not use
    the constant itself. Such details may change significantly from version to
    version.
 */
static NGL_EXPORT const NSInteger NGLStyleDefaultVersion = 11;

FOUNDATION_EXTERN NGL_EXPORT NGLExceptionName const NGLInvalidStyleURLException;
FOUNDATION_EXTERN NGL_EXPORT NGLExceptionName const NGLRedundantLayerException;
FOUNDATION_EXTERN NGL_EXPORT NGLExceptionName const NGLRedundantLayerIdentifierException;
FOUNDATION_EXTERN NGL_EXPORT NGLExceptionName const NGLRedundantSourceException;
FOUNDATION_EXTERN NGL_EXPORT NGLExceptionName const NGLRedundantSourceIdentifierException;

/**
 The proxy object for the current map style.

 NGLStyle provides a set of convenience methods for changing Nbmap
 default styles using `NGLMapView.styleURL`.
 <a href="https://www.nbmap.com/maps/">Learn more about Nbmap default styles</a>.

 It is also possible to directly manipulate the current map style
 via `NGLMapView.style` by updating the style's data sources or layers.

 @note Wait until the map style has finished loading before modifying a map's
    style via any of the `NGLStyle` instance methods below. You can use the
    `-[NGLMapViewDelegate mapView:didFinishLoadingStyle:]` or
    `-[NGLMapViewDelegate mapViewDidFinishLoadingMap:]` methods as indicators
    that it's safe to modify the map's style.

 #### Related examples
 See the <a href="https://docs.nbmap.com/ios/maps/examples/default-styles/">
 Default styles</a> example to learn how to initialize an `NGLMapView` object
 with a Nbmap default style using `NGLStyle`'s class methods.
 */
NGL_EXPORT
@interface NGLStyle : NSObject

#pragma mark Accessing Default Styles

/**
 Returns the URL to the current version of the
 <a href="https://www.nbmap.com/maps/streets/">Nbmap Streets</a> style as of
 publication.

 Streets is a general-purpose style with detailed road and transit networks.

 `NGLMapView` and `NGLTilePyramidOfflineRegion` use Nbmap Streets when no style
 is specified explicitly.

 @warning The return value may change in a future release of the SDK. If you use
    any feature that depends on a specific aspect of a default style — for
    instance, the minimum zoom level that includes roads — use the
    `+streetsStyleURLWithVersion:` method instead. Such details may change
    significantly from version to version.
 */
@property (class, nonatomic, readonly) NSURL *streetsStyleURL;

/**
 Returns the URL to the given version of the
 <a href="https://www.nbmap.com/maps/streets/">Nbmap Streets</a> style.

 Streets is a general-purpose style with detailed road and transit networks.

 `NGLMapView` and `NGLTilePyramidOfflineRegion` use Nbmap Streets when no style
 is specified explicitly.

 @param version A specific version of the style.
 */
+ (NSURL *)streetsStyleURLWithVersion:(NSInteger)version;

/**
 Returns the URL to the current version of the
 <a href="https://www.nbmap.com/maps/outdoors/">Nbmap Outdoors</a> style as of
 publication.

 Outdoors is a general-purpose style tailored to outdoor activities.

 @warning The return value may change in a future release of the SDK. If you use
    any feature that depends on a specific aspect of a default style — for
    instance, the minimum zoom level that includes roads — use the
    `+outdoorsStyleURLWithVersion:` method instead. Such details may change
    significantly from version to version.
 */
@property (class, nonatomic, readonly) NSURL *outdoorsStyleURL;

/**
 Returns the URL to the given version of the
 <a href="https://www.nbmap.com/maps/outdoors/">Nbmap Outdoors</a> style.

 Outdoors is a general-purpose style tailored to outdoor activities.

 @param version A specific version of the style.
 */
+ (NSURL *)outdoorsStyleURLWithVersion:(NSInteger)version;

/**
 Returns the URL to the current version of the
 <a href="https://www.nbmap.com/maps/light-dark/">Nbmap Light</a> style.

 Light is a subtle, light-colored backdrop for data visualizations.

 @warning The return value may change in a future release of the SDK. If you use
    any feature that depends on a specific aspect of a default style — for
    instance, the minimum zoom level that includes roads — use the
    `+lightStyleURLWithVersion:` method instead. Such details may change
    significantly from version to version.
 */
@property (class, nonatomic, readonly) NSURL *lightStyleURL;

/**
 Returns the URL to the given version of the
 <a href="https://www.nbmap.com/maps/light-dark/">Nbmap Light</a> style as of
 publication.

 Light is a subtle, light-colored backdrop for data visualizations.

 @param version A specific version of the style.
 */
+ (NSURL *)lightStyleURLWithVersion:(NSInteger)version;

/**
 Returns the URL to the current version of the
 <a href="https://www.nbmap.com/maps/light-dark/">Nbmap Dark</a> style.

 Dark is a subtle, dark-colored backdrop for data visualizations.

 @warning The return value may change in a future release of the SDK. If you use
    any feature that depends on a specific aspect of a default style — for
    instance, the minimum zoom level that includes roads — use the
    `+darkStyleURLWithVersion:` method instead. Such details may change
    significantly from version to version.
 */
@property (class, nonatomic, readonly) NSURL *darkStyleURL;

/**
 Returns the URL to the given version of the
 <a href="https://www.nbmap.com/maps/light-dark/">Nbmap Dark</a> style as of
 publication.

 Dark is a subtle, dark-colored backdrop for data visualizations.

 @param version A specific version of the style.
 */
+ (NSURL *)darkStyleURLWithVersion:(NSInteger)version;

/**
 Returns the URL to the current version of the
 <a href="https://www.nbmap.com/maps/satellite/">Nbmap Satellite</a> style.

 Satellite is high-resolution satellite and aerial imagery.

 @warning The return value may change in a future release of the SDK. If you use
    any feature that depends on a specific aspect of a default style — for
    instance, the raster tile sets included in the style — use the
    `+satelliteStyleURLWithVersion:` method instead. Such details may change
    significantly from version to version.

 #### Related example
 See the <a href="https://docs.nbmap.com/ios/maps/examples/satellite-style/">
 Satellite styles</a> example to learn how to initialize a map with the Nbmap
 Satellite style.
 */
@property (class, nonatomic, readonly) NSURL *satelliteStyleURL;

/**
 Returns the URL to the given version of the
 <a href="https://www.nbmap.com/maps/satellite/">Nbmap Satellite</a> style as
 of publication.

 Satellite is high-resolution satellite and aerial imagery.

 @param version A specific version of the style.
 */
+ (NSURL *)satelliteStyleURLWithVersion:(NSInteger)version;

/**
 Returns the URL to the current version of the
 <a href="https://www.nbmap.com/maps/satellite/">Nbmap Satellite Streets</a>
 style as of publication.

 Satellite Streets combines the high-resolution satellite and aerial imagery of
 Nbmap Satellite with unobtrusive labels and translucent roads from Nbmap
 Streets.

 @warning The return value may change in a future release of the SDK. If you use
    any feature that depends on a specific aspect of a default style — for
    instance, the minimum zoom level that includes roads — use the
    `+satelliteStreetsStyleURLWithVersion:` method instead. Such details may
    change significantly from version to version.

 #### Related example
 See the <a href="https://docs.nbmap.com/ios/maps/examples/satellite-style/">
 Satellite styles</a> example to learn how to initialize a map with the Nbmap
 Satellite Streets style.
 */
@property (class, nonatomic, readonly) NSURL *satelliteStreetsStyleURL;

/**
 Returns the URL to the given version of the
 <a href="https://www.nbmap.com/maps/satellite/">Nbmap Satellite Streets</a>
 style.

 Satellite Streets combines the high-resolution satellite and aerial imagery of
 Nbmap Satellite with unobtrusive labels and translucent roads from Nbmap
 Streets.

 @param version A specific version of the style.
 */
+ (NSURL *)satelliteStreetsStyleURLWithVersion:(NSInteger)version;

#pragma mark Accessing Metadata About the Style

/**
 The name of the style.

 You can customize the style’s name in Nbmap Studio.
 */
@property (readonly, copy, nullable) NSString *name;

#pragma mark Managing Sources

/**
 A set containing the style’s sources.
 */
@property (nonatomic, strong) NSSet<__kindof NGLSource *> *sources;

/**
 Values describing animated transitions to changes on a style's individual
 paint properties.
 */
@property (nonatomic) NGLTransition transition;

/**
 A boolean value indicating whether label placement transitions are enabled.

 The default value of this property is `YES`.
 */
@property (nonatomic, assign) BOOL performsPlacementTransitions;

/**
 Returns a source with the given identifier in the current style.

 @note Source identifiers are not guaranteed to exist across styles or different
    versions of the same style. Applications that use this API must first set the
    style URL to an explicitly versioned style using a convenience method like
    `+[NGLStyle outdoorsStyleURLWithVersion:]`, `NGLMapView`’s “Style URL”
    inspectable in Interface Builder, or a manually constructed `NSURL`. This
    approach also avoids source identifer name changes that will occur in the default
    style’s sources over time.

 @return An instance of a concrete subclass of `NGLSource` associated with the
    given identifier, or `nil` if the current style contains no such source.
 */
- (nullable NGLSource *)sourceWithIdentifier:(NSString *)identifier;

/**
 Adds a new source to the current style.

 @note Adding the same source instance more than once will result in a
    `NGLRedundantSourceException`. Reusing the same source identifier, even with
    different source instances, will result in a
    `NGLRedundantSourceIdentifierException`.

 @note Sources should be added in
    `-[NGLMapViewDelegate mapView:didFinishLoadingStyle:]` or
    `-[NGLMapViewDelegate mapViewDidFinishLoadingMap:]` to ensure that the map
    has loaded the style and is ready to accept a new source.

 @param source The source to add to the current style.
 */
- (void)addSource:(NGLSource *)source;

/**
 Removes a source from the current style.

 @note Source identifiers are not guaranteed to exist across styles or different
    versions of the same style. Applications that use this API must first set the
    style URL to an explicitly versioned style using a convenience method like
    `+[NGLStyle outdoorsStyleURLWithVersion:]`, `NGLMapView`’s “Style URL”
    inspectable in Interface Builder, or a manually constructed `NSURL`. This
    approach also avoids source identifer name changes that will occur in the default
    style’s sources over time.

 @param source The source to remove from the current style.
 */
- (void)removeSource:(NGLSource *)source;

/**
 Removes a source from the current style.

 @note Source identifiers are not guaranteed to exist across styles or different
 versions of the same style. Applications that use this API must first set the
 style URL to an explicitly versioned style using a convenience method like
 `+[NGLStyle outdoorsStyleURLWithVersion:]`, `NGLMapView`’s “Style URL”
 inspectable in Interface Builder, or a manually constructed `NSURL`. This
 approach also avoids source identifer name changes that will occur in the default
 style’s sources over time.

 @param source The source to remove from the current style.
 @param outError Upon return, if an error has occurred, a pointer to an `NSError`
 object describing the error. Pass in `NULL` to ignore any error.

 @return `YES` if `source` was removed successfully. If `NO`, `outError` contains
 an `NSError` object describing the problem.
 */
- (BOOL)removeSource:(NGLSource *)source error:(NSError * __nullable * __nullable)outError;


#pragma mark Managing Style Layers

/**
 The layers included in the style, arranged according to their back-to-front
 ordering on the screen.
 */
@property (nonatomic, strong) NSArray<__kindof NGLStyleLayer *> *layers;

/**
 Returns a style layer with the given identifier in the current style.

 @note Layer identifiers are not guaranteed to exist across styles or different
    versions of the same style. Applications that use this API must first set
    the style URL to an explicitly versioned style using a convenience method like
    `+[NGLStyle outdoorsStyleURLWithVersion:]`, `NGLMapView`’s “Style URL”
    inspectable in Interface Builder, or a manually constructed `NSURL`. This
    approach also avoids layer identifer name changes that will occur in the default
    style’s layers over time.

 @return An instance of a concrete subclass of `NGLStyleLayer` associated with
    the given identifier, or `nil` if the current style contains no such style
    layer.
 */
- (nullable NGLStyleLayer *)layerWithIdentifier:(NSString *)identifier;

/**
 Adds a new layer on top of existing layers.

 @note Adding the same layer instance more than once will result in a
    `NGLRedundantLayerException`. Reusing the same layer identifer, even with
    different layer instances, will also result in an exception.

 @note Layers should be added in
    `-[NGLMapViewDelegate mapView:didFinishLoadingStyle:]` or
    `-[NGLMapViewDelegate mapViewDidFinishLoadingMap:]` to ensure that the map
    has loaded the style and is ready to accept a new layer.

 @param layer The layer object to add to the map view. This object must be an
    instance of a concrete subclass of `NGLStyleLayer`.
 */
- (void)addLayer:(NGLStyleLayer *)layer;

/**
 Inserts a new layer into the style at the given index.

 @note Adding the same layer instance more than once will result in a
    `NGLRedundantLayerException`. Reusing the same layer identifer, even with
    different layer instances, will also result in an exception.

 @note Layers should be added in
    `-[NGLMapViewDelegate mapView:didFinishLoadingStyle:]` or
    `-[NGLMapViewDelegate mapViewDidFinishLoadingMap:]` to ensure that the map
    has loaded the style and is ready to accept a new layer.

 @param layer The layer to insert.
 @param index The index at which to insert the layer. An index of 0 would send
    the layer to the back; an index equal to the number of objects in the
    `layers` property would bring the layer to the front.
 */
- (void)insertLayer:(NGLStyleLayer *)layer atIndex:(NSUInteger)index;

/**
 Inserts a new layer below another layer.

 @note Layer identifiers are not guaranteed to exist across styles or different
    versions of the same style. Applications that use this API must first set
    the style URL to an explicitly versioned style using a convenience method like
    `+[NGLStyle outdoorsStyleURLWithVersion:]`, `NGLMapView`’s “Style URL”
    inspectable in Interface Builder, or a manually constructed `NSURL`. This
    approach also avoids layer identifer name changes that will occur in the default
    style’s layers over time.

    Inserting the same layer instance more than once will result in a
    `NGLRedundantLayerException`. Reusing the same layer identifer, even with
    different layer instances, will also result in an exception.

 @param layer The layer to insert.
 @param sibling An existing layer in the style.

 #### Related examples
 See the <a href="https://docs.nbmap.com/ios/maps/examples/shape-collection/">
 Add multiple shapes from a single shape source</a> example to learn how to
 add a layer to your map below an existing layer.
 */
- (void)insertLayer:(NGLStyleLayer *)layer belowLayer:(NGLStyleLayer *)sibling;

/**
 Inserts a new layer above another layer.

 @note Layer identifiers are not guaranteed to exist across styles or different
    versions of the same style. Applications that use this API must first set
    the style URL to an explicitly versioned style using a convenience method like
    `+[NGLStyle outdoorsStyleURLWithVersion:]`, `NGLMapView`’s “Style URL”
    inspectable in Interface Builder, or a manually constructed `NSURL`. This
    approach also avoids layer identifer name changes that will occur in the default
    style’s layers over time.

    Inserting the same layer instance more than once will result in a
    `NGLRedundantLayerException`. Reusing the same layer identifer, even with
    different layer instances, will also result in an exception.

 @param layer The layer to insert.
 @param sibling An existing layer in the style.

 #### Related examples
 See the <a href="https://docs.nbmap.com/ios/maps/examples/image-source/">
 Add an image</a> example to learn how to add a layer to your map above an
 existing layer.
 */
- (void)insertLayer:(NGLStyleLayer *)layer aboveLayer:(NGLStyleLayer *)sibling;

/**
 Removes a layer from the map view.

 @note Layer identifiers are not guaranteed to exist across styles or different
    versions of the same style. Applications that use this API must first set
    the style URL to an explicitly versioned style using a convenience method like
    `+[NGLStyle outdoorsStyleURLWithVersion:]`, `NGLMapView`’s “Style URL”
    inspectable in Interface Builder, or a manually constructed `NSURL`. This
    approach also avoids layer identifer name changes that will occur in the default
    style’s layers over time.

 @param layer The layer object to remove from the map view. This object
 must conform to the `NGLStyleLayer` protocol.
 */
- (void)removeLayer:(NGLStyleLayer *)layer;

#pragma mark Managing a Style’s Images

/**
 Returns the image associated with the given name in the style.

 @note Names and their associated images are not guaranteed to exist across
    styles or different versions of the same style. Applications that use this
    API must first set the style URL to an explicitly versioned style using a
    convenience method like `+[NGLStyle outdoorsStyleURLWithVersion:]`,
    `NGLMapView`’s “Style URL” inspectable in Interface Builder, or a manually
    constructed `NSURL`. This approach also avoids image name changes that will
    occur in the default style over time.

 @param name The name associated with the image you want to obtain.
 @return The image associated with the given name, or `nil` if no image is
    associated with that name.
 */
- (nullable NGLImage *)imageForName:(NSString *)name;

/**
 Adds or overrides an image used by the style’s layers.

 To use an image in a style layer, give it a unique name using this method, then
 set the `iconImageName` property of an `NGLSymbolStyleLayer` object to that
 name.

 @param image The image for the name.
 @param name The name of the image to set to the style.

 #### Related examples
 See the <a href="https://docs.nbmap.com/ios/maps/examples/clustering-with-images/">
 Use images to cluster point data</a> and <a href="https://docs.nbmap.com/ios/maps/examples/clustering/">
 Cluster point data</a> examples to learn how to add images to your map using
 an `NGLStyle` object.
 */
- (void)setImage:(NGLImage *)image forName:(NSString *)name;

/**
 Removes a name and its associated image from the style.

 @note Names and their associated images are not guaranteed to exist across
    styles or different versions of the same style. Applications that use this
    API must first set the style URL to an explicitly versioned style using a
    convenience method like `+[NGLStyle outdoorsStyleURLWithVersion:]`,
    `NGLMapView`’s “Style URL” inspectable in Interface Builder, or a manually
    constructed `NSURL`. This approach also avoids image name changes that will
    occur in the default style over time.

 @param name The name of the image to remove.
 */
- (void)removeImageForName:(NSString *)name;


#pragma mark Managing the Style's Light

/**
 Provides global light source for the style.
 */
@property (nonatomic, strong) NGLLight *light;

#pragma mark Localizing Map Content

/**
 Attempts to localize labels in the style into the given locale.

 This method automatically modifies the text property of any symbol style layer
 in the style whose source is the
 <a href="https://www.nbmap.com/vector-tiles/nbmap-streets-v8/#overview">Nbmap Streets source</a>.
 On iOS, the user can set the system’s preferred language in Settings, General
 Settings, Language & Region. On macOS, the user can set the system’s preferred
 language in the Language & Region pane of System Preferences.

 @param locale The locale into which labels should be localized. To use the
    system’s preferred language, if supported, specify `nil`. To use the local
    language, specify a locale with the identifier `mul`.
 */
- (void)localizeLabelsIntoLocale:(nullable NSLocale *)locale;

@end

/**
 An object whose contents are represented by an `NGLStyle` object that you
 configure.
 */
@protocol NGLStylable <NSObject>

/**
 The style currently displayed in the receiver.

 @note The default styles provided by Nbmap contain sources and layers with
    identifiers that will change over time. Applications that use APIs that
    manipulate a style’s sources and layers must first set the style URL to an
    explicitly versioned style using a convenience method like
    `+[NGLStyle outdoorsStyleURLWithVersion:]` or a manually constructed
     `NSURL`.
 */
@property (nonatomic, readonly, nullable) NGLStyle *style;

@end

NS_ASSUME_NONNULL_END
