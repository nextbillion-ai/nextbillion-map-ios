// This file is generated.
// Edit platform/darwin/scripts/generate-style-code.js, then run `make darwin-style-code`.

#import "NGLSource.h"
#import "NSPredicate+NGLPrivateAdditions.h"
#import "NSDate+NGLAdditions.h"
#import "NGLStyleLayer_Private.h"
#import "NGLStyleValue_Private.h"
#import "NGLFillExtrusionStyleLayer.h"
#import "NGLLoggingConfiguration_Private.h"
#import "NGLFillExtrusionStyleLayer_Private.h"

#include <nbgl/style/layers/fill_extrusion_layer.hpp>
#include <nbgl/style/transition_options.hpp>


namespace nbgl {

    MBGL_DEFINE_ENUM(NGLFillExtrusionTranslationAnchor, {
        { NGLFillExtrusionTranslationAnchorMap, "map" },
        { NGLFillExtrusionTranslationAnchorViewport, "viewport" },
    });

}

@interface NGLFillExtrusionStyleLayer ()

@property (nonatomic, readonly) nbgl::style::FillExtrusionLayer *rawLayer;

@end

@implementation NGLFillExtrusionStyleLayer

- (instancetype)initWithIdentifier:(NSString *)identifier source:(NGLSource *)source
{
    NGLLogDebug(@"Initializing %@ with identifier: %@ source: %@", NSStringFromClass([self class]), identifier, source);
    auto layer = std::make_unique<nbgl::style::FillExtrusionLayer>(identifier.UTF8String, source.identifier.UTF8String);
    return self = [super initWithPendingLayer:std::move(layer)];
}

