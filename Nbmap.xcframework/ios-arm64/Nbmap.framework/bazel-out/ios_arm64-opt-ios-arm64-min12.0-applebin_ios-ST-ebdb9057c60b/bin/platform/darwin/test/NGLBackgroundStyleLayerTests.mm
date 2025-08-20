// This file is generated.
// Edit platform/darwin/scripts/generate-style-code.js, then run `make darwin-style-code`.

#import "NGLStyleLayerTests.h"
#import "../../darwin/src/NSDate+NGLAdditions.h"

#import "NGLStyleLayer_Private.h"

#include <nbgl/style/layers/background_layer.hpp>
#include <nbgl/style/transition_options.hpp>
#include <nbgl/style/expression/dsl.hpp>

@interface NGLBackgroundLayerTests : NGLStyleLayerTests
@end

@implementation NGLBackgroundLayerTests

+ (NSString *)layerType {
    return @"background";
}

- (void)testProperties {
    NGLBackgroundStyleLayer *layer = [[NGLBackgroundStyleLayer alloc] initWithIdentifier:@"layerID"];
    XCTAssertNotEqual(layer.rawLayer, nullptr);
    XCTAssertEqualObjects(@(layer.rawLayer->getTypeInfo()->type), @"background");
    auto rawLayer = static_cast<nbgl::style::BackgroundLayer*>(layer.rawLayer);

    NGLTransition transitionTest = NGLTransitionMake(5, 4);


    // background-color
    {
        XCTAssertTrue(rawLayer->getBackgroundColor().isUndefined(),
                      @"background-color should be unset initially.");
        NSExpression *defaultExpression = layer.backgroundColor;

        NSExpression *constantExpression = [NSExpression expressionWithFormat:@"%@", [NGLColor redColor]];
        layer.backgroundColor = constantExpression;
        nbgl::style::PropertyValue<nbgl::Color> propertyValue = { { 1, 0, 0, 1 } };
        XCTAssertEqual(rawLayer->getBackgroundColor(), propertyValue,
                       @"Setting backgroundColor to a constant value expression should update background-color.");
        XCTAssertEqualObjects(layer.backgroundColor, constantExpression,
                              @"backgroundColor should round-trip constant value expressions.");

        constantExpression = [NSExpression expressionWithFormat:@"%@", [NGLColor redColor]];
        XCTExpectFailure(@"Awaiting unit test refactoring https://github.com/maplibre/maplibre-native/issues/421");
        NSExpression *functionExpression = [NSExpression expressionWithFormat:@"ngl_step:from:stops:($zoomLevel, %@, %@)", constantExpression, @{@18: constantExpression}];
        layer.backgroundColor = functionExpression;

        {
            using namespace nbgl::style::expression::dsl;
            propertyValue = nbgl::style::PropertyExpression<nbgl::Color>(
                step(zoom(), literal(nbgl::Color(1, 0, 0, 1)), 18.0, literal(nbgl::Color(1, 0, 0, 1)))
            );
        }

        XCTAssertEqual(rawLayer->getBackgroundColor(), propertyValue,
                       @"Setting backgroundColor to a camera expression should update background-color.");
        XCTAssertEqualObjects(layer.backgroundColor, functionExpression,
                              @"backgroundColor should round-trip camera expressions.");


        layer.backgroundColor = nil;
        XCTAssertTrue(rawLayer->getBackgroundColor().isUndefined(),
                      @"Unsetting backgroundColor should return background-color to the default value.");
        XCTAssertEqualObjects(layer.backgroundColor, defaultExpression,
                              @"backgroundColor should return the default value after being unset.");

        functionExpression = [NSExpression expressionForKeyPath:@"bogus"];
        XCTAssertThrowsSpecificNamed(layer.backgroundColor = functionExpression, NSException, NSInvalidArgumentException, @"NGLBackgroundLayer should raise an exception if a camera-data expression is applied to a property that does not support key paths to feature attributes.");
        functionExpression = [NSExpression expressionWithFormat:@"ngl_step:from:stops:(bogus, %@, %@)", constantExpression, @{@18: constantExpression}];
        functionExpression = [NSExpression expressionWithFormat:@"ngl_interpolate:withCurveType:parameters:stops:($zoomLevel, 'linear', nil, %@)", @{@10: functionExpression}];
        XCTAssertThrowsSpecificNamed(layer.backgroundColor = functionExpression, NSException, NSInvalidArgumentException, @"NGLBackgroundLayer should raise an exception if a camera-data expression is applied to a property that does not support key paths to feature attributes.");
        // Transition property test
        layer.backgroundColorTransition = transitionTest;
        auto toptions = rawLayer->getBackgroundColorTransition();
        XCTAssert(toptions.delay && NGLTimeIntervalFromDuration(*toptions.delay) == transitionTest.delay);
        XCTAssert(toptions.duration && NGLTimeIntervalFromDuration(*toptions.duration) == transitionTest.duration);

        NGLTransition backgroundColorTransition = layer.backgroundColorTransition;
        XCTAssertEqual(backgroundColorTransition.delay, transitionTest.delay);
        XCTAssertEqual(backgroundColorTransition.duration, transitionTest.duration);
    }

    // background-opacity
    {
        XCTAssertTrue(rawLayer->getBackgroundOpacity().isUndefined(),
                      @"background-opacity should be unset initially.");
        NSExpression *defaultExpression = layer.backgroundOpacity;

        NSExpression *constantExpression = [NSExpression expressionWithFormat:@"1"];
        layer.backgroundOpacity = constantExpression;
        nbgl::style::PropertyValue<float> propertyValue = { 1.0 };
        XCTAssertEqual(rawLayer->getBackgroundOpacity(), propertyValue,
                       @"Setting backgroundOpacity to a constant value expression should update background-opacity.");
        XCTAssertEqualObjects(layer.backgroundOpacity, constantExpression,
                              @"backgroundOpacity should round-trip constant value expressions.");

        constantExpression = [NSExpression expressionWithFormat:@"1"];
        XCTExpectFailure(@"Awaiting unit test refactoring https://github.com/maplibre/maplibre-native/issues/421");
        NSExpression *functionExpression = [NSExpression expressionWithFormat:@"ngl_step:from:stops:($zoomLevel, %@, %@)", constantExpression, @{@18: constantExpression}];
        layer.backgroundOpacity = functionExpression;

        {
            using namespace nbgl::style::expression::dsl;
            propertyValue = nbgl::style::PropertyExpression<float>(
                step(zoom(), literal(1.0), 18.0, literal(1.0))
            );
        }

        XCTAssertEqual(rawLayer->getBackgroundOpacity(), propertyValue,
                       @"Setting backgroundOpacity to a camera expression should update background-opacity.");
        XCTAssertEqualObjects(layer.backgroundOpacity, functionExpression,
                              @"backgroundOpacity should round-trip camera expressions.");


        layer.backgroundOpacity = nil;
        XCTAssertTrue(rawLayer->getBackgroundOpacity().isUndefined(),
                      @"Unsetting backgroundOpacity should return background-opacity to the default value.");
        XCTAssertEqualObjects(layer.backgroundOpacity, defaultExpression,
                              @"backgroundOpacity should return the default value after being unset.");

        functionExpression = [NSExpression expressionForKeyPath:@"bogus"];
        XCTAssertThrowsSpecificNamed(layer.backgroundOpacity = functionExpression, NSException, NSInvalidArgumentException, @"NGLBackgroundLayer should raise an exception if a camera-data expression is applied to a property that does not support key paths to feature attributes.");
        functionExpression = [NSExpression expressionWithFormat:@"ngl_step:from:stops:(bogus, %@, %@)", constantExpression, @{@18: constantExpression}];
        functionExpression = [NSExpression expressionWithFormat:@"ngl_interpolate:withCurveType:parameters:stops:($zoomLevel, 'linear', nil, %@)", @{@10: functionExpression}];
        XCTAssertThrowsSpecificNamed(layer.backgroundOpacity = functionExpression, NSException, NSInvalidArgumentException, @"NGLBackgroundLayer should raise an exception if a camera-data expression is applied to a property that does not support key paths to feature attributes.");
        // Transition property test
        layer.backgroundOpacityTransition = transitionTest;
        auto toptions = rawLayer->getBackgroundOpacityTransition();
        XCTAssert(toptions.delay && NGLTimeIntervalFromDuration(*toptions.delay) == transitionTest.delay);
        XCTAssert(toptions.duration && NGLTimeIntervalFromDuration(*toptions.duration) == transitionTest.duration);

        NGLTransition backgroundOpacityTransition = layer.backgroundOpacityTransition;
        XCTAssertEqual(backgroundOpacityTransition.delay, transitionTest.delay);
        XCTAssertEqual(backgroundOpacityTransition.duration, transitionTest.duration);
    }

    // background-pattern
    {
        XCTAssertTrue(rawLayer->getBackgroundPattern().isUndefined(),
                      @"background-pattern should be unset initially.");
        NSExpression *defaultExpression = layer.backgroundPattern;

        NSExpression *constantExpression = [NSExpression expressionForConstantValue:@"Background Pattern"];
        layer.backgroundPattern = constantExpression;
        nbgl::style::PropertyValue<nbgl::style::expression::Image> propertyValue = { "Background Pattern" };
        XCTAssertEqual(rawLayer->getBackgroundPattern(), propertyValue,
                       @"Setting backgroundPattern to a constant value expression should update background-pattern.");
        XCTAssertEqualObjects(layer.backgroundPattern, constantExpression,
                              @"backgroundPattern should round-trip constant value expressions.");

        constantExpression = [NSExpression expressionWithFormat:@"NGL_FUNCTION('image', 'Background Pattern')"];
        XCTExpectFailure(@"Awaiting unit test refactoring https://github.com/maplibre/maplibre-native/issues/421");
        NSExpression *functionExpression = [NSExpression expressionWithFormat:@"ngl_step:from:stops:($zoomLevel, %@, %@)", constantExpression, @{@18: constantExpression}];
        layer.backgroundPattern = functionExpression;

        {
            using namespace nbgl::style::expression::dsl;
            propertyValue = nbgl::style::PropertyExpression<nbgl::style::expression::Image>(
                step(zoom(), image(literal("Background Pattern")), 18.0, image(literal("Background Pattern")))
            );
        }

        XCTAssertEqual(rawLayer->getBackgroundPattern(), propertyValue,
                       @"Setting backgroundPattern to a camera expression should update background-pattern.");
        XCTAssertEqualObjects(layer.backgroundPattern, functionExpression,
                              @"backgroundPattern should round-trip camera expressions.");


        layer.backgroundPattern = nil;
        XCTAssertTrue(rawLayer->getBackgroundPattern().isUndefined(),
                      @"Unsetting backgroundPattern should return background-pattern to the default value.");
        XCTAssertEqualObjects(layer.backgroundPattern, defaultExpression,
                              @"backgroundPattern should return the default value after being unset.");

        functionExpression = [NSExpression expressionForKeyPath:@"bogus"];
        XCTAssertThrowsSpecificNamed(layer.backgroundPattern = functionExpression, NSException, NSInvalidArgumentException, @"NGLBackgroundLayer should raise an exception if a camera-data expression is applied to a property that does not support key paths to feature attributes.");
        functionExpression = [NSExpression expressionWithFormat:@"ngl_step:from:stops:(bogus, %@, %@)", constantExpression, @{@18: constantExpression}];
        functionExpression = [NSExpression expressionWithFormat:@"ngl_interpolate:withCurveType:parameters:stops:($zoomLevel, 'linear', nil, %@)", @{@10: functionExpression}];
        XCTAssertThrowsSpecificNamed(layer.backgroundPattern = functionExpression, NSException, NSInvalidArgumentException, @"NGLBackgroundLayer should raise an exception if a camera-data expression is applied to a property that does not support key paths to feature attributes.");
        // Transition property test
        layer.backgroundPatternTransition = transitionTest;
        auto toptions = rawLayer->getBackgroundPatternTransition();
        XCTAssert(toptions.delay && NGLTimeIntervalFromDuration(*toptions.delay) == transitionTest.delay);
        XCTAssert(toptions.duration && NGLTimeIntervalFromDuration(*toptions.duration) == transitionTest.duration);

        NGLTransition backgroundPatternTransition = layer.backgroundPatternTransition;
        XCTAssertEqual(backgroundPatternTransition.delay, transitionTest.delay);
        XCTAssertEqual(backgroundPatternTransition.duration, transitionTest.duration);
    }
}

- (void)testPropertyNames {
    [self testPropertyName:@"background-color" isBoolean:NO];
    [self testPropertyName:@"background-opacity" isBoolean:NO];
    [self testPropertyName:@"background-pattern" isBoolean:NO];
}

@end
