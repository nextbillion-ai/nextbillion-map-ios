// This file is generated.
// Edit platform/darwin/scripts/generate-style-code.js, then run `make darwin-style-code`.

#import "NGLSource.h"
#import "NSPredicate+NGLPrivateAdditions.h"
#import "NSDate+NGLAdditions.h"
#import "NGLStyleLayer_Private.h"
#import "NGLStyleValue_Private.h"
#import "NGLFillStyleLayer.h"
#import "NGLLoggingConfiguration_Private.h"
#import "NGLFillStyleLayer_Private.h"

#include <nbgl/style/layers/fill_layer.hpp>
#include <nbgl/style/transition_options.hpp>


namespace nbgl {

    MBGL_DEFINE_ENUM(NGLFillTranslationAnchor, {
        { NGLFillTranslationAnchorMap, "map" },
        { NGLFillTranslationAnchorViewport, "viewport" },
    });

}

@interface NGLFillStyleLayer ()

@property (nonatomic, readonly) nbgl::style::FillLayer *rawLayer;

@end

@implementation NGLFillStyleLayer

- (instancetype)initWithIdentifier:(NSString *)identifier source:(NGLSource *)source
{
    NGLLogDebug(@"Initializing %@ with identifier: %@ source: %@", NSStringFromClass([self class]), identifier, source);
    auto layer = std::make_unique<nbgl::style::FillLayer>(identifier.UTF8String, source.identifier.UTF8String);
    return self = [super initWithPendingLayer:std::move(layer)];
}

- (nbgl::style::FillLayer *)rawLayer
{
    return (nbgl::style::FillLayer *)super.rawLayer;
}

- (NSString *)sourceIdentifier
{
    NGLAssertStyleLayerIsValid();

    return @(self.rawLayer->getSourceID().c_str());
}

- (NSString *)sourceLayerIdentifier
{
    NGLAssertStyleLayerIsValid();

    auto layerID = self.rawLayer->getSourceLayer();
    return layerID.empty() ? nil : @(layerID.c_str());
}

- (void)setSourceLayerIdentifier:(NSString *)sourceLayerIdentifier
{
    NGLAssertStyleLayerIsValid();
    NGLLogDebug(@"Setting sourceLayerIdentifier: %@", sourceLayerIdentifier);

    self.rawLayer->setSourceLayer(sourceLayerIdentifier.UTF8String ?: "");
}

- (void)setPredicate:(NSPredicate *)predicate
{
    NGLAssertStyleLayerIsValid();
    NGLLogDebug(@"Setting predicate: %@", predicate);

    self.rawLayer->setFilter(predicate ? predicate.ngl_filter : nbgl::style::Filter());
}

- (NSPredicate *)predicate
{
    NGLAssertStyleLayerIsValid();

    return [NSPredicate ngl_predicateWithFilter:self.rawLayer->getFilter()];
}

// MARK: - Accessing the Layout Attributes

- (void)setFillSortKey:(NSExpression *)fillSortKey {
    NGLAssertStyleLayerIsValid();
    NGLLogDebug(@"Setting fillSortKey: %@", fillSortKey);

    auto nbglValue = NGLStyleValueTransformer<float, NSNumber *>().toPropertyValue<nbgl::style::PropertyValue<float>>(fillSortKey, true);
    self.rawLayer->setFillSortKey(nbglValue);
}

- (NSExpression *)fillSortKey {
    NGLAssertStyleLayerIsValid();

    auto propertyValue = self.rawLayer->getFillSortKey();
    if (propertyValue.isUndefined()) {
        propertyValue = self.rawLayer->getDefaultFillSortKey();
    }
    return NGLStyleValueTransformer<float, NSNumber *>().toExpression(propertyValue);
}

// MARK: - Accessing the Paint Attributes

- (void)setFillAntialiased:(NSExpression *)fillAntialiased {
    NGLAssertStyleLayerIsValid();
    NGLLogDebug(@"Setting fillAntialiased: %@", fillAntialiased);

    auto nbglValue = NGLStyleValueTransformer<bool, NSNumber *>().toPropertyValue<nbgl::style::PropertyValue<bool>>(fillAntialiased, false);
    self.rawLayer->setFillAntialias(nbglValue);
}

- (NSExpression *)isFillAntialiased {
    NGLAssertStyleLayerIsValid();

    auto propertyValue = self.rawLayer->getFillAntialias();
    if (propertyValue.isUndefined()) {
        propertyValue = self.rawLayer->getDefaultFillAntialias();
    }
    return NGLStyleValueTransformer<bool, NSNumber *>().toExpression(propertyValue);
}

- (void)setFillAntialias:(NSExpression *)fillAntialias {
}

- (NSExpression *)fillAntialias {
    return self.isFillAntialiased;
}

