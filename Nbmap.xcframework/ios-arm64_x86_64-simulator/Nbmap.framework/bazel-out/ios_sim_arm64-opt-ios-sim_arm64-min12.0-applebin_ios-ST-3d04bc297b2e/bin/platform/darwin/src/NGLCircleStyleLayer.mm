// This file is generated.
// Edit platform/darwin/scripts/generate-style-code.js, then run `make darwin-style-code`.

#import "NGLSource.h"
#import "NSPredicate+NGLPrivateAdditions.h"
#import "NSDate+NGLAdditions.h"
#import "NGLStyleLayer_Private.h"
#import "NGLStyleValue_Private.h"
#import "NGLCircleStyleLayer.h"
#import "NGLLoggingConfiguration_Private.h"
#import "NGLCircleStyleLayer_Private.h"

#include <nbgl/style/layers/circle_layer.hpp>
#include <nbgl/style/transition_options.hpp>


namespace nbgl {

    MBGL_DEFINE_ENUM(NGLCirclePitchAlignment, {
        { NGLCirclePitchAlignmentMap, "map" },
        { NGLCirclePitchAlignmentViewport, "viewport" },
    });

    MBGL_DEFINE_ENUM(NGLCircleScaleAlignment, {
        { NGLCircleScaleAlignmentMap, "map" },
        { NGLCircleScaleAlignmentViewport, "viewport" },
    });

    MBGL_DEFINE_ENUM(NGLCircleTranslationAnchor, {
        { NGLCircleTranslationAnchorMap, "map" },
        { NGLCircleTranslationAnchorViewport, "viewport" },
    });

}

@interface NGLCircleStyleLayer ()

@property (nonatomic, readonly) nbgl::style::CircleLayer *rawLayer;

@end

@implementation NGLCircleStyleLayer

- (instancetype)initWithIdentifier:(NSString *)identifier source:(NGLSource *)source
{
    NGLLogDebug(@"Initializing %@ with identifier: %@ source: %@", NSStringFromClass([self class]), identifier, source);
    auto layer = std::make_unique<nbgl::style::CircleLayer>(identifier.UTF8String, source.identifier.UTF8String);
    return self = [super initWithPendingLayer:std::move(layer)];
}

