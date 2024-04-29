#import <Foundation/Foundation.h>

#import "NGLFoundation.h"
#import "NGLForegroundStyleLayer.h"

NS_ASSUME_NONNULL_BEGIN

/**
 `NGLVectorStyleLayer` is an abstract superclass for style layers whose content
 is defined by an `NGLShapeSource` or `NGLVectorTileSource` object.

 Create instances of `NGLCircleStyleLayer`, `NGLFillStyleLayer`,
 `NGLFillExtrusionStyleLayer`, `NGLHeatmapStyleLayer`, `NGLLineStyleLayer`, and
 `NGLSymbolStyleLayer` in order to use `NGLVectorStyleLayer`'s properties and
 methods. Do not create instances of `NGLVectorStyleLayer` directly, and do not
 create your own subclasses of this class.
 */
NGL_EXPORT
@interface NGLVectorStyleLayer : NGLForegroundStyleLayer

#pragma mark Refining a Style Layer’s Content

/**
 Identifier of the layer within the source identified by the `sourceIdentifier`
 property from which the receiver obtains the data to style.
 */
@property (nonatomic, nullable) NSString *sourceLayerIdentifier;

/**
 The style layer’s predicate.

 Use the style layer’s predicate to include only the features in the source
 layer that satisfy a condition that you define. If the style layer initially
 comes from the style, its predicate corresponds to the
 <a href="https://www.nbmap.com/nbmap-gl-style-spec/#layer-filter">`filter`</a>
 property in the style JSON.
 
 See the “<a href="../predicates-and-expressions.html">Predicates and Expressions</a>”
 guide for details about the predicate syntax supported by this class.

 ### Example

 To filter the layer to include only the features whose `index` attribute is 5
 or 10 and whose `ele` attribute is at least 1,500, you could create an
 `NSCompoundPredicate` along these lines:

 ```swift
 let layer = NGLLineStyleLayer(identifier: "contour", source: terrain)
 layer.sourceLayerIdentifier = "contours"
 layer.predicate = NSPredicate(format: "(index == 5 || index == 10) && CAST(ele, 'NSNumber') >= 1500.0")
 mapView.style?.addLayer(layer)
 ```
 */
@property (nonatomic, nullable) NSPredicate *predicate;

@end

NS_ASSUME_NONNULL_END
