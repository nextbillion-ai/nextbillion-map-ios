// This file is generated.
// Edit platform/darwin/scripts/generate-style-code.js, then run `make darwin-style-code`.
#import <XCTest/XCTest.h>
#import <Nextbillion.h>

#import "NGLLight_Private.h"

#import "../../darwin/src/NSDate+NGLAdditions.h"

#import <nbgl/style/light.hpp>
#import <nbgl/style/types.hpp>
#include <nbgl/style/transition_options.hpp>

@interface NGLLightTest : XCTestCase

@end

@implementation NGLLightTest

- (void)testProperties {

    NGLTransition defaultTransition = NGLTransitionMake(0, 0);
    NGLTransition transition = NGLTransitionMake(6, 3);
    nbgl::style::TransitionOptions transitionOptions { { NGLDurationFromTimeInterval(6) }, { NGLDurationFromTimeInterval(3) } };

    // anchor
    {
        nbgl::style::Light light;
        NGLLight *mglLight = [[NGLLight alloc] initWithMBGLLight:&light];
        auto lightFromNGLLight = mglLight.nbglLight;

        XCTAssertEqual(light.getDefaultAnchor(), lightFromNGLLight.getAnchor());
        XCTAssertEqual(mglLight.anchor.expressionType, NSConstantValueExpressionType, @"mglLight.anchor isn’t a constant value expression.");
        XCTAssertEqualObjects(mglLight.anchor.constantValue, @"viewport");

        nbgl::style::PropertyValue<nbgl::style::LightAnchorType> propertyValue = { nbgl::style::LightAnchorType::Viewport };
        light.setAnchor(propertyValue);
        mglLight = [[NGLLight alloc] initWithMBGLLight:&light];
        lightFromNGLLight = mglLight.nbglLight;

        XCTAssertEqual(light.getAnchor(), lightFromNGLLight.getAnchor());
    }

    // position
    {
        nbgl::style::Light light;
        NGLLight *mglLight = [[NGLLight alloc] initWithMBGLLight:&light];
        auto lightFromNGLLight = mglLight.nbglLight;

        XCTAssertEqual(light.getDefaultPosition(), lightFromNGLLight.getPosition());
        auto positionTransition = lightFromNGLLight.getPositionTransition();
        XCTAssert(positionTransition.delay && NGLTimeIntervalFromDuration(*positionTransition.delay) == defaultTransition.delay);
        XCTAssert(positionTransition.duration && NGLTimeIntervalFromDuration(*positionTransition.duration) == defaultTransition.duration);

        std::array<float, 3> positionArray = { { 6, 180, 90 } };
        nbgl::style::Position position = { positionArray };
        nbgl::style::PropertyValue<nbgl::style::Position> propertyValue = { position };
        light.setPosition(propertyValue);
        light.setPositionTransition(transitionOptions);

        mglLight = [[NGLLight alloc] initWithMBGLLight:&light];
        lightFromNGLLight = mglLight.nbglLight;

        XCTAssertEqual(light.getPosition(), lightFromNGLLight.getPosition());
        positionTransition = lightFromNGLLight.getPositionTransition();
        XCTAssert(positionTransition.delay && NGLTimeIntervalFromDuration(*positionTransition.delay) == transition.delay);
        XCTAssert(positionTransition.duration && NGLTimeIntervalFromDuration(*positionTransition.duration) == transition.duration);

    }

    // color
    {
        nbgl::style::Light light;
        NGLLight *mglLight = [[NGLLight alloc] initWithMBGLLight:&light];
        auto lightFromNGLLight = mglLight.nbglLight;

        XCTAssertEqual(light.getDefaultColor(), lightFromNGLLight.getColor());
        auto colorTransition = lightFromNGLLight.getColorTransition();
        XCTAssert(colorTransition.delay && NGLTimeIntervalFromDuration(*colorTransition.delay) == defaultTransition.delay);
        XCTAssert(colorTransition.duration && NGLTimeIntervalFromDuration(*colorTransition.duration) == defaultTransition.duration);

        nbgl::style::PropertyValue<nbgl::Color> propertyValue = { { 1, 0, 0, 1 } };
        light.setColor(propertyValue);
        light.setColorTransition(transitionOptions);

        mglLight = [[NGLLight alloc] initWithMBGLLight:&light];
        lightFromNGLLight = mglLight.nbglLight;

        XCTAssertEqual(light.getColor(), lightFromNGLLight.getColor());
        colorTransition = lightFromNGLLight.getColorTransition();
        XCTAssert(colorTransition.delay && NGLTimeIntervalFromDuration(*colorTransition.delay) == transition.delay);
        XCTAssert(colorTransition.duration && NGLTimeIntervalFromDuration(*colorTransition.duration) == transition.duration);

    }

    // intensity
    {
        nbgl::style::Light light;
        NGLLight *mglLight = [[NGLLight alloc] initWithMBGLLight:&light];
        auto lightFromNGLLight = mglLight.nbglLight;

        XCTAssertEqual(light.getDefaultIntensity(), lightFromNGLLight.getIntensity());
        auto intensityTransition = lightFromNGLLight.getIntensityTransition();
        XCTAssert(intensityTransition.delay && NGLTimeIntervalFromDuration(*intensityTransition.delay) == defaultTransition.delay);
        XCTAssert(intensityTransition.duration && NGLTimeIntervalFromDuration(*intensityTransition.duration) == defaultTransition.duration);

        nbgl::style::PropertyValue<float> propertyValue = { 1.0 };
        light.setIntensity(propertyValue);
        light.setIntensityTransition(transitionOptions);

        mglLight = [[NGLLight alloc] initWithMBGLLight:&light];
        lightFromNGLLight = mglLight.nbglLight;

        XCTAssertEqual(light.getIntensity(), lightFromNGLLight.getIntensity());
        intensityTransition = lightFromNGLLight.getIntensityTransition();
        XCTAssert(intensityTransition.delay && NGLTimeIntervalFromDuration(*intensityTransition.delay) == transition.delay);
        XCTAssert(intensityTransition.duration && NGLTimeIntervalFromDuration(*intensityTransition.duration) == transition.duration);

    }

}

- (void)testValueAdditions {
    NGLSphericalPosition position = NGLSphericalPositionMake(1.15, 210, 30);

    XCTAssertEqual([NSValue valueWithNGLSphericalPosition:position].NGLSphericalPositionValue.radial, position.radial);
    XCTAssertEqual([NSValue valueWithNGLSphericalPosition:position].NGLSphericalPositionValue.azimuthal, position.azimuthal);
    XCTAssertEqual([NSValue valueWithNGLSphericalPosition:position].NGLSphericalPositionValue.polar, position.polar);
    XCTAssertEqual([NSValue valueWithNGLLightAnchor:NGLLightAnchorMap].NGLLightAnchorValue, NGLLightAnchorMap);
    XCTAssertEqual([NSValue valueWithNGLLightAnchor:NGLLightAnchorViewport].NGLLightAnchorValue, NGLLightAnchorViewport);
}

@end
