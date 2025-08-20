// This file is generated.
// Edit platform/darwin/scripts/generate-style-code.js, then run `make darwin-style-code`.

#import "NGLSource.h"
#import "NSPredicate+NGLPrivateAdditions.h"
#import "NSDate+NGLAdditions.h"
#import "NGLStyleLayer_Private.h"
#import "NGLStyleValue_Private.h"
#import "NGLLineStyleLayer.h"
#import "NGLLoggingConfiguration_Private.h"
#import "NGLLineStyleLayer_Private.h"

#include <nbgl/style/layers/line_layer.hpp>
#include <nbgl/style/transition_options.hpp>


namespace nbgl {

    MBGL_DEFINE_ENUM(NGLLineCap, {
        { NGLLineCapButt, "butt" },
        { NGLLineCapRound, "round" },
        { NGLLineCapSquare, "square" },
    });

    MBGL_DEFINE_ENUM(NGLLineJoin, {
        { NGLLineJoinBevel, "bevel" },
        { NGLLineJoinRound, "round" },
        { NGLLineJoinMiter, "miter" },
    });

    MBGL_DEFINE_ENUM(NGLLineTranslationAnchor, {
        { NGLLineTranslationAnchorMap, "map" },
        { NGLLineTranslationAnchorViewport, "viewport" },
    });

}

@interface NGLLineStyleLayer ()

@property (nonatomic, readonly) nbgl::style::LineLayer *rawLayer;

@end

@implementation NGLLineStyleLayer

- (instancetype)initWithIdentifier:(NSString *)identifier source:(NGLSource *)source
{
    NGLLogDebug(@"Initializing %@ with identifier: %@ source: %@", NSStringFromClass([self class]), identifier, source);
    auto layer = std::make_unique<nbgl::style::LineLayer>(identifier.UTF8String, source.identifier.UTF8String);
    return self = [super initWithPendingLayer:std::move(layer)];
}

