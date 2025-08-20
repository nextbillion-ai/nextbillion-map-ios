// This file is generated.
// Edit platform/darwin/scripts/generate-style-code.js, then run `make darwin-style-code`.

#import "NGLSource.h"
#import "NSPredicate+NGLPrivateAdditions.h"
#import "NSDate+NGLAdditions.h"
#import "NGLStyleLayer_Private.h"
#import "NGLStyleValue_Private.h"
#import "NGLHillshadeStyleLayer.h"
#import "NGLLoggingConfiguration_Private.h"
#import "NGLHillshadeStyleLayer_Private.h"

#include <nbgl/style/layers/hillshade_layer.hpp>
#include <nbgl/style/transition_options.hpp>


namespace nbgl {

    MBGL_DEFINE_ENUM(NGLHillshadeIlluminationAnchor, {
        { NGLHillshadeIlluminationAnchorMap, "map" },
        { NGLHillshadeIlluminationAnchorViewport, "viewport" },
    });

}

@interface NGLHillshadeStyleLayer ()

@property (nonatomic, readonly) nbgl::style::HillshadeLayer *rawLayer;

@end

@implementation NGLHillshadeStyleLayer

- (instancetype)initWithIdentifier:(NSString *)identifier source:(NGLSource *)source
{
    NGLLogDebug(@"Initializing %@ with identifier: %@ source: %@", NSStringFromClass([self class]), identifier, source);
    auto layer = std::make_unique<nbgl::style::HillshadeLayer>(identifier.UTF8String, source.identifier.UTF8String);
    return self = [super initWithPendingLayer:std::move(layer)];
}

- (nbgl::style::HillshadeLayer *)rawLayer
{
    return (nbgl::style::HillshadeLayer *)super.rawLayer;
}

- (NSString *)sourceIdentifier
{
    NGLAssertStyleLayerIsValid();

    return @(self.rawLayer->getSourceID().c_str());
}

// MARK: - Accessing the Paint Attributes

- (void)setHillshadeAccentColor:(NSExpression *)hillshadeAccentColor {
    NGLAssertStyleLayerIsValid();
    NGLLogDebug(@"Setting hillshadeAccentColor: %@", hillshadeAccentColor);

    auto nbglValue = NGLStyleValueTransformer<nbgl::Color, NGLColor *>().toPropertyValue<nbgl::style::PropertyValue<nbgl::Color>>(hillshadeAccentColor, false);
    self.rawLayer->setHillshadeAccentColor(nbglValue);
}

- (NSExpression *)hillshadeAccentColor {
    NGLAssertStyleLayerIsValid();

    auto propertyValue = self.rawLayer->getHillshadeAccentColor();
    if (propertyValue.isUndefined()) {
        propertyValue = self.rawLayer->getDefaultHillshadeAccentColor();
    }
    return NGLStyleValueTransformer<nbgl::Color, NGLColor *>().toExpression(propertyValue);
}

- (void)setHillshadeAccentColorTransition:(NGLTransition )transition {
    NGLAssertStyleLayerIsValid();
    NGLLogDebug(@"Setting hillshadeAccentColorTransition: %@", NGLStringFromNGLTransition(transition));

    self.rawLayer->setHillshadeAccentColorTransition(NGLOptionsFromTransition(transition));
}

- (NGLTransition)hillshadeAccentColorTransition {
    NGLAssertStyleLayerIsValid();

    nbgl::style::TransitionOptions transitionOptions = self.rawLayer->getHillshadeAccentColorTransition();

    return NGLTransitionFromOptions(transitionOptions);
}

- (void)setHillshadeExaggeration:(NSExpression *)hillshadeExaggeration {
    NGLAssertStyleLayerIsValid();
    NGLLogDebug(@"Setting hillshadeExaggeration: %@", hillshadeExaggeration);

    auto nbglValue = NGLStyleValueTransformer<float, NSNumber *>().toPropertyValue<nbgl::style::PropertyValue<float>>(hillshadeExaggeration, false);
    self.rawLayer->setHillshadeExaggeration(nbglValue);
}