- (nbgl::style::FillExtrusionLayer *)rawLayer
{
    return (nbgl::style::FillExtrusionLayer *)super.rawLayer;
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

// MARK: - Accessing the Paint Attributes

- (void)setFillExtrusionBase:(NSExpression *)fillExtrusionBase {
    NGLAssertStyleLayerIsValid();
    NGLLogDebug(@"Setting fillExtrusionBase: %@", fillExtrusionBase);

    auto nbglValue = NGLStyleValueTransformer<float, NSNumber *>().toPropertyValue<nbgl::style::PropertyValue<float>>(fillExtrusionBase, true);
    self.rawLayer->setFillExtrusionBase(nbglValue);
}

- (NSExpression *)fillExtrusionBase {
    NGLAssertStyleLayerIsValid();

    auto propertyValue = self.rawLayer->getFillExtrusionBase();
    if (propertyValue.isUndefined()) {
        propertyValue = self.rawLayer->getDefaultFillExtrusionBase();
    }
    return NGLStyleValueTransformer<float, NSNumber *>().toExpression(propertyValue);
}

- (void)setFillExtrusionBaseTransition:(NGLTransition )transition {
    NGLAssertStyleLayerIsValid();
    NGLLogDebug(@"Setting fillExtrusionBaseTransition: %@", NGLStringFromNGLTransition(transition));

    self.rawLayer->setFillExtrusionBaseTransition(NGLOptionsFromTransition(transition));
}

- (NGLTransition)fillExtrusionBaseTransition {
    NGLAssertStyleLayerIsValid();

    nbgl::style::TransitionOptions transitionOptions = self.rawLayer->getFillExtrusionBaseTransition();

    return NGLTransitionFromOptions(transitionOptions);
}

- (void)setFillExtrusionColor:(NSExpression *)fillExtrusionColor {
    NGLAssertStyleLayerIsValid();
    NGLLogDebug(@"Setting fillExtrusionColor: %@", fillExtrusionColor);

    auto nbglValue = NGLStyleValueTransformer<nbgl::Color, NGLColor *>().toPropertyValue<nbgl::style::PropertyValue<nbgl::Color>>(fillExtrusionColor, true);
    self.rawLayer->setFillExtrusionColor(nbglValue);
}

- (NSExpression *)fillExtrusionColor {
    NGLAssertStyleLayerIsValid();

    auto propertyValue = self.rawLayer->getFillExtrusionColor();
    if (propertyValue.isUndefined()) {
        propertyValue = self.rawLayer->getDefaultFillExtrusionColor();
    }
    return NGLStyleValueTransformer<nbgl::Color, NGLColor *>().toExpression(propertyValue);
}

- (void)setFillExtrusionColorTransition:(NGLTransition )transition {
    NGLAssertStyleLayerIsValid();
    NGLLogDebug(@"Setting fillExtrusionColorTransition: %@", NGLStringFromNGLTransition(transition));

    self.rawLayer->setFillExtrusionColorTransition(NGLOptionsFromTransition(transition));
}

- (NGLTransition)fillExtrusionColorTransition {
    NGLAssertStyleLayerIsValid();

    nbgl::style::TransitionOptions transitionOptions = self.rawLayer->getFillExtrusionColorTransition();

    return NGLTransitionFromOptions(transitionOptions);
}

- (void)setFillExtrusionHasVerticalGradient:(NSExpression *)fillExtrusionHasVerticalGradient {
    NGLAssertStyleLayerIsValid();
    NGLLogDebug(@"Setting fillExtrusionHasVerticalGradient: %@", fillExtrusionHasVerticalGradient);

    auto nbglValue = NGLStyleValueTransformer<bool, NSNumber *>().toPropertyValue<nbgl::style::PropertyValue<bool>>(fillExtrusionHasVerticalGradient, false);
    self.rawLayer->setFillExtrusionVerticalGradient(nbglValue);
}

- (NSExpression *)fillExtrusionHasVerticalGradient {
    NGLAssertStyleLayerIsValid();

    auto propertyValue = self.rawLayer->getFillExtrusionVerticalGradient();
    if (propertyValue.isUndefined()) {
        propertyValue = self.rawLayer->getDefaultFillExtrusionVerticalGradient();
    }
    return NGLStyleValueTransformer<bool, NSNumber *>().toExpression(propertyValue);
}

- (void)setFillExtrusionVerticalGradient:(NSExpression *)fillExtrusionVerticalGradient {
}

- (NSExpression *)fillExtrusionVerticalGradient {
    return self.fillExtrusionHasVerticalGradient;
}

- (void)setFillExtrusionHeight:(NSExpression *)fillExtrusionHeight {
    NGLAssertStyleLayerIsValid();
    NGLLogDebug(@"Setting fillExtrusionHeight: %@", fillExtrusionHeight);

    auto nbglValue = NGLStyleValueTransformer<float, NSNumber *>().toPropertyValue<nbgl::style::PropertyValue<float>>(fillExtrusionHeight, true);
    self.rawLayer->setFillExtrusionHeight(nbglValue);
}

- (NSExpression *)fillExtrusionHeight {
    NGLAssertStyleLayerIsValid();

    auto propertyValue = self.rawLayer->getFillExtrusionHeight();
    if (propertyValue.isUndefined()) {
        propertyValue = self.rawLayer->getDefaultFillExtrusionHeight();
    }
    return NGLStyleValueTransformer<float, NSNumber *>().toExpression(propertyValue);
}

- (void)setFillExtrusionHeightTransition:(NGLTransition )transition {
    NGLAssertStyleLayerIsValid();
    NGLLogDebug(@"Setting fillExtrusionHeightTransition: %@", NGLStringFromNGLTransition(transition));

    self.rawLayer->setFillExtrusionHeightTransition(NGLOptionsFromTransition(transition));
}

- (NGLTransition)fillExtrusionHeightTransition {
    NGLAssertStyleLayerIsValid();

    nbgl::style::TransitionOptions transitionOptions = self.rawLayer->getFillExtrusionHeightTransition();

    return NGLTransitionFromOptions(transitionOptions);
}

- (void)setFillExtrusionOpacity:(NSExpression *)fillExtrusionOpacity {
    NGLAssertStyleLayerIsValid();
    NGLLogDebug(@"Setting fillExtrusionOpacity: %@", fillExtrusionOpacity);

    auto nbglValue = NGLStyleValueTransformer<float, NSNumber *>().toPropertyValue<nbgl::style::PropertyValue<float>>(fillExtrusionOpacity, false);
    self.rawLayer->setFillExtrusionOpacity(nbglValue);
}

- (NSExpression *)fillExtrusionOpacity {
    NGLAssertStyleLayerIsValid();

    auto propertyValue = self.rawLayer->getFillExtrusionOpacity();
    if (propertyValue.isUndefined()) {
        propertyValue = self.rawLayer->getDefaultFillExtrusionOpacity();
    }
    return NGLStyleValueTransformer<float, NSNumber *>().toExpression(propertyValue);
}

- (void)setFillExtrusionOpacityTransition:(NGLTransition )transition {
    NGLAssertStyleLayerIsValid();
    NGLLogDebug(@"Setting fillExtrusionOpacityTransition: %@", NGLStringFromNGLTransition(transition));

    self.rawLayer->setFillExtrusionOpacityTransition(NGLOptionsFromTransition(transition));
}

- (NGLTransition)fillExtrusionOpacityTransition {
    NGLAssertStyleLayerIsValid();

    nbgl::style::TransitionOptions transitionOptions = self.rawLayer->getFillExtrusionOpacityTransition();

    return NGLTransitionFromOptions(transitionOptions);
}

- (void)setFillExtrusionPattern:(NSExpression *)fillExtrusionPattern {
    NGLAssertStyleLayerIsValid();
    NGLLogDebug(@"Setting fillExtrusionPattern: %@", fillExtrusionPattern);

    auto nbglValue = NGLStyleValueTransformer<nbgl::style::expression::Image, NSString *>().toPropertyValue<nbgl::style::PropertyValue<nbgl::style::expression::Image>>(fillExtrusionPattern, true);
    self.rawLayer->setFillExtrusionPattern(nbglValue);
}

- (NSExpression *)fillExtrusionPattern {
    NGLAssertStyleLayerIsValid();

    auto propertyValue = self.rawLayer->getFillExtrusionPattern();
    if (propertyValue.isUndefined()) {
        propertyValue = self.rawLayer->getDefaultFillExtrusionPattern();
    }
    return NGLStyleValueTransformer<nbgl::style::expression::Image, NSString *>().toExpression(propertyValue);
}

- (void)setFillExtrusionPatternTransition:(NGLTransition )transition {
    NGLAssertStyleLayerIsValid();
    NGLLogDebug(@"Setting fillExtrusionPatternTransition: %@", NGLStringFromNGLTransition(transition));

    self.rawLayer->setFillExtrusionPatternTransition(NGLOptionsFromTransition(transition));
}

- (NGLTransition)fillExtrusionPatternTransition {
    NGLAssertStyleLayerIsValid();

    nbgl::style::TransitionOptions transitionOptions = self.rawLayer->getFillExtrusionPatternTransition();

    return NGLTransitionFromOptions(transitionOptions);
}

- (void)setFillExtrusionTranslation:(NSExpression *)fillExtrusionTranslation {
    NGLAssertStyleLayerIsValid();
    NGLLogDebug(@"Setting fillExtrusionTranslation: %@", fillExtrusionTranslation);

    auto nbglValue = NGLStyleValueTransformer<std::array<float, 2>, NSValue *>().toPropertyValue<nbgl::style::PropertyValue<std::array<float, 2>>>(fillExtrusionTranslation, false);
    self.rawLayer->setFillExtrusionTranslate(nbglValue);
}

- (NSExpression *)fillExtrusionTranslation {
    NGLAssertStyleLayerIsValid();

    auto propertyValue = self.rawLayer->getFillExtrusionTranslate();
    if (propertyValue.isUndefined()) {
        propertyValue = self.rawLayer->getDefaultFillExtrusionTranslate();
    }
    return NGLStyleValueTransformer<std::array<float, 2>, NSValue *>().toExpression(propertyValue);
}

- (void)setFillExtrusionTranslationTransition:(NGLTransition )transition {
    NGLAssertStyleLayerIsValid();
    NGLLogDebug(@"Setting fillExtrusionTranslationTransition: %@", NGLStringFromNGLTransition(transition));

    self.rawLayer->setFillExtrusionTranslateTransition(NGLOptionsFromTransition(transition));
}

- (NGLTransition)fillExtrusionTranslationTransition {
    NGLAssertStyleLayerIsValid();

    nbgl::style::TransitionOptions transitionOptions = self.rawLayer->getFillExtrusionTranslateTransition();

    return NGLTransitionFromOptions(transitionOptions);
}

- (void)setFillExtrusionTranslate:(NSExpression *)fillExtrusionTranslate {
}

- (NSExpression *)fillExtrusionTranslate {
    return self.fillExtrusionTranslation;
}

- (void)setFillExtrusionTranslationAnchor:(NSExpression *)fillExtrusionTranslationAnchor {
    NGLAssertStyleLayerIsValid();
    NGLLogDebug(@"Setting fillExtrusionTranslationAnchor: %@", fillExtrusionTranslationAnchor);

    auto nbglValue = NGLStyleValueTransformer<nbgl::style::TranslateAnchorType, NSValue *, nbgl::style::TranslateAnchorType, NGLFillExtrusionTranslationAnchor>().toPropertyValue<nbgl::style::PropertyValue<nbgl::style::TranslateAnchorType>>(fillExtrusionTranslationAnchor, false);
    self.rawLayer->setFillExtrusionTranslateAnchor(nbglValue);
}

- (NSExpression *)fillExtrusionTranslationAnchor {
    NGLAssertStyleLayerIsValid();

    auto propertyValue = self.rawLayer->getFillExtrusionTranslateAnchor();
    if (propertyValue.isUndefined()) {
        propertyValue = self.rawLayer->getDefaultFillExtrusionTranslateAnchor();
    }
    return NGLStyleValueTransformer<nbgl::style::TranslateAnchorType, NSValue *, nbgl::style::TranslateAnchorType, NGLFillExtrusionTranslationAnchor>().toExpression(propertyValue);
}

- (void)setFillExtrusionTranslateAnchor:(NSExpression *)fillExtrusionTranslateAnchor {
}

- (NSExpression *)fillExtrusionTranslateAnchor {
    return self.fillExtrusionTranslationAnchor;
}

@end

@implementation NSValue (NGLFillExtrusionStyleLayerAdditions)

+ (NSValue *)valueWithNGLFillExtrusionTranslationAnchor:(NGLFillExtrusionTranslationAnchor)fillExtrusionTranslationAnchor {
    return [NSValue value:&fillExtrusionTranslationAnchor withObjCType:@encode(NGLFillExtrusionTranslationAnchor)];
}

- (NGLFillExtrusionTranslationAnchor)NGLFillExtrusionTranslationAnchorValue {
    NGLFillExtrusionTranslationAnchor fillExtrusionTranslationAnchor;
    [self getValue:&fillExtrusionTranslationAnchor];
    return fillExtrusionTranslationAnchor;
}

@end

namespace nbgl {

NGLStyleLayer* FillExtrusionStyleLayerPeerFactory::createPeer(style::Layer* rawLayer) {
    return [[NGLFillExtrusionStyleLayer alloc] initWithRawLayer:rawLayer];
}

}  // namespace nbgl