- (void)setFillColor:(NSExpression *)fillColor {
    NGLAssertStyleLayerIsValid();
    NGLLogDebug(@"Setting fillColor: %@", fillColor);

    auto nbglValue = NGLStyleValueTransformer<nbgl::Color, NGLColor *>().toPropertyValue<nbgl::style::PropertyValue<nbgl::Color>>(fillColor, true);
    self.rawLayer->setFillColor(nbglValue);
}

- (NSExpression *)fillColor {
    NGLAssertStyleLayerIsValid();

    auto propertyValue = self.rawLayer->getFillColor();
    if (propertyValue.isUndefined()) {
        propertyValue = self.rawLayer->getDefaultFillColor();
    }
    return NGLStyleValueTransformer<nbgl::Color, NGLColor *>().toExpression(propertyValue);
}

- (void)setFillColorTransition:(NGLTransition )transition {
    NGLAssertStyleLayerIsValid();
    NGLLogDebug(@"Setting fillColorTransition: %@", NGLStringFromNGLTransition(transition));

    self.rawLayer->setFillColorTransition(NGLOptionsFromTransition(transition));
}

- (NGLTransition)fillColorTransition {
    NGLAssertStyleLayerIsValid();

    nbgl::style::TransitionOptions transitionOptions = self.rawLayer->getFillColorTransition();

    return NGLTransitionFromOptions(transitionOptions);
}

- (void)setFillOpacity:(NSExpression *)fillOpacity {
    NGLAssertStyleLayerIsValid();
    NGLLogDebug(@"Setting fillOpacity: %@", fillOpacity);

    auto nbglValue = NGLStyleValueTransformer<float, NSNumber *>().toPropertyValue<nbgl::style::PropertyValue<float>>(fillOpacity, true);
    self.rawLayer->setFillOpacity(nbglValue);
}

- (NSExpression *)fillOpacity {
    NGLAssertStyleLayerIsValid();

    auto propertyValue = self.rawLayer->getFillOpacity();
    if (propertyValue.isUndefined()) {
        propertyValue = self.rawLayer->getDefaultFillOpacity();
    }
    return NGLStyleValueTransformer<float, NSNumber *>().toExpression(propertyValue);
}

- (void)setFillOpacityTransition:(NGLTransition )transition {
    NGLAssertStyleLayerIsValid();
    NGLLogDebug(@"Setting fillOpacityTransition: %@", NGLStringFromNGLTransition(transition));

    self.rawLayer->setFillOpacityTransition(NGLOptionsFromTransition(transition));
}

- (NGLTransition)fillOpacityTransition {
    NGLAssertStyleLayerIsValid();

    nbgl::style::TransitionOptions transitionOptions = self.rawLayer->getFillOpacityTransition();

    return NGLTransitionFromOptions(transitionOptions);
}

- (void)setFillOutlineColor:(NSExpression *)fillOutlineColor {
    NGLAssertStyleLayerIsValid();
    NGLLogDebug(@"Setting fillOutlineColor: %@", fillOutlineColor);

    auto nbglValue = NGLStyleValueTransformer<nbgl::Color, NGLColor *>().toPropertyValue<nbgl::style::PropertyValue<nbgl::Color>>(fillOutlineColor, true);
    self.rawLayer->setFillOutlineColor(nbglValue);
}

- (NSExpression *)fillOutlineColor {
    NGLAssertStyleLayerIsValid();

    auto propertyValue = self.rawLayer->getFillOutlineColor();
    if (propertyValue.isUndefined()) {
        propertyValue = self.rawLayer->getDefaultFillOutlineColor();
    }
    return NGLStyleValueTransformer<nbgl::Color, NGLColor *>().toExpression(propertyValue);
}

- (void)setFillOutlineColorTransition:(NGLTransition )transition {
    NGLAssertStyleLayerIsValid();
    NGLLogDebug(@"Setting fillOutlineColorTransition: %@", NGLStringFromNGLTransition(transition));

    self.rawLayer->setFillOutlineColorTransition(NGLOptionsFromTransition(transition));
}

- (NGLTransition)fillOutlineColorTransition {
    NGLAssertStyleLayerIsValid();

    nbgl::style::TransitionOptions transitionOptions = self.rawLayer->getFillOutlineColorTransition();

    return NGLTransitionFromOptions(transitionOptions);
}

- (void)setFillPattern:(NSExpression *)fillPattern {
    NGLAssertStyleLayerIsValid();
    NGLLogDebug(@"Setting fillPattern: %@", fillPattern);

    auto nbglValue = NGLStyleValueTransformer<nbgl::style::expression::Image, NSString *>().toPropertyValue<nbgl::style::PropertyValue<nbgl::style::expression::Image>>(fillPattern, true);
    self.rawLayer->setFillPattern(nbglValue);
}

