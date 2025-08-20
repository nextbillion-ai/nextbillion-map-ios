// This file is generated.
// Edit platform/darwin/scripts/generate-style-code.js, then run `make darwin-style-code`.
// test

#import "NGLLight.h"

#import "NGLTypes.h"
#import "NGLStyleValue_Private.h"
#import "NSValue+NGLAdditions.h"
#import "NGLLoggingConfiguration_Private.h"

#import <nbgl/style/light.hpp>
#import <nbgl/style/types.hpp>

namespace nbgl {

    MBGL_DEFINE_ENUM(NGLLightAnchor, {
        { NGLLightAnchorMap, "map" },
        { NGLLightAnchorViewport, "viewport" },
    });

}

@interface NGLLight()

@end

@implementation NGLLight

- (instancetype)initWithMBGLLight:(const nbgl::style::Light *)nbglLight
{
    if (self = [super init]) {
        NGLLogInfo(@"Initializing %@.", NSStringFromClass([self class]));
        auto anchor = nbglLight->getAnchor();
        NSExpression *anchorExpression;
        if (anchor.isUndefined()) {
            nbgl::style::PropertyValue<nbgl::style::LightAnchorType> defaultAnchor = nbglLight->getDefaultAnchor();
            anchorExpression = NGLStyleValueTransformer<nbgl::style::LightAnchorType, NSValue *, nbgl::style::LightAnchorType, NGLLightAnchor>().toExpression(defaultAnchor);
        } else {
            anchorExpression = NGLStyleValueTransformer<nbgl::style::LightAnchorType, NSValue *, nbgl::style::LightAnchorType, NGLLightAnchor>().toExpression(anchor);
        }

        _anchor = anchorExpression;

        auto positionValue = nbglLight->getPosition();
        if (positionValue.isUndefined()) {
            _position = NGLStyleValueTransformer<nbgl::style::Position, NSValue *>().toExpression(nbglLight->getDefaultPosition());
        } else {
            _position = NGLStyleValueTransformer<nbgl::style::Position, NSValue *>().toExpression(positionValue);
        }
        _positionTransition = NGLTransitionFromOptions(nbglLight->getPositionTransition());
        auto colorValue = nbglLight->getColor();
        if (colorValue.isUndefined()) {
            _color = NGLStyleValueTransformer<nbgl::Color, NGLColor *>().toExpression(nbglLight->getDefaultColor());
        } else {
            _color = NGLStyleValueTransformer<nbgl::Color, NGLColor *>().toExpression(colorValue);
        }
        _colorTransition = NGLTransitionFromOptions(nbglLight->getColorTransition());
        auto intensityValue = nbglLight->getIntensity();
        if (intensityValue.isUndefined()) {
            _intensity = NGLStyleValueTransformer<float, NSNumber *>().toExpression(nbglLight->getDefaultIntensity());
        } else {
            _intensity = NGLStyleValueTransformer<float, NSNumber *>().toExpression(intensityValue);
        }
        _intensityTransition = NGLTransitionFromOptions(nbglLight->getIntensityTransition());
    }

    return self;
}

- (nbgl::style::Light)nbglLight
{
    nbgl::style::Light nbglLight;
    auto anchor = NGLStyleValueTransformer<nbgl::style::LightAnchorType, NSValue *, nbgl::style::LightAnchorType, NGLLightAnchor>().toPropertyValue<nbgl::style::PropertyValue<nbgl::style::LightAnchorType>>(self.anchor, false);
    nbglLight.setAnchor(anchor);

    auto position = NGLStyleValueTransformer<nbgl::style::Position, NSValue *>().toPropertyValue<nbgl::style::PropertyValue<nbgl::style::Position>>(self.position, false);
    nbglLight.setPosition(position);

    nbglLight.setPositionTransition(NGLOptionsFromTransition(self.positionTransition));

    auto color = NGLStyleValueTransformer<nbgl::Color, NGLColor *>().toPropertyValue<nbgl::style::PropertyValue<nbgl::Color>>(self.color, false);
    nbglLight.setColor(color);

    nbglLight.setColorTransition(NGLOptionsFromTransition(self.colorTransition));

    auto intensity = NGLStyleValueTransformer<float, NSNumber *>().toPropertyValue<nbgl::style::PropertyValue<float>>(self.intensity, false);
    nbglLight.setIntensity(intensity);

    nbglLight.setIntensityTransition(NGLOptionsFromTransition(self.intensityTransition));


    return nbglLight;
}



- (void)setAnchor:(NSExpression *)anchor {
    NGLLogDebug(@"Setting anchor: %@", anchor);
    _anchor = anchor;
}

- (void)setPosition:(NSExpression *)position {
    NGLLogDebug(@"Setting position: %@", position);
    _position = position;
}

- (void)setPositionTransition:(NGLTransition)transition {
    NGLLogDebug(@"Setting positionTransition: %@", NGLStringFromNGLTransition(transition));
    _positionTransition = transition;
}

- (void)setColor:(NSExpression *)color {
    NGLLogDebug(@"Setting color: %@", color);
    _color = color;
}

- (void)setColorTransition:(NGLTransition)transition {
    NGLLogDebug(@"Setting colorTransition: %@", NGLStringFromNGLTransition(transition));
    _colorTransition = transition;
}

- (void)setIntensity:(NSExpression *)intensity {
    NGLLogDebug(@"Setting intensity: %@", intensity);
    _intensity = intensity;
}

- (void)setIntensityTransition:(NGLTransition)transition {
    NGLLogDebug(@"Setting intensityTransition: %@", NGLStringFromNGLTransition(transition));
    _intensityTransition = transition;
}

@end