- (NSExpression *)hillshadeExaggeration {
    NGLAssertStyleLayerIsValid();

    auto propertyValue = self.rawLayer->getHillshadeExaggeration();
    if (propertyValue.isUndefined()) {
        propertyValue = self.rawLayer->getDefaultHillshadeExaggeration();
    }
    return NGLStyleValueTransformer<float, NSNumber *>().toExpression(propertyValue);
}

- (void)setHillshadeExaggerationTransition:(NGLTransition )transition {
    NGLAssertStyleLayerIsValid();
    NGLLogDebug(@"Setting hillshadeExaggerationTransition: %@", NGLStringFromNGLTransition(transition));

    self.rawLayer->setHillshadeExaggerationTransition(NGLOptionsFromTransition(transition));
}

- (NGLTransition)hillshadeExaggerationTransition {
    NGLAssertStyleLayerIsValid();

    nbgl::style::TransitionOptions transitionOptions = self.rawLayer->getHillshadeExaggerationTransition();

    return NGLTransitionFromOptions(transitionOptions);
}

- (void)setHillshadeHighlightColor:(NSExpression *)hillshadeHighlightColor {
    NGLAssertStyleLayerIsValid();
    NGLLogDebug(@"Setting hillshadeHighlightColor: %@", hillshadeHighlightColor);

    auto nbglValue = NGLStyleValueTransformer<nbgl::Color, NGLColor *>().toPropertyValue<nbgl::style::PropertyValue<nbgl::Color>>(hillshadeHighlightColor, false);
    self.rawLayer->setHillshadeHighlightColor(nbglValue);
}

- (NSExpression *)hillshadeHighlightColor {
    NGLAssertStyleLayerIsValid();

    auto propertyValue = self.rawLayer->getHillshadeHighlightColor();
    if (propertyValue.isUndefined()) {
        propertyValue = self.rawLayer->getDefaultHillshadeHighlightColor();
    }
    return NGLStyleValueTransformer<nbgl::Color, NGLColor *>().toExpression(propertyValue);
}

- (void)setHillshadeHighlightColorTransition:(NGLTransition )transition {
    NGLAssertStyleLayerIsValid();
    NGLLogDebug(@"Setting hillshadeHighlightColorTransition: %@", NGLStringFromNGLTransition(transition));

    self.rawLayer->setHillshadeHighlightColorTransition(NGLOptionsFromTransition(transition));
}

- (NGLTransition)hillshadeHighlightColorTransition {
    NGLAssertStyleLayerIsValid();

    nbgl::style::TransitionOptions transitionOptions = self.rawLayer->getHillshadeHighlightColorTransition();

    return NGLTransitionFromOptions(transitionOptions);
}

- (void)setHillshadeIlluminationAnchor:(NSExpression *)hillshadeIlluminationAnchor {
    NGLAssertStyleLayerIsValid();
    NGLLogDebug(@"Setting hillshadeIlluminationAnchor: %@", hillshadeIlluminationAnchor);

    auto nbglValue = NGLStyleValueTransformer<nbgl::style::HillshadeIlluminationAnchorType, NSValue *, nbgl::style::HillshadeIlluminationAnchorType, NGLHillshadeIlluminationAnchor>().toPropertyValue<nbgl::style::PropertyValue<nbgl::style::HillshadeIlluminationAnchorType>>(hillshadeIlluminationAnchor, false);
    self.rawLayer->setHillshadeIlluminationAnchor(nbglValue);
}

