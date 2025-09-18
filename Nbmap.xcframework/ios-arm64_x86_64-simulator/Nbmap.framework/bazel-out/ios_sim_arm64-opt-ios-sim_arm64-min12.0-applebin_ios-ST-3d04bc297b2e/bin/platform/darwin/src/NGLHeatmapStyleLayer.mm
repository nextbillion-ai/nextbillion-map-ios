// This file is generated.
// Edit platform/darwin/scripts/generate-style-code.js, then run `make darwin-style-code`.

#import "NGLSource.h"
#import "NSPredicate+NGLPrivateAdditions.h"
#import "NSDate+NGLAdditions.h"
#import "NGLStyleLayer_Private.h"
#import "NGLStyleValue_Private.h"
#import "NGLHeatmapStyleLayer.h"
#import "NGLLoggingConfiguration_Private.h"
#import "NGLHeatmapStyleLayer_Private.h"

#include <nbgl/style/layers/heatmap_layer.hpp>
#include <nbgl/style/transition_options.hpp>


@interface NGLHeatmapStyleLayer ()

@property (nonatomic, readonly) nbgl::style::HeatmapLayer *rawLayer;

@end

@implementation NGLHeatmapStyleLayer

- (instancetype)initWithIdentifier:(NSString *)identifier source:(NGLSource *)source
{
    NGLLogDebug(@"Initializing %@ with identifier: %@ source: %@", NSStringFromClass([self class]), identifier, source);
    auto layer = std::make_unique<nbgl::style::HeatmapLayer>(identifier.UTF8String, source.identifier.UTF8String);
    return self = [super initWithPendingLayer:std::move(layer)];
}

