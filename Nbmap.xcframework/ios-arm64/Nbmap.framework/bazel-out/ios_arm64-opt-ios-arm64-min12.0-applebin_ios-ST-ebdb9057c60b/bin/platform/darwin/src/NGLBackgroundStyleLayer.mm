// This file is generated.
// Edit platform/darwin/scripts/generate-style-code.js, then run `make darwin-style-code`.

#import "NGLSource.h"
#import "NSPredicate+NGLPrivateAdditions.h"
#import "NSDate+NGLAdditions.h"
#import "NGLStyleLayer_Private.h"
#import "NGLStyleValue_Private.h"
#import "NGLBackgroundStyleLayer.h"
#import "NGLLoggingConfiguration_Private.h"
#import "NGLBackgroundStyleLayer_Private.h"

#include <nbgl/style/layers/background_layer.hpp>
#include <nbgl/style/transition_options.hpp>


@interface NGLBackgroundStyleLayer ()

@property (nonatomic, readonly) nbgl::style::BackgroundLayer *rawLayer;

@end

@implementation NGLBackgroundStyleLayer

- (instancetype)initWithIdentifier:(NSString *)identifier
{
    NGLLogDebug(@"Initializing %@ with identifier: %@", NSStringFromClass([self class]), identifier);
    auto layer = std::make_unique<nbgl::style::BackgroundLayer>(identifier.UTF8String);
    return self = [super initWithPendingLayer:std::move(layer)];
}

- (nbgl::style::BackgroundLayer *)rawLayer
{
    return (nbgl::style::BackgroundLayer *)super.rawLayer;
}

// MARK: - Accessing the Paint Attributes

- (void)setBackgroundColor:(NSExpression *)backgroundColor {
    NGLAssertStyleLayerIsValid();
    NGLLogDebug(@"Setting backgroundColor: %@", backgroundColor);

    auto nbglValue = NGLStyleValueTransformer<nbgl::Color, NGLColor *>().toPropertyValue<nbgl::style::PropertyValue<nbgl::Color>>(backgroundColor, false);
    self.rawLayer->setBackgroundColor(nbglValue);
}

- (NSExpression *)backgroundColor {
    NGLAssertStyleLayerIsValid();

    auto propertyValue = self.rawLayer->getBackgroundColor();
    if (propertyValue.isUndefined()) {
        propertyValue = self.rawLayer->getDefaultBackgroundColor();
    }
    return NGLStyleValueTransformer<nbgl::Color, NGLColor *>().toExpression(propertyValue);
}

- (void)setBackgroundColorTransition:(NGLTransition )transition {
    NGLAssertStyleLayerIsValid();
    NGLLogDebug(@"Setting backgroundColorTransition: %@", NGLStringFromNGLTransition(transition));

    self.rawLayer->setBackgroundColorTransition(NGLOptionsFromTransition(transition));
}

- (NGLTransition)backgroundColorTransition {
    NGLAssertStyleLayerIsValid();

    nbgl::style::TransitionOptions transitionOptions = self.rawLayer->getBackgroundColorTransition();

    return NGLTransitionFromOptions(transitionOptions);
}

- (void)setBackgroundOpacity:(NSExpression *)backgroundOpacity {
    NGLAssertStyleLayerIsValid();
    NGLLogDebug(@"Setting backgroundOpacity: %@", backgroundOpacity);

    auto nbglValue = NGLStyleValueTransformer<float, NSNumber *>().toPropertyValue<nbgl::style::PropertyValue<float>>(backgroundOpacity, false);
    self.rawLayer->setBackgroundOpacity(nbglValue);
}

- (NSExpression *)backgroundOpacity {
    NGLAssertStyleLayerIsValid();

    auto propertyValue = self.rawLayer->getBackgroundOpacity();
    if (propertyValue.isUndefined()) {
        propertyValue = self.rawLayer->getDefaultBackgroundOpacity();
    }
    return NGLStyleValueTransformer<float, NSNumber *>().toExpression(propertyValue);
}

- (void)setBackgroundOpacityTransition:(NGLTransition )transition {
    NGLAssertStyleLayerIsValid();
    NGLLogDebug(@"Setting backgroundOpacityTransition: %@", NGLStringFromNGLTransition(transition));

    self.rawLayer->setBackgroundOpacityTransition(NGLOptionsFromTransition(transition));
}

- (NGLTransition)backgroundOpacityTransition {
    NGLAssertStyleLayerIsValid();

    nbgl::style::TransitionOptions transitionOptions = self.rawLayer->getBackgroundOpacityTransition();

    return NGLTransitionFromOptions(transitionOptions);
}

- (void)setBackgroundPattern:(NSExpression *)backgroundPattern {
    NGLAssertStyleLayerIsValid();
    NGLLogDebug(@"Setting backgroundPattern: %@", backgroundPattern);

    auto nbglValue = NGLStyleValueTransformer<nbgl::style::expression::Image, NSString *>().toPropertyValue<nbgl::style::PropertyValue<nbgl::style::expression::Image>>(backgroundPattern, false);
    self.rawLayer->setBackgroundPattern(nbglValue);
}

- (NSExpression *)backgroundPattern {
    NGLAssertStyleLayerIsValid();

    auto propertyValue = self.rawLayer->getBackgroundPattern();
    if (propertyValue.isUndefined()) {
        propertyValue = self.rawLayer->getDefaultBackgroundPattern();
    }
    return NGLStyleValueTransformer<nbgl::style::expression::Image, NSString *>().toExpression(propertyValue);
}

- (void)setBackgroundPatternTransition:(NGLTransition )transition {
    NGLAssertStyleLayerIsValid();
    NGLLogDebug(@"Setting backgroundPatternTransition: %@", NGLStringFromNGLTransition(transition));

    self.rawLayer->setBackgroundPatternTransition(NGLOptionsFromTransition(transition));
}

- (NGLTransition)backgroundPatternTransition {
    NGLAssertStyleLayerIsValid();

    nbgl::style::TransitionOptions transitionOptions = self.rawLayer->getBackgroundPatternTransition();

    return NGLTransitionFromOptions(transitionOptions);
}

@end

namespace nbgl {

NGLStyleLayer* BackgroundStyleLayerPeerFactory::createPeer(style::Layer* rawLayer) {
    return [[NGLBackgroundStyleLayer alloc] initWithRawLayer:rawLayer];
}

}  // namespace nbgl
