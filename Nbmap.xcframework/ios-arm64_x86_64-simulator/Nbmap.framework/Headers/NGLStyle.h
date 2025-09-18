#import <Foundation/Foundation.h>

#import "NGLFoundation.h"
#import "NGLStyleLayer.h"

#import "NGLTypes.h"

#import "NGLDefaultStyle.h"
#import "NGLAccountManager.h"
#import "NGLTileServerOptions.h"

@class NGLSource;
@class NGLLight;

NS_ASSUME_NONNULL_BEGIN

FOUNDATION_EXTERN NGL_EXPORT NGLExceptionName const NGLInvalidStyleURLException;
FOUNDATION_EXTERN NGL_EXPORT NGLExceptionName const NGLRedundantLayerException;
FOUNDATION_EXTERN NGL_EXPORT NGLExceptionName const NGLRedundantLayerIdentifierException;
FOUNDATION_EXTERN NGL_EXPORT NGLExceptionName const NGLRedundantSourceException;
FOUNDATION_EXTERN NGL_EXPORT NGLExceptionName const NGLRedundantSourceIdentifierException;

/**
 The supported map style type
 */
typedef NS_ENUM(NSUInteger, NGMapStyleType) {
    Bright,
    
    Night,
    
    Satellite
};


/**
 The proxy object for the current map style.

 NGLStyle provides a set of convenience methods for changing default styles included
 with Nbmap.

 It is also possible to directly manipulate the current map style
 via ``NGLMapView/style`` by updating the style's data sources or layers.

 > Note: Wait until the map style has finished loading before modifying a map's
    style via any of the ``NGLStyle`` instance methods below. You can use the
    ``NGLMapViewDelegate/mapView:didFinishLoadingStyle:`` or
    ``NGLMapViewDelegate/mapViewDidFinishLoadingMap:`` methods as indicators
    that it's safe to modify the map's style.
 */
NGL_EXPORT
@interface NGLStyle : NSObject

// MARK: Accessing Default Styles

/**
 Returns list of predefined styles
 */
+ (NSArray<NGLDefaultStyle *> *)predefinedStyles;

/**
 Returns default style
 */
+ (NGLDefaultStyle *)defaultStyle;

/**
 Returns default style as NSURL
 */
+ (nullable NSURL *)defaultStyleURL;

/** Get predefined style by name

 @param withStyleName style name.
 */
+ (nullable NGLDefaultStyle *)predefinedStyle:(NSString *)withStyleName;

// MARK: Accessing Metadata About the Style

/**
 The name of the style.

 You can customize the style’s name in Nextbillion Studio.
 */
@property (readonly, copy, nullable) NSString *name;

/**
 * The style JSON representation of the map.
 *
 * Setting this property results in an asynchronous style change. If you wish to know when the style
 * change is complete, observe the ``NGLMapViewDelegate/mapView:didFinishLoadingStyle:`` method
 * on ``NGLMapViewDelegate``.
 *
 * The JSON must conform to the
 * <a href="https://maplibre.org/maplibre-style-spec/">MapLibre Style Specification</a>.
 *
 * @throws NSInvalidArgumentException if styleJSON is nil or invalid JSON
 */
@property (nonatomic, copy) NSString *styleJSON;

// MARK: Managing Sources

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

 @return An instance of a concrete subclass of ``NGLSource`` associated with the
    given identifier, or `nil` if the current style contains no such source.
 */
- (nullable NGLSource *)sourceWithIdentifier:(NSString *)identifier;

/**
 Adds a new source to the current style.

 > Note: Adding the same source instance more than once will result in a
    ``NGLRedundantSourceException``. Reusing the same source identifier, even with
    different source instances, will result in a
    ``NGLRedundantSourceIdentifierException``.

 > Note: Sources should be added in
    ``NGLMapViewDelegate/mapView:didFinishLoadingStyle:`` or
    ``NGLMapViewDelegate/mapViewDidFinishLoadingMap:`` to ensure that the map
    has loaded the style and is ready to accept a new source.

 @param source The source to add to the current style.
 */
- (void)addSource:(NGLSource *)source;

/**
 Removes a source from the current style.

 @param source The source to remove from the current style.
 */
- (void)removeSource:(NGLSource *)source;

/**
 Removes a source from the current style.

 @param source The source to remove from the current style.
 @param outError Upon return, if an error has occurred, a pointer to an `NSError`
 object describing the error. Pass in `NULL` to ignore any error.

 @return `YES` if `source` was removed successfully. If `NO`, `outError` contains
 an `NSError` object describing the problem.
 */
- (BOOL)removeSource:(NGLSource *)source error:(NSError *__nullable *__nullable)outError;

// MARK: Managing Style Layers

/**
 The layers included in the style, arranged according to their back-to-front
 ordering on the screen.
 */
@property (nonatomic, strong) NSArray<__kindof NGLStyleLayer *> *layers;

/**
 Returns a style layer with the given identifier in the current style.

 @return An instance of a concrete subclass of ``NGLStyleLayer`` associated with
    the given identifier, or `nil` if the current style contains no such style
    layer.
 */