- (nbgl::style::HeatmapLayer *)rawLayer
{
    return (nbgl::style::HeatmapLayer *)super.rawLayer;
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

- (void)setHeatmapColor:(NSExpression *)heatmapColor {
    NGLAssertStyleLayerIsValid();
    NGLLogDebug(@"Setting heatmapColor: %@", heatmapColor);

    auto nbglValue = NGLStyleValueTransformer<nbgl::Color, NGLColor *>().toPropertyValue<nbgl::style::ColorRampPropertyValue>(heatmapColor);
    self.rawLayer->setHeatmapColor(nbglValue);
}

- (NSExpression *)heatmapColor {
    NGLAssertStyleLayerIsValid();

    auto propertyValue = self.rawLayer->getHeatmapColor();
    if (propertyValue.isUndefined()) {
        propertyValue = self.rawLayer->getDefaultHeatmapColor();
    }
    return NGLStyleValueTransformer<nbgl::Color, NGLColor *>().toExpression(propertyValue);
}

- (void)setHeatmapIntensity:(NSExpression *)heatmapIntensity {
    NGLAssertStyleLayerIsValid();
    NGLLogDebug(@"Setting heatmapIntensity: %@", heatmapIntensity);

    auto nbglValue = NGLStyleValueTransformer<float, NSNumber *>().toPropertyValue<nbgl::style::PropertyValue<float>>(heatmapIntensity, false);
    self.rawLayer->setHeatmapIntensity(nbglValue);
}

- (NSExpression *)heatmapIntensity {
    NGLAssertStyleLayerIsValid();

    auto propertyValue = self.rawLayer->getHeatmapIntensity();
    if (propertyValue.isUndefined()) {
        propertyValue = self.rawLayer->getDefaultHeatmapIntensity();
    }
    return NGLStyleValueTransformer<float, NSNumber *>().toExpression(propertyValue);
}

- (void)setHeatmapIntensityTransition:(NGLTransition )transition {
    NGLAssertStyleLayerIsValid();
    NGLLogDebug(@"Setting heatmapIntensityTransition: %@", NGLStringFromNGLTransition(transition));

    self.rawLayer->setHeatmapIntensityTransition(NGLOptionsFromTransition(transition));
}

- (NGLTransition)heatmapIntensityTransition {
    NGLAssertStyleLayerIsValid();

    nbgl::style::TransitionOptions transitionOptions = self.rawLayer->getHeatmapIntensityTransition();

    return NGLTransitionFromOptions(transitionOptions);
}

- (void)setHeatmapOpacity:(NSExpression *)heatmapOpacity {
    NGLAssertStyleLayerIsValid();
    NGLLogDebug(@"Setting heatmapOpacity: %@", heatmapOpacity);

    auto nbglValue = NGLStyleValueTransformer<float, NSNumber *>().toPropertyValue<nbgl::style::PropertyValue<float>>(heatmapOpacity, false);
    self.rawLayer->setHeatmapOpacity(nbglValue);
}

- (NSExpression *)heatmapOpacity {
    NGLAssertStyleLayerIsValid();

    auto propertyValue = self.rawLayer->getHeatmapOpacity();
    if (propertyValue.isUndefined()) {
        propertyValue = self.rawLayer->getDefaultHeatmapOpacity();
    }
    return NGLStyleValueTransformer<float, NSNumber *>().toExpression(propertyValue);
}

- (void)setHeatmapOpacityTransition:(NGLTransition )transition {
    NGLAssertStyleLayerIsValid();
    NGLLogDebug(@"Setting heatmapOpacityTransition: %@", NGLStringFromNGLTransition(transition));

    self.rawLayer->setHeatmapOpacityTransition(NGLOptionsFromTransition(transition));
}

- (NGLTransition)heatmapOpacityTransition {
    NGLAssertStyleLayerIsValid();

    nbgl::style::TransitionOptions transitionOptions = self.rawLayer->getHeatmapOpacityTransition();

    return NGLTransitionFromOptions(transitionOptions);
}

- (void)setHeatmapRadius:(NSExpression *)heatmapRadius {
    NGLAssertStyleLayerIsValid();
    NGLLogDebug(@"Setting heatmapRadius: %@", heatmapRadius);

    auto nbglValue = NGLStyleValueTransformer<float, NSNumber *>().toPropertyValue<nbgl::style::PropertyValue<float>>(heatmapRadius, true);
    self.rawLayer->setHeatmapRadius(nbglValue);
}

- (NSExpression *)heatmapRadius {
    NGLAssertStyleLayerIsValid();

    auto propertyValue = self.rawLayer->getHeatmapRadius();
    if (propertyValue.isUndefined()) {
        propertyValue = self.rawLayer->getDefaultHeatmapRadius();
    }
    return NGLStyleValueTransformer<float, NSNumber *>().toExpression(propertyValue);
}

- (void)setHeatmapRadiusTransition:(NGLTransition )transition {
    NGLAssertStyleLayerIsValid();
    NGLLogDebug(@"Setting heatmapRadiusTransition: %@", NGLStringFromNGLTransition(transition));

    self.rawLayer->setHeatmapRadiusTransition(NGLOptionsFromTransition(transition));
}

- (NGLTransition)heatmapRadiusTransition {
    NGLAssertStyleLayerIsValid();

    nbgl::style::TransitionOptions transitionOptions = self.rawLayer->getHeatmapRadiusTransition();

    return NGLTransitionFromOptions(transitionOptions);
}

- (void)setHeatmapWeight:(NSExpression *)heatmapWeight {
    NGLAssertStyleLayerIsValid();
    NGLLogDebug(@"Setting heatmapWeight: %@", heatmapWeight);

    auto nbglValue = NGLStyleValueTransformer<float, NSNumber *>().toPropertyValue<nbgl::style::PropertyValue<float>>(heatmapWeight, true);
    self.rawLayer->setHeatmapWeight(nbglValue);
}

- (NSExpression *)heatmapWeight {
    NGLAssertStyleLayerIsValid();

    auto propertyValue = self.rawLayer->getHeatmapWeight();
    if (propertyValue.isUndefined()) {
        propertyValue = self.rawLayer->getDefaultHeatmapWeight();
    }
    return NGLStyleValueTransformer<float, NSNumber *>().toExpression(propertyValue);
}

@end

namespace nbgl {

NGLStyleLayer* HeatmapStyleLayerPeerFactory::createPeer(style::Layer* rawLayer) {
    return [[NGLHeatmapStyleLayer alloc] initWithRawLayer:rawLayer];
}

}  // namespace nbgl