- (nbgl::style::LineLayer *)rawLayer
{
    return (nbgl::style::LineLayer *)super.rawLayer;
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

- (void)setLineCap:(NSExpression *)lineCap {
    NGLAssertStyleLayerIsValid();
    NGLLogDebug(@"Setting lineCap: %@", lineCap);

    auto nbglValue = NGLStyleValueTransformer<nbgl::style::LineCapType, NSValue *, nbgl::style::LineCapType, NGLLineCap>().toPropertyValue<nbgl::style::PropertyValue<nbgl::style::LineCapType>>(lineCap, false);
    self.rawLayer->setLineCap(nbglValue);
}

- (NSExpression *)lineCap {
    NGLAssertStyleLayerIsValid();

    auto propertyValue = self.rawLayer->getLineCap();
    if (propertyValue.isUndefined()) {
        propertyValue = self.rawLayer->getDefaultLineCap();
    }
    return NGLStyleValueTransformer<nbgl::style::LineCapType, NSValue *, nbgl::style::LineCapType, NGLLineCap>().toExpression(propertyValue);
}

- (void)setLineJoin:(NSExpression *)lineJoin {
    NGLAssertStyleLayerIsValid();
    NGLLogDebug(@"Setting lineJoin: %@", lineJoin);

    auto nbglValue = NGLStyleValueTransformer<nbgl::style::LineJoinType, NSValue *, nbgl::style::LineJoinType, NGLLineJoin>().toPropertyValue<nbgl::style::PropertyValue<nbgl::style::LineJoinType>>(lineJoin, true);
    self.rawLayer->setLineJoin(nbglValue);
}

- (NSExpression *)lineJoin {
    NGLAssertStyleLayerIsValid();

    auto propertyValue = self.rawLayer->getLineJoin();
    if (propertyValue.isUndefined()) {
        propertyValue = self.rawLayer->getDefaultLineJoin();
    }
    return NGLStyleValueTransformer<nbgl::style::LineJoinType, NSValue *, nbgl::style::LineJoinType, NGLLineJoin>().toExpression(propertyValue);
}

- (void)setLineMiterLimit:(NSExpression *)lineMiterLimit {
    NGLAssertStyleLayerIsValid();
    NGLLogDebug(@"Setting lineMiterLimit: %@", lineMiterLimit);

    auto nbglValue = NGLStyleValueTransformer<float, NSNumber *>().toPropertyValue<nbgl::style::PropertyValue<float>>(lineMiterLimit, false);
    self.rawLayer->setLineMiterLimit(nbglValue);
}

- (NSExpression *)lineMiterLimit {
    NGLAssertStyleLayerIsValid();

    auto propertyValue = self.rawLayer->getLineMiterLimit();
    if (propertyValue.isUndefined()) {
        propertyValue = self.rawLayer->getDefaultLineMiterLimit();
    }
    return NGLStyleValueTransformer<float, NSNumber *>().toExpression(propertyValue);
}

- (void)setLineRoundLimit:(NSExpression *)lineRoundLimit {
    NGLAssertStyleLayerIsValid();
    NGLLogDebug(@"Setting lineRoundLimit: %@", lineRoundLimit);

    auto nbglValue = NGLStyleValueTransformer<float, NSNumber *>().toPropertyValue<nbgl::style::PropertyValue<float>>(lineRoundLimit, false);
    self.rawLayer->setLineRoundLimit(nbglValue);
}

- (NSExpression *)lineRoundLimit {
    NGLAssertStyleLayerIsValid();

    auto propertyValue = self.rawLayer->getLineRoundLimit();
    if (propertyValue.isUndefined()) {
        propertyValue = self.rawLayer->getDefaultLineRoundLimit();
    }
    return NGLStyleValueTransformer<float, NSNumber *>().toExpression(propertyValue);
}

- (void)setLineSortKey:(NSExpression *)lineSortKey {
    NGLAssertStyleLayerIsValid();
    NGLLogDebug(@"Setting lineSortKey: %@", lineSortKey);

    auto nbglValue = NGLStyleValueTransformer<float, NSNumber *>().toPropertyValue<nbgl::style::PropertyValue<float>>(lineSortKey, true);
    self.rawLayer->setLineSortKey(nbglValue);
}

- (NSExpression *)lineSortKey {
    NGLAssertStyleLayerIsValid();

    auto propertyValue = self.rawLayer->getLineSortKey();
    if (propertyValue.isUndefined()) {
        propertyValue = self.rawLayer->getDefaultLineSortKey();
    }
    return NGLStyleValueTransformer<float, NSNumber *>().toExpression(propertyValue);
}

// MARK: - Accessing the Paint Attributes

- (void)setLineBlur:(NSExpression *)lineBlur {
    NGLAssertStyleLayerIsValid();
    NGLLogDebug(@"Setting lineBlur: %@", lineBlur);

    auto nbglValue = NGLStyleValueTransformer<float, NSNumber *>().toPropertyValue<nbgl::style::PropertyValue<float>>(lineBlur, true);
    self.rawLayer->setLineBlur(nbglValue);
}

- (NSExpression *)lineBlur {
    NGLAssertStyleLayerIsValid();

    auto propertyValue = self.rawLayer->getLineBlur();
    if (propertyValue.isUndefined()) {
        propertyValue = self.rawLayer->getDefaultLineBlur();
    }
    return NGLStyleValueTransformer<float, NSNumber *>().toExpression(propertyValue);
}

- (void)setLineBlurTransition:(NGLTransition )transition {
    NGLAssertStyleLayerIsValid();
    NGLLogDebug(@"Setting lineBlurTransition: %@", NGLStringFromNGLTransition(transition));

    self.rawLayer->setLineBlurTransition(NGLOptionsFromTransition(transition));
}

- (NGLTransition)lineBlurTransition {
    NGLAssertStyleLayerIsValid();

    nbgl::style::TransitionOptions transitionOptions = self.rawLayer->getLineBlurTransition();

    return NGLTransitionFromOptions(transitionOptions);
}

- (void)setLineColor:(NSExpression *)lineColor {
    NGLAssertStyleLayerIsValid();
    NGLLogDebug(@"Setting lineColor: %@", lineColor);

    auto nbglValue = NGLStyleValueTransformer<nbgl::Color, NGLColor *>().toPropertyValue<nbgl::style::PropertyValue<nbgl::Color>>(lineColor, true);
    self.rawLayer->setLineColor(nbglValue);
}

- (NSExpression *)lineColor {
    NGLAssertStyleLayerIsValid();

    auto propertyValue = self.rawLayer->getLineColor();
    if (propertyValue.isUndefined()) {
        propertyValue = self.rawLayer->getDefaultLineColor();
    }
    return NGLStyleValueTransformer<nbgl::Color, NGLColor *>().toExpression(propertyValue);
}

- (void)setLineColorTransition:(NGLTransition )transition {
    NGLAssertStyleLayerIsValid();
    NGLLogDebug(@"Setting lineColorTransition: %@", NGLStringFromNGLTransition(transition));

    self.rawLayer->setLineColorTransition(NGLOptionsFromTransition(transition));
}

- (NGLTransition)lineColorTransition {
    NGLAssertStyleLayerIsValid();

    nbgl::style::TransitionOptions transitionOptions = self.rawLayer->getLineColorTransition();

    return NGLTransitionFromOptions(transitionOptions);
}

- (void)setLineDashPattern:(NSExpression *)lineDashPattern {
    NGLAssertStyleLayerIsValid();
    NGLLogDebug(@"Setting lineDashPattern: %@", lineDashPattern);

    auto nbglValue = NGLStyleValueTransformer<std::vector<float>, NSArray<NSNumber *> *, float>().toPropertyValue<nbgl::style::PropertyValue<std::vector<float>>>(lineDashPattern, false);
    self.rawLayer->setLineDasharray(nbglValue);
}

- (NSExpression *)lineDashPattern {
    NGLAssertStyleLayerIsValid();

    auto propertyValue = self.rawLayer->getLineDasharray();
    if (propertyValue.isUndefined()) {
        propertyValue = self.rawLayer->getDefaultLineDasharray();
    }
    return NGLStyleValueTransformer<std::vector<float>, NSArray<NSNumber *> *, float>().toExpression(propertyValue);
}

- (void)setLineDashPatternTransition:(NGLTransition )transition {
    NGLAssertStyleLayerIsValid();
    NGLLogDebug(@"Setting lineDashPatternTransition: %@", NGLStringFromNGLTransition(transition));

    self.rawLayer->setLineDasharrayTransition(NGLOptionsFromTransition(transition));
}

- (NGLTransition)lineDashPatternTransition {
    NGLAssertStyleLayerIsValid();

    nbgl::style::TransitionOptions transitionOptions = self.rawLayer->getLineDasharrayTransition();

    return NGLTransitionFromOptions(transitionOptions);
}

- (void)setLineDasharray:(NSExpression *)lineDasharray {
}

- (NSExpression *)lineDasharray {
    return self.lineDashPattern;
}

- (void)setLineGapWidth:(NSExpression *)lineGapWidth {
    NGLAssertStyleLayerIsValid();
    NGLLogDebug(@"Setting lineGapWidth: %@", lineGapWidth);

    auto nbglValue = NGLStyleValueTransformer<float, NSNumber *>().toPropertyValue<nbgl::style::PropertyValue<float>>(lineGapWidth, true);
    self.rawLayer->setLineGapWidth(nbglValue);
}

- (NSExpression *)lineGapWidth {
    NGLAssertStyleLayerIsValid();

    auto propertyValue = self.rawLayer->getLineGapWidth();
    if (propertyValue.isUndefined()) {
        propertyValue = self.rawLayer->getDefaultLineGapWidth();
    }
    return NGLStyleValueTransformer<float, NSNumber *>().toExpression(propertyValue);
}

- (void)setLineGapWidthTransition:(NGLTransition )transition {
    NGLAssertStyleLayerIsValid();
    NGLLogDebug(@"Setting lineGapWidthTransition: %@", NGLStringFromNGLTransition(transition));

    self.rawLayer->setLineGapWidthTransition(NGLOptionsFromTransition(transition));
}

- (NGLTransition)lineGapWidthTransition {
    NGLAssertStyleLayerIsValid();

    nbgl::style::TransitionOptions transitionOptions = self.rawLayer->getLineGapWidthTransition();

    return NGLTransitionFromOptions(transitionOptions);
}

- (void)setLineGradient:(NSExpression *)lineGradient {
    NGLAssertStyleLayerIsValid();
    NGLLogDebug(@"Setting lineGradient: %@", lineGradient);

    auto nbglValue = NGLStyleValueTransformer<nbgl::Color, NGLColor *>().toPropertyValue<nbgl::style::ColorRampPropertyValue>(lineGradient);
    self.rawLayer->setLineGradient(nbglValue);
}

- (NSExpression *)lineGradient {
    NGLAssertStyleLayerIsValid();

    auto propertyValue = self.rawLayer->getLineGradient();
    if (propertyValue.isUndefined()) {
        propertyValue = self.rawLayer->getDefaultLineGradient();
    }
    return NGLStyleValueTransformer<nbgl::Color, NGLColor *>().toExpression(propertyValue);
}

- (void)setLineOffset:(NSExpression *)lineOffset {
    NGLAssertStyleLayerIsValid();
    NGLLogDebug(@"Setting lineOffset: %@", lineOffset);

    auto nbglValue = NGLStyleValueTransformer<float, NSNumber *>().toPropertyValue<nbgl::style::PropertyValue<float>>(lineOffset, true);
    self.rawLayer->setLineOffset(nbglValue);
}

- (NSExpression *)lineOffset {
    NGLAssertStyleLayerIsValid();

    auto propertyValue = self.rawLayer->getLineOffset();
    if (propertyValue.isUndefined()) {
        propertyValue = self.rawLayer->getDefaultLineOffset();
    }
    return NGLStyleValueTransformer<float, NSNumber *>().toExpression(propertyValue);
}

- (void)setLineOffsetTransition:(NGLTransition )transition {
    NGLAssertStyleLayerIsValid();
    NGLLogDebug(@"Setting lineOffsetTransition: %@", NGLStringFromNGLTransition(transition));

    self.rawLayer->setLineOffsetTransition(NGLOptionsFromTransition(transition));
}

- (NGLTransition)lineOffsetTransition {
    NGLAssertStyleLayerIsValid();

    nbgl::style::TransitionOptions transitionOptions = self.rawLayer->getLineOffsetTransition();

    return NGLTransitionFromOptions(transitionOptions);
}

- (void)setLineOpacity:(NSExpression *)lineOpacity {
    NGLAssertStyleLayerIsValid();
    NGLLogDebug(@"Setting lineOpacity: %@", lineOpacity);

    auto nbglValue = NGLStyleValueTransformer<float, NSNumber *>().toPropertyValue<nbgl::style::PropertyValue<float>>(lineOpacity, true);
    self.rawLayer->setLineOpacity(nbglValue);
}

- (NSExpression *)lineOpacity {
    NGLAssertStyleLayerIsValid();

    auto propertyValue = self.rawLayer->getLineOpacity();
    if (propertyValue.isUndefined()) {
        propertyValue = self.rawLayer->getDefaultLineOpacity();
    }
    return NGLStyleValueTransformer<float, NSNumber *>().toExpression(propertyValue);
}

- (void)setLineOpacityTransition:(NGLTransition )transition {
    NGLAssertStyleLayerIsValid();
    NGLLogDebug(@"Setting lineOpacityTransition: %@", NGLStringFromNGLTransition(transition));

    self.rawLayer->setLineOpacityTransition(NGLOptionsFromTransition(transition));
}

- (NGLTransition)lineOpacityTransition {
    NGLAssertStyleLayerIsValid();

    nbgl::style::TransitionOptions transitionOptions = self.rawLayer->getLineOpacityTransition();

    return NGLTransitionFromOptions(transitionOptions);
}

- (void)setLinePattern:(NSExpression *)linePattern {
    NGLAssertStyleLayerIsValid();
    NGLLogDebug(@"Setting linePattern: %@", linePattern);

    auto nbglValue = NGLStyleValueTransformer<nbgl::style::expression::Image, NSString *>().toPropertyValue<nbgl::style::PropertyValue<nbgl::style::expression::Image>>(linePattern, true);
    self.rawLayer->setLinePattern(nbglValue);
}

- (NSExpression *)linePattern {
    NGLAssertStyleLayerIsValid();

    auto propertyValue = self.rawLayer->getLinePattern();
    if (propertyValue.isUndefined()) {
        propertyValue = self.rawLayer->getDefaultLinePattern();
    }
    return NGLStyleValueTransformer<nbgl::style::expression::Image, NSString *>().toExpression(propertyValue);
}

- (void)setLinePatternTransition:(NGLTransition )transition {
    NGLAssertStyleLayerIsValid();
    NGLLogDebug(@"Setting linePatternTransition: %@", NGLStringFromNGLTransition(transition));

    self.rawLayer->setLinePatternTransition(NGLOptionsFromTransition(transition));
}

- (NGLTransition)linePatternTransition {
    NGLAssertStyleLayerIsValid();

    nbgl::style::TransitionOptions transitionOptions = self.rawLayer->getLinePatternTransition();

    return NGLTransitionFromOptions(transitionOptions);
}

- (void)setLineTranslation:(NSExpression *)lineTranslation {
    NGLAssertStyleLayerIsValid();
    NGLLogDebug(@"Setting lineTranslation: %@", lineTranslation);

    auto nbglValue = NGLStyleValueTransformer<std::array<float, 2>, NSValue *>().toPropertyValue<nbgl::style::PropertyValue<std::array<float, 2>>>(lineTranslation, false);
    self.rawLayer->setLineTranslate(nbglValue);
}

- (NSExpression *)lineTranslation {
    NGLAssertStyleLayerIsValid();

    auto propertyValue = self.rawLayer->getLineTranslate();
    if (propertyValue.isUndefined()) {
        propertyValue = self.rawLayer->getDefaultLineTranslate();
    }
    return NGLStyleValueTransformer<std::array<float, 2>, NSValue *>().toExpression(propertyValue);
}

- (void)setLineTranslationTransition:(NGLTransition )transition {
    NGLAssertStyleLayerIsValid();
    NGLLogDebug(@"Setting lineTranslationTransition: %@", NGLStringFromNGLTransition(transition));

    self.rawLayer->setLineTranslateTransition(NGLOptionsFromTransition(transition));
}

- (NGLTransition)lineTranslationTransition {
    NGLAssertStyleLayerIsValid();

    nbgl::style::TransitionOptions transitionOptions = self.rawLayer->getLineTranslateTransition();

    return NGLTransitionFromOptions(transitionOptions);
}

- (void)setLineTranslate:(NSExpression *)lineTranslate {
}

- (NSExpression *)lineTranslate {
    return self.lineTranslation;
}

- (void)setLineTranslationAnchor:(NSExpression *)lineTranslationAnchor {
    NGLAssertStyleLayerIsValid();
    NGLLogDebug(@"Setting lineTranslationAnchor: %@", lineTranslationAnchor);

    auto nbglValue = NGLStyleValueTransformer<nbgl::style::TranslateAnchorType, NSValue *, nbgl::style::TranslateAnchorType, NGLLineTranslationAnchor>().toPropertyValue<nbgl::style::PropertyValue<nbgl::style::TranslateAnchorType>>(lineTranslationAnchor, false);
    self.rawLayer->setLineTranslateAnchor(nbglValue);
}

- (NSExpression *)lineTranslationAnchor {
    NGLAssertStyleLayerIsValid();

    auto propertyValue = self.rawLayer->getLineTranslateAnchor();
    if (propertyValue.isUndefined()) {
        propertyValue = self.rawLayer->getDefaultLineTranslateAnchor();
    }
    return NGLStyleValueTransformer<nbgl::style::TranslateAnchorType, NSValue *, nbgl::style::TranslateAnchorType, NGLLineTranslationAnchor>().toExpression(propertyValue);
}

- (void)setLineTranslateAnchor:(NSExpression *)lineTranslateAnchor {
}

- (NSExpression *)lineTranslateAnchor {
    return self.lineTranslationAnchor;
}

- (void)setLineWidth:(NSExpression *)lineWidth {
    NGLAssertStyleLayerIsValid();
    NGLLogDebug(@"Setting lineWidth: %@", lineWidth);

    auto nbglValue = NGLStyleValueTransformer<float, NSNumber *>().toPropertyValue<nbgl::style::PropertyValue<float>>(lineWidth, true);
    self.rawLayer->setLineWidth(nbglValue);
}

- (NSExpression *)lineWidth {
    NGLAssertStyleLayerIsValid();

    auto propertyValue = self.rawLayer->getLineWidth();
    if (propertyValue.isUndefined()) {
        propertyValue = self.rawLayer->getDefaultLineWidth();
    }
    return NGLStyleValueTransformer<float, NSNumber *>().toExpression(propertyValue);
}

- (void)setLineWidthTransition:(NGLTransition )transition {
    NGLAssertStyleLayerIsValid();
    NGLLogDebug(@"Setting lineWidthTransition: %@", NGLStringFromNGLTransition(transition));

    self.rawLayer->setLineWidthTransition(NGLOptionsFromTransition(transition));
}

- (NGLTransition)lineWidthTransition {
    NGLAssertStyleLayerIsValid();

    nbgl::style::TransitionOptions transitionOptions = self.rawLayer->getLineWidthTransition();

    return NGLTransitionFromOptions(transitionOptions);
}

@end

@implementation NSValue (NGLLineStyleLayerAdditions)

+ (NSValue *)valueWithNGLLineCap:(NGLLineCap)lineCap {
    return [NSValue value:&lineCap withObjCType:@encode(NGLLineCap)];
}

- (NGLLineCap)NGLLineCapValue {
    NGLLineCap lineCap;
    [self getValue:&lineCap];
    return lineCap;
}

+ (NSValue *)valueWithNGLLineJoin:(NGLLineJoin)lineJoin {
    return [NSValue value:&lineJoin withObjCType:@encode(NGLLineJoin)];
}

- (NGLLineJoin)NGLLineJoinValue {
    NGLLineJoin lineJoin;
    [self getValue:&lineJoin];
    return lineJoin;
}

+ (NSValue *)valueWithNGLLineTranslationAnchor:(NGLLineTranslationAnchor)lineTranslationAnchor {
    return [NSValue value:&lineTranslationAnchor withObjCType:@encode(NGLLineTranslationAnchor)];
}

- (NGLLineTranslationAnchor)NGLLineTranslationAnchorValue {
    NGLLineTranslationAnchor lineTranslationAnchor;
    [self getValue:&lineTranslationAnchor];
    return lineTranslationAnchor;
}

@end

namespace nbgl {

NGLStyleLayer* LineStyleLayerPeerFactory::createPeer(style::Layer* rawLayer) {
    return [[NGLLineStyleLayer alloc] initWithRawLayer:rawLayer];
}

}  // namespace nbgl