- (NSExpression *)fillPattern {
    NGLAssertStyleLayerIsValid();

    auto propertyValue = self.rawLayer->getFillPattern();
    if (propertyValue.isUndefined()) {
        propertyValue = self.rawLayer->getDefaultFillPattern();
    }
    return NGLStyleValueTransformer<nbgl::style::expression::Image, NSString *>().toExpression(propertyValue);
}

- (void)setFillPatternTransition:(NGLTransition )transition {
    NGLAssertStyleLayerIsValid();
    NGLLogDebug(@"Setting fillPatternTransition: %@", NGLStringFromNGLTransition(transition));

    self.rawLayer->setFillPatternTransition(NGLOptionsFromTransition(transition));
}

- (NGLTransition)fillPatternTransition {
    NGLAssertStyleLayerIsValid();

    nbgl::style::TransitionOptions transitionOptions = self.rawLayer->getFillPatternTransition();

    return NGLTransitionFromOptions(transitionOptions);
}

- (void)setFillTranslation:(NSExpression *)fillTranslation {
    NGLAssertStyleLayerIsValid();
    NGLLogDebug(@"Setting fillTranslation: %@", fillTranslation);

    auto nbglValue = NGLStyleValueTransformer<std::array<float, 2>, NSValue *>().toPropertyValue<nbgl::style::PropertyValue<std::array<float, 2>>>(fillTranslation, false);
    self.rawLayer->setFillTranslate(nbglValue);
}

- (NSExpression *)fillTranslation {
    NGLAssertStyleLayerIsValid();

    auto propertyValue = self.rawLayer->getFillTranslate();
    if (propertyValue.isUndefined()) {
        propertyValue = self.rawLayer->getDefaultFillTranslate();
    }
    return NGLStyleValueTransformer<std::array<float, 2>, NSValue *>().toExpression(propertyValue);
}

- (void)setFillTranslationTransition:(NGLTransition )transition {
    NGLAssertStyleLayerIsValid();
    NGLLogDebug(@"Setting fillTranslationTransition: %@", NGLStringFromNGLTransition(transition));

    self.rawLayer->setFillTranslateTransition(NGLOptionsFromTransition(transition));
}

- (NGLTransition)fillTranslationTransition {
    NGLAssertStyleLayerIsValid();

    nbgl::style::TransitionOptions transitionOptions = self.rawLayer->getFillTranslateTransition();

    return NGLTransitionFromOptions(transitionOptions);
}

- (void)setFillTranslate:(NSExpression *)fillTranslate {
}

- (NSExpression *)fillTranslate {
    return self.fillTranslation;
}

- (void)setFillTranslationAnchor:(NSExpression *)fillTranslationAnchor {
    NGLAssertStyleLayerIsValid();
    NGLLogDebug(@"Setting fillTranslationAnchor: %@", fillTranslationAnchor);

    auto nbglValue = NGLStyleValueTransformer<nbgl::style::TranslateAnchorType, NSValue *, nbgl::style::TranslateAnchorType, NGLFillTranslationAnchor>().toPropertyValue<nbgl::style::PropertyValue<nbgl::style::TranslateAnchorType>>(fillTranslationAnchor, false);
    self.rawLayer->setFillTranslateAnchor(nbglValue);
}

- (NSExpression *)fillTranslationAnchor {
    NGLAssertStyleLayerIsValid();

    auto propertyValue = self.rawLayer->getFillTranslateAnchor();
    if (propertyValue.isUndefined()) {
        propertyValue = self.rawLayer->getDefaultFillTranslateAnchor();
    }
    return NGLStyleValueTransformer<nbgl::style::TranslateAnchorType, NSValue *, nbgl::style::TranslateAnchorType, NGLFillTranslationAnchor>().toExpression(propertyValue);
}

- (void)setFillTranslateAnchor:(NSExpression *)fillTranslateAnchor {
}

- (NSExpression *)fillTranslateAnchor {
    return self.fillTranslationAnchor;
}

@end

@implementation NSValue (NGLFillStyleLayerAdditions)

+ (NSValue *)valueWithNGLFillTranslationAnchor:(NGLFillTranslationAnchor)fillTranslationAnchor {
    return [NSValue value:&fillTranslationAnchor withObjCType:@encode(NGLFillTranslationAnchor)];
}

- (NGLFillTranslationAnchor)NGLFillTranslationAnchorValue {
    NGLFillTranslationAnchor fillTranslationAnchor;
    [self getValue:&fillTranslationAnchor];
    return fillTranslationAnchor;
}

@end

namespace nbgl {

NGLStyleLayer* FillStyleLayerPeerFactory::createPeer(style::Layer* rawLayer) {
    return [[NGLFillStyleLayer alloc] initWithRawLayer:rawLayer];
}

}  // namespace nbgl
