// This file is generated.
// Edit platform/darwin/scripts/generate-style-code.js, then run `make darwin-style-code`.

#import "NGLSource.h"
#import "NSPredicate+NGLPrivateAdditions.h"
#import "NSDate+NGLAdditions.h"
#import "NGLStyleLayer_Private.h"
#import "NGLStyleValue_Private.h"
#import "NGLRasterStyleLayer.h"
#import "NGLLoggingConfiguration_Private.h"
#import "NGLRasterStyleLayer_Private.h"

#include <nbgl/style/layers/raster_layer.hpp>
#include <nbgl/style/transition_options.hpp>


namespace nbgl {

    MBGL_DEFINE_ENUM(NGLRasterResamplingMode, {
        { NGLRasterResamplingModeLinear, "linear" },
        { NGLRasterResamplingModeNearest, "nearest" },
    });

}

@interface NGLRasterStyleLayer ()

@property (nonatomic, readonly) nbgl::style::RasterLayer *rawLayer;

@end

@implementation NGLRasterStyleLayer

- (instancetype)initWithIdentifier:(NSString *)identifier source:(NGLSource *)source
{
    NGLLogDebug(@"Initializing %@ with identifier: %@ source: %@", NSStringFromClass([self class]), identifier, source);
    auto layer = std::make_unique<nbgl::style::RasterLayer>(identifier.UTF8String, source.identifier.UTF8String);
    return self = [super initWithPendingLayer:std::move(layer)];
}

- (nbgl::style::RasterLayer *)rawLayer
{
    return (nbgl::style::RasterLayer *)super.rawLayer;
}

- (NSString *)sourceIdentifier
{
    NGLAssertStyleLayerIsValid();

    return @(self.rawLayer->getSourceID().c_str());
}

// MARK: - Accessing the Paint Attributes

- (void)setMaximumRasterBrightness:(NSExpression *)maximumRasterBrightness {
    NGLAssertStyleLayerIsValid();
    NGLLogDebug(@"Setting maximumRasterBrightness: %@", maximumRasterBrightness);

    auto nbglValue = NGLStyleValueTransformer<float, NSNumber *>().toPropertyValue<nbgl::style::PropertyValue<float>>(maximumRasterBrightness, false);
    self.rawLayer->setRasterBrightnessMax(nbglValue);
}

- (NSExpression *)maximumRasterBrightness {
    NGLAssertStyleLayerIsValid();

    auto propertyValue = self.rawLayer->getRasterBrightnessMax();
    if (propertyValue.isUndefined()) {
        propertyValue = self.rawLayer->getDefaultRasterBrightnessMax();
    }
    return NGLStyleValueTransformer<float, NSNumber *>().toExpression(propertyValue);
}

- (void)setMaximumRasterBrightnessTransition:(NGLTransition )transition {
    NGLAssertStyleLayerIsValid();
    NGLLogDebug(@"Setting maximumRasterBrightnessTransition: %@", NGLStringFromNGLTransition(transition));

    self.rawLayer->setRasterBrightnessMaxTransition(NGLOptionsFromTransition(transition));
}

- (NGLTransition)maximumRasterBrightnessTransition {
    NGLAssertStyleLayerIsValid();

    nbgl::style::TransitionOptions transitionOptions = self.rawLayer->getRasterBrightnessMaxTransition();

    return NGLTransitionFromOptions(transitionOptions);
}

- (void)setRasterBrightnessMax:(NSExpression *)rasterBrightnessMax {
}

- (NSExpression *)rasterBrightnessMax {
    return self.maximumRasterBrightness;
}

- (void)setMinimumRasterBrightness:(NSExpression *)minimumRasterBrightness {
    NGLAssertStyleLayerIsValid();
    NGLLogDebug(@"Setting minimumRasterBrightness: %@", minimumRasterBrightness);

    auto nbglValue = NGLStyleValueTransformer<float, NSNumber *>().toPropertyValue<nbgl::style::PropertyValue<float>>(minimumRasterBrightness, false);
    self.rawLayer->setRasterBrightnessMin(nbglValue);
}

- (NSExpression *)minimumRasterBrightness {
    NGLAssertStyleLayerIsValid();

    auto propertyValue = self.rawLayer->getRasterBrightnessMin();
    if (propertyValue.isUndefined()) {
        propertyValue = self.rawLayer->getDefaultRasterBrightnessMin();
    }
    return NGLStyleValueTransformer<float, NSNumber *>().toExpression(propertyValue);
}

- (void)setMinimumRasterBrightnessTransition:(NGLTransition )transition {
    NGLAssertStyleLayerIsValid();
    NGLLogDebug(@"Setting minimumRasterBrightnessTransition: %@", NGLStringFromNGLTransition(transition));

    self.rawLayer->setRasterBrightnessMinTransition(NGLOptionsFromTransition(transition));
}