- (nbgl::style::CircleLayer *)rawLayer
{
    return (nbgl::style::CircleLayer *)super.rawLayer;
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

- (void)setCircleSortKey:(NSExpression *)circleSortKey {
    NGLAssertStyleLayerIsValid();
    NGLLogDebug(@"Setting circleSortKey: %@", circleSortKey);

    auto nbglValue = NGLStyleValueTransformer<float, NSNumber *>().toPropertyValue<nbgl::style::PropertyValue<float>>(circleSortKey, true);
    self.rawLayer->setCircleSortKey(nbglValue);
}

- (NSExpression *)circleSortKey {
    NGLAssertStyleLayerIsValid();

    auto propertyValue = self.rawLayer->getCircleSortKey();
    if (propertyValue.isUndefined()) {
        propertyValue = self.rawLayer->getDefaultCircleSortKey();
    }
    return NGLStyleValueTransformer<float, NSNumber *>().toExpression(propertyValue);
}

// MARK: - Accessing the Paint Attributes

- (void)setCircleBlur:(NSExpression *)circleBlur {
    NGLAssertStyleLayerIsValid();
    NGLLogDebug(@"Setting circleBlur: %@", circleBlur);

    auto nbglValue = NGLStyleValueTransformer<float, NSNumber *>().toPropertyValue<nbgl::style::PropertyValue<float>>(circleBlur, true);
    self.rawLayer->setCircleBlur(nbglValue);
}

- (NSExpression *)circleBlur {
    NGLAssertStyleLayerIsValid();

    auto propertyValue = self.rawLayer->getCircleBlur();
    if (propertyValue.isUndefined()) {
        propertyValue = self.rawLayer->getDefaultCircleBlur();
    }
    return NGLStyleValueTransformer<float, NSNumber *>().toExpression(propertyValue);
}

- (void)setCircleBlurTransition:(NGLTransition )transition {
    NGLAssertStyleLayerIsValid();
    NGLLogDebug(@"Setting circleBlurTransition: %@", NGLStringFromNGLTransition(transition));

    self.rawLayer->setCircleBlurTransition(NGLOptionsFromTransition(transition));
}

- (NGLTransition)circleBlurTransition {
    NGLAssertStyleLayerIsValid();

    nbgl::style::TransitionOptions transitionOptions = self.rawLayer->getCircleBlurTransition();

    return NGLTransitionFromOptions(transitionOptions);
}

- (void)setCircleColor:(NSExpression *)circleColor {
    NGLAssertStyleLayerIsValid();
    NGLLogDebug(@"Setting circleColor: %@", circleColor);

    auto nbglValue = NGLStyleValueTransformer<nbgl::Color, NGLColor *>().toPropertyValue<nbgl::style::PropertyValue<nbgl::Color>>(circleColor, true);
    self.rawLayer->setCircleColor(nbglValue);
}

- (NSExpression *)circleColor {
    NGLAssertStyleLayerIsValid();

    auto propertyValue = self.rawLayer->getCircleColor();
    if (propertyValue.isUndefined()) {
        propertyValue = self.rawLayer->getDefaultCircleColor();
    }
    return NGLStyleValueTransformer<nbgl::Color, NGLColor *>().toExpression(propertyValue);
}

- (void)setCircleColorTransition:(NGLTransition )transition {
    NGLAssertStyleLayerIsValid();
    NGLLogDebug(@"Setting circleColorTransition: %@", NGLStringFromNGLTransition(transition));

    self.rawLayer->setCircleColorTransition(NGLOptionsFromTransition(transition));
}

- (NGLTransition)circleColorTransition {
    NGLAssertStyleLayerIsValid();

    nbgl::style::TransitionOptions transitionOptions = self.rawLayer->getCircleColorTransition();

    return NGLTransitionFromOptions(transitionOptions);
}

- (void)setCircleOpacity:(NSExpression *)circleOpacity {
    NGLAssertStyleLayerIsValid();
    NGLLogDebug(@"Setting circleOpacity: %@", circleOpacity);

    auto nbglValue = NGLStyleValueTransformer<float, NSNumber *>().toPropertyValue<nbgl::style::PropertyValue<float>>(circleOpacity, true);
    self.rawLayer->setCircleOpacity(nbglValue);
}

- (NSExpression *)circleOpacity {
    NGLAssertStyleLayerIsValid();

    auto propertyValue = self.rawLayer->getCircleOpacity();
    if (propertyValue.isUndefined()) {
        propertyValue = self.rawLayer->getDefaultCircleOpacity();
    }
    return NGLStyleValueTransformer<float, NSNumber *>().toExpression(propertyValue);
}

- (void)setCircleOpacityTransition:(NGLTransition )transition {
    NGLAssertStyleLayerIsValid();
    NGLLogDebug(@"Setting circleOpacityTransition: %@", NGLStringFromNGLTransition(transition));

    self.rawLayer->setCircleOpacityTransition(NGLOptionsFromTransition(transition));
}

- (NGLTransition)circleOpacityTransition {
    NGLAssertStyleLayerIsValid();

    nbgl::style::TransitionOptions transitionOptions = self.rawLayer->getCircleOpacityTransition();

    return NGLTransitionFromOptions(transitionOptions);
}

- (void)setCirclePitchAlignment:(NSExpression *)circlePitchAlignment {
    NGLAssertStyleLayerIsValid();
    NGLLogDebug(@"Setting circlePitchAlignment: %@", circlePitchAlignment);

    auto nbglValue = NGLStyleValueTransformer<nbgl::style::AlignmentType, NSValue *, nbgl::style::AlignmentType, NGLCirclePitchAlignment>().toPropertyValue<nbgl::style::PropertyValue<nbgl::style::AlignmentType>>(circlePitchAlignment, false);
    self.rawLayer->setCirclePitchAlignment(nbglValue);
}

- (NSExpression *)circlePitchAlignment {
    NGLAssertStyleLayerIsValid();

    auto propertyValue = self.rawLayer->getCirclePitchAlignment();
    if (propertyValue.isUndefined()) {
        propertyValue = self.rawLayer->getDefaultCirclePitchAlignment();
    }
    return NGLStyleValueTransformer<nbgl::style::AlignmentType, NSValue *, nbgl::style::AlignmentType, NGLCirclePitchAlignment>().toExpression(propertyValue);
}

- (void)setCircleRadius:(NSExpression *)circleRadius {
    NGLAssertStyleLayerIsValid();
    NGLLogDebug(@"Setting circleRadius: %@", circleRadius);

    auto nbglValue = NGLStyleValueTransformer<float, NSNumber *>().toPropertyValue<nbgl::style::PropertyValue<float>>(circleRadius, true);
    self.rawLayer->setCircleRadius(nbglValue);
}

- (NSExpression *)circleRadius {
    NGLAssertStyleLayerIsValid();

    auto propertyValue = self.rawLayer->getCircleRadius();
    if (propertyValue.isUndefined()) {
        propertyValue = self.rawLayer->getDefaultCircleRadius();
    }
    return NGLStyleValueTransformer<float, NSNumber *>().toExpression(propertyValue);
}

- (void)setCircleRadiusTransition:(NGLTransition )transition {
    NGLAssertStyleLayerIsValid();
    NGLLogDebug(@"Setting circleRadiusTransition: %@", NGLStringFromNGLTransition(transition));

    self.rawLayer->setCircleRadiusTransition(NGLOptionsFromTransition(transition));
}

- (NGLTransition)circleRadiusTransition {
    NGLAssertStyleLayerIsValid();

    nbgl::style::TransitionOptions transitionOptions = self.rawLayer->getCircleRadiusTransition();

    return NGLTransitionFromOptions(transitionOptions);
}

- (void)setCircleScaleAlignment:(NSExpression *)circleScaleAlignment {
    NGLAssertStyleLayerIsValid();
    NGLLogDebug(@"Setting circleScaleAlignment: %@", circleScaleAlignment);

    auto nbglValue = NGLStyleValueTransformer<nbgl::style::CirclePitchScaleType, NSValue *, nbgl::style::CirclePitchScaleType, NGLCircleScaleAlignment>().toPropertyValue<nbgl::style::PropertyValue<nbgl::style::CirclePitchScaleType>>(circleScaleAlignment, false);
    self.rawLayer->setCirclePitchScale(nbglValue);
}

- (NSExpression *)circleScaleAlignment {
    NGLAssertStyleLayerIsValid();

    auto propertyValue = self.rawLayer->getCirclePitchScale();
    if (propertyValue.isUndefined()) {
        propertyValue = self.rawLayer->getDefaultCirclePitchScale();
    }
    return NGLStyleValueTransformer<nbgl::style::CirclePitchScaleType, NSValue *, nbgl::style::CirclePitchScaleType, NGLCircleScaleAlignment>().toExpression(propertyValue);
}

- (void)setCirclePitchScale:(NSExpression *)circlePitchScale {
}

- (NSExpression *)circlePitchScale {
    return self.circleScaleAlignment;
}

- (void)setCircleStrokeColor:(NSExpression *)circleStrokeColor {
    NGLAssertStyleLayerIsValid();
    NGLLogDebug(@"Setting circleStrokeColor: %@", circleStrokeColor);

    auto nbglValue = NGLStyleValueTransformer<nbgl::Color, NGLColor *>().toPropertyValue<nbgl::style::PropertyValue<nbgl::Color>>(circleStrokeColor, true);
    self.rawLayer->setCircleStrokeColor(nbglValue);
}

- (NSExpression *)circleStrokeColor {
    NGLAssertStyleLayerIsValid();

    auto propertyValue = self.rawLayer->getCircleStrokeColor();
    if (propertyValue.isUndefined()) {
        propertyValue = self.rawLayer->getDefaultCircleStrokeColor();
    }
    return NGLStyleValueTransformer<nbgl::Color, NGLColor *>().toExpression(propertyValue);
}

- (void)setCircleStrokeColorTransition:(NGLTransition )transition {
    NGLAssertStyleLayerIsValid();
    NGLLogDebug(@"Setting circleStrokeColorTransition: %@", NGLStringFromNGLTransition(transition));

    self.rawLayer->setCircleStrokeColorTransition(NGLOptionsFromTransition(transition));
}

- (NGLTransition)circleStrokeColorTransition {
    NGLAssertStyleLayerIsValid();

    nbgl::style::TransitionOptions transitionOptions = self.rawLayer->getCircleStrokeColorTransition();

    return NGLTransitionFromOptions(transitionOptions);
}

- (void)setCircleStrokeOpacity:(NSExpression *)circleStrokeOpacity {
    NGLAssertStyleLayerIsValid();
    NGLLogDebug(@"Setting circleStrokeOpacity: %@", circleStrokeOpacity);

    auto nbglValue = NGLStyleValueTransformer<float, NSNumber *>().toPropertyValue<nbgl::style::PropertyValue<float>>(circleStrokeOpacity, true);
    self.rawLayer->setCircleStrokeOpacity(nbglValue);
}

- (NSExpression *)circleStrokeOpacity {
    NGLAssertStyleLayerIsValid();

    auto propertyValue = self.rawLayer->getCircleStrokeOpacity();
    if (propertyValue.isUndefined()) {
        propertyValue = self.rawLayer->getDefaultCircleStrokeOpacity();
    }
    return NGLStyleValueTransformer<float, NSNumber *>().toExpression(propertyValue);
}

- (void)setCircleStrokeOpacityTransition:(NGLTransition )transition {
    NGLAssertStyleLayerIsValid();
    NGLLogDebug(@"Setting circleStrokeOpacityTransition: %@", NGLStringFromNGLTransition(transition));

    self.rawLayer->setCircleStrokeOpacityTransition(NGLOptionsFromTransition(transition));
}

- (NGLTransition)circleStrokeOpacityTransition {
    NGLAssertStyleLayerIsValid();

    nbgl::style::TransitionOptions transitionOptions = self.rawLayer->getCircleStrokeOpacityTransition();

    return NGLTransitionFromOptions(transitionOptions);
}

- (void)setCircleStrokeWidth:(NSExpression *)circleStrokeWidth {
    NGLAssertStyleLayerIsValid();
    NGLLogDebug(@"Setting circleStrokeWidth: %@", circleStrokeWidth);

    auto nbglValue = NGLStyleValueTransformer<float, NSNumber *>().toPropertyValue<nbgl::style::PropertyValue<float>>(circleStrokeWidth, true);
    self.rawLayer->setCircleStrokeWidth(nbglValue);
}

- (NSExpression *)circleStrokeWidth {
    NGLAssertStyleLayerIsValid();

    auto propertyValue = self.rawLayer->getCircleStrokeWidth();
    if (propertyValue.isUndefined()) {
        propertyValue = self.rawLayer->getDefaultCircleStrokeWidth();
    }
    return NGLStyleValueTransformer<float, NSNumber *>().toExpression(propertyValue);
}

- (void)setCircleStrokeWidthTransition:(NGLTransition )transition {
    NGLAssertStyleLayerIsValid();
    NGLLogDebug(@"Setting circleStrokeWidthTransition: %@", NGLStringFromNGLTransition(transition));

    self.rawLayer->setCircleStrokeWidthTransition(NGLOptionsFromTransition(transition));
}

- (NGLTransition)circleStrokeWidthTransition {
    NGLAssertStyleLayerIsValid();

    nbgl::style::TransitionOptions transitionOptions = self.rawLayer->getCircleStrokeWidthTransition();

    return NGLTransitionFromOptions(transitionOptions);
}

- (void)setCircleTranslation:(NSExpression *)circleTranslation {
    NGLAssertStyleLayerIsValid();
    NGLLogDebug(@"Setting circleTranslation: %@", circleTranslation);

    auto nbglValue = NGLStyleValueTransformer<std::array<float, 2>, NSValue *>().toPropertyValue<nbgl::style::PropertyValue<std::array<float, 2>>>(circleTranslation, false);
    self.rawLayer->setCircleTranslate(nbglValue);
}

- (NSExpression *)circleTranslation {
    NGLAssertStyleLayerIsValid();

    auto propertyValue = self.rawLayer->getCircleTranslate();
    if (propertyValue.isUndefined()) {
        propertyValue = self.rawLayer->getDefaultCircleTranslate();
    }
    return NGLStyleValueTransformer<std::array<float, 2>, NSValue *>().toExpression(propertyValue);
}

- (void)setCircleTranslationTransition:(NGLTransition )transition {
    NGLAssertStyleLayerIsValid();
    NGLLogDebug(@"Setting circleTranslationTransition: %@", NGLStringFromNGLTransition(transition));

    self.rawLayer->setCircleTranslateTransition(NGLOptionsFromTransition(transition));
}

- (NGLTransition)circleTranslationTransition {
    NGLAssertStyleLayerIsValid();

    nbgl::style::TransitionOptions transitionOptions = self.rawLayer->getCircleTranslateTransition();

    return NGLTransitionFromOptions(transitionOptions);
}

- (void)setCircleTranslate:(NSExpression *)circleTranslate {
}

- (NSExpression *)circleTranslate {
    return self.circleTranslation;
}

- (void)setCircleTranslationAnchor:(NSExpression *)circleTranslationAnchor {
    NGLAssertStyleLayerIsValid();
    NGLLogDebug(@"Setting circleTranslationAnchor: %@", circleTranslationAnchor);

    auto nbglValue = NGLStyleValueTransformer<nbgl::style::TranslateAnchorType, NSValue *, nbgl::style::TranslateAnchorType, NGLCircleTranslationAnchor>().toPropertyValue<nbgl::style::PropertyValue<nbgl::style::TranslateAnchorType>>(circleTranslationAnchor, false);
    self.rawLayer->setCircleTranslateAnchor(nbglValue);
}

- (NSExpression *)circleTranslationAnchor {
    NGLAssertStyleLayerIsValid();

    auto propertyValue = self.rawLayer->getCircleTranslateAnchor();
    if (propertyValue.isUndefined()) {
        propertyValue = self.rawLayer->getDefaultCircleTranslateAnchor();
    }
    return NGLStyleValueTransformer<nbgl::style::TranslateAnchorType, NSValue *, nbgl::style::TranslateAnchorType, NGLCircleTranslationAnchor>().toExpression(propertyValue);
}

- (void)setCircleTranslateAnchor:(NSExpression *)circleTranslateAnchor {
}

- (NSExpression *)circleTranslateAnchor {
    return self.circleTranslationAnchor;
}

@end

@implementation NSValue (NGLCircleStyleLayerAdditions)

+ (NSValue *)valueWithNGLCirclePitchAlignment:(NGLCirclePitchAlignment)circlePitchAlignment {
    return [NSValue value:&circlePitchAlignment withObjCType:@encode(NGLCirclePitchAlignment)];
}

- (NGLCirclePitchAlignment)NGLCirclePitchAlignmentValue {
    NGLCirclePitchAlignment circlePitchAlignment;
    [self getValue:&circlePitchAlignment];
    return circlePitchAlignment;
}

+ (NSValue *)valueWithNGLCircleScaleAlignment:(NGLCircleScaleAlignment)circleScaleAlignment {
    return [NSValue value:&circleScaleAlignment withObjCType:@encode(NGLCircleScaleAlignment)];
}

- (NGLCircleScaleAlignment)NGLCircleScaleAlignmentValue {
    NGLCircleScaleAlignment circleScaleAlignment;
    [self getValue:&circleScaleAlignment];
    return circleScaleAlignment;
}

+ (NSValue *)valueWithNGLCircleTranslationAnchor:(NGLCircleTranslationAnchor)circleTranslationAnchor {
    return [NSValue value:&circleTranslationAnchor withObjCType:@encode(NGLCircleTranslationAnchor)];
}

- (NGLCircleTranslationAnchor)NGLCircleTranslationAnchorValue {
    NGLCircleTranslationAnchor circleTranslationAnchor;
    [self getValue:&circleTranslationAnchor];
    return circleTranslationAnchor;
}

@end

namespace nbgl {

NGLStyleLayer* CircleStyleLayerPeerFactory::createPeer(style::Layer* rawLayer) {
    return [[NGLCircleStyleLayer alloc] initWithRawLayer:rawLayer];
}

}  // namespace nbgl