- (nullable NGLStyleLayer *)layerWithIdentifier:(NSString *)identifier;

/**
 Adds a new layer on top of existing layers.

 > Note: Adding the same layer instance more than once will result in a
    ``NGLRedundantLayerException``. Reusing the same layer identifer, even with
    different layer instances, will also result in an exception.

 > Note: Layers should be added in
    ``NGLMapViewDelegate/mapView:didFinishLoadingStyle:`` or
    ``NGLMapViewDelegate/mapViewDidFinishLoadingMap:`` to ensure that the map
    has loaded the style and is ready to accept a new layer.

 @param layer The layer object to add to the map view. This object must be an
    instance of a concrete subclass of ``NGLStyleLayer``.
 */
- (void)addLayer:(NGLStyleLayer *)layer;

/**
 Inserts a new layer into the style at the given index.

 > Note: Adding the same layer instance more than once will result in a
    ``NGLRedundantLayerException``. Reusing the same layer identifer, even with
    different layer instances, will also result in an exception.

 > Note: Layers should be added in
    ``NGLMapViewDelegate/mapView:didFinishLoadingStyle:`` or
    ``NGLMapViewDelegate/mapViewDidFinishLoadingMap:`` to ensure that the map
    has loaded the style and is ready to accept a new layer.

 @param layer The layer to insert.
 @param index The index at which to insert the layer. An index of 0 would send
    the layer to the back; an index equal to the number of objects in the
    `layers` property would bring the layer to the front.
 */
- (void)insertLayer:(NGLStyleLayer *)layer atIndex:(NSUInteger)index;

/**
 Inserts a new layer below another layer.

 > Note: Inserting the same layer instance more than once will result in a
    ``NGLRedundantLayerException``. Reusing the same layer identifer, even with
    different layer instances, will also result in an exception.

 @param layer The layer to insert.
 @param sibling An existing layer in the style.

 #### Related examples
 TODO: Add multiple shapes from a single shape source, learn how to
 add a layer to your map below an existing layer.
 */
- (void)insertLayer:(NGLStyleLayer *)layer belowLayer:(NGLStyleLayer *)sibling;

/**
 Inserts a new layer above another layer.

 > Note: Inserting the same layer instance more than once will result in a
    ``NGLRedundantLayerException``. Reusing the same layer identifer, even with
    different layer instances, will also result in an exception.

 @param layer The layer to insert.
 @param sibling An existing layer in the style.

 #### Related examples
 TODO: Add an image, learn how to add a layer to your map above an
 existing layer.
 */
- (void)insertLayer:(NGLStyleLayer *)layer aboveLayer:(NGLStyleLayer *)sibling;

/**
 Removes a layer from the map view.

 @param layer The layer object to remove from the map view. This object
 must conform to the ``NGLStyleLayer`` protocol.
 */
- (void)removeLayer:(NGLStyleLayer *)layer;

// MARK: Managing a Style’s Images

/**
 Returns the image associated with the given name in the style.

 @param name The name associated with the image you want to obtain.
 @return The image associated with the given name, or `nil` if no image is
    associated with that name.
 */
- (nullable NGLImage *)imageForName:(NSString *)name;

/**
 Adds or overrides an image used by the style’s layers.

 To use an image in a style layer, give it a unique name using this method, then
 set the `iconImageName` property of an ``NGLSymbolStyleLayer`` object to that
 name.

 @param image The image for the name.
 @param name The name of the image to set to the style.

 #### Related examples
 TODO: Use images to cluster point data
 TODO: Cluster point data
 Learn how to add images to your map using an ``NGLStyle`` object.
 */
- (void)setImage:(NGLImage *)image forName:(NSString *)name;

/**
 Removes a name and its associated image from the style.

 @param name The name of the image to remove.
 */
- (void)removeImageForName:(NSString *)name;

// MARK: Managing the Style's Light

/**
 Provides global light source for the style.
 */
@property (nonatomic, strong) NGLLight *light;

// MARK: Localizing Map Content

/**
 Attempts to localize labels in the style into the given locale.

 This method automatically modifies the text property of any symbol style layer
 in the style whose source is the
 <a href="https://www.nextbillion.com/vector-tiles/nextbillion-streets-v8/#overview">Nextbillion Streets
 source</a>. On iOS, the user can set the system’s preferred language in Settings, General Settings,
 Language & Region. On macOS, the user can set the system’s preferred language in the Language &
 Region pane of System Preferences.

 @param locale The locale into which labels should be localized. To use the
    system’s preferred language, if supported, specify `nil`. To use the local
    language, specify a locale with the identifier `mul`.
 */
- (void)localizeLabelsIntoLocale:(nullable NSLocale *)locale;

@end

/**
 An object whose contents are represented by an ``NGLStyle`` object that you
 configure.
 */
@protocol NGLStylable <NSObject>

/**
 The style currently displayed in the receiver.
 */
@property (nonatomic, readonly, nullable) NGLStyle *style;

@end

NS_ASSUME_NONNULL_END