- (NGLTransition)minimumRasterBrightnessTransition {
    NGLAssertStyleLayerIsValid();

    nbgl::style::TransitionOptions transitionOptions = self.rawLayer->getRasterBrightnessMinTransition();

    return NGLTransitionFromOptions(transitionOptions);
}

- (void)setRasterBrightnessMin:(NSExpression *)rasterBrightnessMin {
}

- (NSExpression *)rasterBrightnessMin {
    return self.minimumRasterBrightness;
}

- (void)setRasterContrast:(NSExpression *)rasterContrast {
    NGLAssertStyleLayerIsValid();
    NGLLogDebug(@"Setting rasterContrast: %@", rasterContrast);

    auto nbglValue = NGLStyleValueTransformer<float, NSNumber *>().toPropertyValue<nbgl::style::PropertyValue<float>>(rasterContrast, false);
    self.rawLayer->setRasterContrast(nbglValue);
}

- (NSExpression *)rasterContrast {
    NGLAssertStyleLayerIsValid();

    auto propertyValue = self.rawLayer->getRasterContrast();
    if (propertyValue.isUndefined()) {
        propertyValue = self.rawLayer->getDefaultRasterContrast();
    }
    return NGLStyleValueTransformer<float, NSNumber *>().toExpression(propertyValue);
}

- (void)setRasterContrastTransition:(NGLTransition )transition {
    NGLAssertStyleLayerIsValid();
    NGLLogDebug(@"Setting rasterContrastTransition: %@", NGLStringFromNGLTransition(transition));

    self.rawLayer->setRasterContrastTransition(NGLOptionsFromTransition(transition));
}

- (NGLTransition)rasterContrastTransition {
    NGLAssertStyleLayerIsValid();

    nbgl::style::TransitionOptions transitionOptions = self.rawLayer->getRasterContrastTransition();

    return NGLTransitionFromOptions(transitionOptions);
}

- (void)setRasterFadeDuration:(NSExpression *)rasterFadeDuration {
    NGLAssertStyleLayerIsValid();
    NGLLogDebug(@"Setting rasterFadeDuration: %@", rasterFadeDuration);

    auto nbglValue = NGLStyleValueTransformer<float, NSNumber *>().toPropertyValue<nbgl::style::PropertyValue<float>>(rasterFadeDuration, false);
    self.rawLayer->setRasterFadeDuration(nbglValue);
}

- (NSExpression *)rasterFadeDuration {
    NGLAssertStyleLayerIsValid();

    auto propertyValue = self.rawLayer->getRasterFadeDuration();
    if (propertyValue.isUndefined()) {
        propertyValue = self.rawLayer->getDefaultRasterFadeDuration();
    }
    return NGLStyleValueTransformer<float, NSNumber *>().toExpression(propertyValue);
}

- (void)setRasterHueRotation:(NSExpression *)rasterHueRotation {
    NGLAssertStyleLayerIsValid();
    NGLLogDebug(@"Setting rasterHueRotation: %@", rasterHueRotation);

    auto nbglValue = NGLStyleValueTransformer<float, NSNumber *>().toPropertyValue<nbgl::style::PropertyValue<float>>(rasterHueRotation, false);
    self.rawLayer->setRasterHueRotate(nbglValue);
}

- (NSExpression *)rasterHueRotation {
    NGLAssertStyleLayerIsValid();

    auto propertyValue = self.rawLayer->getRasterHueRotate();
    if (propertyValue.isUndefined()) {
        propertyValue = self.rawLayer->getDefaultRasterHueRotate();
    }
    return NGLStyleValueTransformer<float, NSNumber *>().toExpression(propertyValue);
}

- (void)setRasterHueRotationTransition:(NGLTransition )transition {
    NGLAssertStyleLayerIsValid();
    NGLLogDebug(@"Setting rasterHueRotationTransition: %@", NGLStringFromNGLTransition(transition));

    self.rawLayer->setRasterHueRotateTransition(NGLOptionsFromTransition(transition));
}

- (NGLTransition)rasterHueRotationTransition {
    NGLAssertStyleLayerIsValid();

    nbgl::style::TransitionOptions transitionOptions = self.rawLayer->getRasterHueRotateTransition();

    return NGLTransitionFromOptions(transitionOptions);
}

- (void)setRasterHueRotate:(NSExpression *)rasterHueRotate {
}

- (NSExpression *)rasterHueRotate {
    return self.rasterHueRotation;
}