- (NSExpression *)hillshadeIlluminationAnchor {
    NGLAssertStyleLayerIsValid();

    auto propertyValue = self.rawLayer->getHillshadeIlluminationAnchor();
    if (propertyValue.isUndefined()) {
        propertyValue = self.rawLayer->getDefaultHillshadeIlluminationAnchor();
    }
    return NGLStyleValueTransformer<nbgl::style::HillshadeIlluminationAnchorType, NSValue *, nbgl::style::HillshadeIlluminationAnchorType, NGLHillshadeIlluminationAnchor>().toExpression(propertyValue);
}

- (void)setHillshadeIlluminationDirection:(NSExpression *)hillshadeIlluminationDirection {
    NGLAssertStyleLayerIsValid();
    NGLLogDebug(@"Setting hillshadeIlluminationDirection: %@", hillshadeIlluminationDirection);

    auto nbglValue = NGLStyleValueTransformer<float, NSNumber *>().toPropertyValue<nbgl::style::PropertyValue<float>>(hillshadeIlluminationDirection, false);
    self.rawLayer->setHillshadeIlluminationDirection(nbglValue);
}

- (NSExpression *)hillshadeIlluminationDirection {
    NGLAssertStyleLayerIsValid();

    auto propertyValue = self.rawLayer->getHillshadeIlluminationDirection();
    if (propertyValue.isUndefined()) {
        propertyValue = self.rawLayer->getDefaultHillshadeIlluminationDirection();
    }
    return NGLStyleValueTransformer<float, NSNumber *>().toExpression(propertyValue);
}

- (void)setHillshadeShadowColor:(NSExpression *)hillshadeShadowColor {
    NGLAssertStyleLayerIsValid();
    NGLLogDebug(@"Setting hillshadeShadowColor: %@", hillshadeShadowColor);

    auto nbglValue = NGLStyleValueTransformer<nbgl::Color, NGLColor *>().toPropertyValue<nbgl::style::PropertyValue<nbgl::Color>>(hillshadeShadowColor, false);
    self.rawLayer->setHillshadeShadowColor(nbglValue);
}

- (NSExpression *)hillshadeShadowColor {
    NGLAssertStyleLayerIsValid();

    auto propertyValue = self.rawLayer->getHillshadeShadowColor();
    if (propertyValue.isUndefined()) {
        propertyValue = self.rawLayer->getDefaultHillshadeShadowColor();
    }
    return NGLStyleValueTransformer<nbgl::Color, NGLColor *>().toExpression(propertyValue);
}

- (void)setHillshadeShadowColorTransition:(NGLTransition )transition {
    NGLAssertStyleLayerIsValid();
    NGLLogDebug(@"Setting hillshadeShadowColorTransition: %@", NGLStringFromNGLTransition(transition));

    self.rawLayer->setHillshadeShadowColorTransition(NGLOptionsFromTransition(transition));
}

- (NGLTransition)hillshadeShadowColorTransition {
    NGLAssertStyleLayerIsValid();

    nbgl::style::TransitionOptions transitionOptions = self.rawLayer->getHillshadeShadowColorTransition();

    return NGLTransitionFromOptions(transitionOptions);
}

@end

@implementation NSValue (NGLHillshadeStyleLayerAdditions)

+ (NSValue *)valueWithNGLHillshadeIlluminationAnchor:(NGLHillshadeIlluminationAnchor)hillshadeIlluminationAnchor {
    return [NSValue value:&hillshadeIlluminationAnchor withObjCType:@encode(NGLHillshadeIlluminationAnchor)];
}

- (NGLHillshadeIlluminationAnchor)NGLHillshadeIlluminationAnchorValue {
    NGLHillshadeIlluminationAnchor hillshadeIlluminationAnchor;
    [self getValue:&hillshadeIlluminationAnchor];
    return hillshadeIlluminationAnchor;
}

@end

namespace nbgl {

NGLStyleLayer* HillshadeStyleLayerPeerFactory::createPeer(style::Layer* rawLayer) {
    return [[NGLHillshadeStyleLayer alloc] initWithRawLayer:rawLayer];
}

}  // namespace nbgl