- (void)setRasterOpacity:(NSExpression *)rasterOpacity {
    NGLAssertStyleLayerIsValid();
    NGLLogDebug(@"Setting rasterOpacity: %@", rasterOpacity);

    auto nbglValue = NGLStyleValueTransformer<float, NSNumber *>().toPropertyValue<nbgl::style::PropertyValue<float>>(rasterOpacity, false);
    self.rawLayer->setRasterOpacity(nbglValue);
}

- (NSExpression *)rasterOpacity {
    NGLAssertStyleLayerIsValid();

    auto propertyValue = self.rawLayer->getRasterOpacity();
    if (propertyValue.isUndefined()) {
        propertyValue = self.rawLayer->getDefaultRasterOpacity();
    }
    return NGLStyleValueTransformer<float, NSNumber *>().toExpression(propertyValue);
}

- (void)setRasterOpacityTransition:(NGLTransition )transition {
    NGLAssertStyleLayerIsValid();
    NGLLogDebug(@"Setting rasterOpacityTransition: %@", NGLStringFromNGLTransition(transition));

    self.rawLayer->setRasterOpacityTransition(NGLOptionsFromTransition(transition));
}

- (NGLTransition)rasterOpacityTransition {
    NGLAssertStyleLayerIsValid();

    nbgl::style::TransitionOptions transitionOptions = self.rawLayer->getRasterOpacityTransition();

    return NGLTransitionFromOptions(transitionOptions);
}

- (void)setRasterResamplingMode:(NSExpression *)rasterResamplingMode {
    NGLAssertStyleLayerIsValid();
    NGLLogDebug(@"Setting rasterResamplingMode: %@", rasterResamplingMode);

    auto nbglValue = NGLStyleValueTransformer<nbgl::style::RasterResamplingType, NSValue *, nbgl::style::RasterResamplingType, NGLRasterResamplingMode>().toPropertyValue<nbgl::style::PropertyValue<nbgl::style::RasterResamplingType>>(rasterResamplingMode, false);
    self.rawLayer->setRasterResampling(nbglValue);
}

- (NSExpression *)rasterResamplingMode {
    NGLAssertStyleLayerIsValid();

    auto propertyValue = self.rawLayer->getRasterResampling();
    if (propertyValue.isUndefined()) {
        propertyValue = self.rawLayer->getDefaultRasterResampling();
    }
    return NGLStyleValueTransformer<nbgl::style::RasterResamplingType, NSValue *, nbgl::style::RasterResamplingType, NGLRasterResamplingMode>().toExpression(propertyValue);
}

- (void)setRasterResampling:(NSExpression *)rasterResampling {
}

- (NSExpression *)rasterResampling {
    return self.rasterResamplingMode;
}

- (void)setRasterSaturation:(NSExpression *)rasterSaturation {
    NGLAssertStyleLayerIsValid();
    NGLLogDebug(@"Setting rasterSaturation: %@", rasterSaturation);

    auto nbglValue = NGLStyleValueTransformer<float, NSNumber *>().toPropertyValue<nbgl::style::PropertyValue<float>>(rasterSaturation, false);
    self.rawLayer->setRasterSaturation(nbglValue);
}

- (NSExpression *)rasterSaturation {
    NGLAssertStyleLayerIsValid();

    auto propertyValue = self.rawLayer->getRasterSaturation();
    if (propertyValue.isUndefined()) {
        propertyValue = self.rawLayer->getDefaultRasterSaturation();
    }
    return NGLStyleValueTransformer<float, NSNumber *>().toExpression(propertyValue);
}

- (void)setRasterSaturationTransition:(NGLTransition )transition {
    NGLAssertStyleLayerIsValid();
    NGLLogDebug(@"Setting rasterSaturationTransition: %@", NGLStringFromNGLTransition(transition));

    self.rawLayer->setRasterSaturationTransition(NGLOptionsFromTransition(transition));
}

- (NGLTransition)rasterSaturationTransition {
    NGLAssertStyleLayerIsValid();

    nbgl::style::TransitionOptions transitionOptions = self.rawLayer->getRasterSaturationTransition();

    return NGLTransitionFromOptions(transitionOptions);
}

@end

@implementation NSValue (NGLRasterStyleLayerAdditions)

+ (NSValue *)valueWithNGLRasterResamplingMode:(NGLRasterResamplingMode)rasterResamplingMode {
    return [NSValue value:&rasterResamplingMode withObjCType:@encode(NGLRasterResamplingMode)];
}

- (NGLRasterResamplingMode)NGLRasterResamplingModeValue {
    NGLRasterResamplingMode rasterResamplingMode;
    [self getValue:&rasterResamplingMode];
    return rasterResamplingMode;
}

@end

namespace nbgl {

NGLStyleLayer* RasterStyleLayerPeerFactory::createPeer(style::Layer* rawLayer) {
    return [[NGLRasterStyleLayer alloc] initWithRawLayer:rawLayer];
}

}  // namespace nbgl
