// This file is generated.
// Edit platform/darwin/scripts/generate-style-code.js, then run `make darwin-style-code`.

#import "NGLStyleLayerTests.h"
#import "../../darwin/src/NSDate+NGLAdditions.h"

#import "NGLStyleLayer_Private.h"

#include <nbgl/style/layers/hillshade_layer.hpp>
#include <nbgl/style/transition_options.hpp>
#include <nbgl/style/expression/dsl.hpp>

@interface NGLHillshadeLayerTests : NGLStyleLayerTests
@end

@implementation NGLHillshadeLayerTests

+ (NSString *)layerType {
    return @"hillshade";
}

- (void)testProperties {
    NGLPointFeature *feature = [[NGLPointFeature alloc] init];
    NGLShapeSource *source = [[NGLShapeSource alloc] initWithIdentifier:@"sourceID" shape:feature options:nil];

    NGLHillshadeStyleLayer *layer = [[NGLHillshadeStyleLayer alloc] initWithIdentifier:@"layerID" source:source];
    XCTAssertNotEqual(layer.rawLayer, nullptr);
    XCTAssertEqualObjects(@(layer.rawLayer->getTypeInfo()->type), @"hillshade");
    auto rawLayer = static_cast<nbgl::style::HillshadeLayer*>(layer.rawLayer);

    NGLTransition transitionTest = NGLTransitionMake(5, 4);


    // hillshade-accent-color
    {
        XCTAssertTrue(rawLayer->getHillshadeAccentColor().isUndefined(),
                      @"hillshade-accent-color should be unset initially.");
        NSExpression *defaultExpression = layer.hillshadeAccentColor;

        NSExpression *constantExpression = [NSExpression expressionWithFormat:@"%@", [NGLColor redColor]];
        layer.hillshadeAccentColor = constantExpression;
        nbgl::style::PropertyValue<nbgl::Color> propertyValue = { { 1, 0, 0, 1 } };
        XCTAssertEqual(rawLayer->getHillshadeAccentColor(), propertyValue,
                       @"Setting hillshadeAccentColor to a constant value expression should update hillshade-accent-color.");
        XCTAssertEqualObjects(layer.hillshadeAccentColor, constantExpression,
                              @"hillshadeAccentColor should round-trip constant value expressions.");

        constantExpression = [NSExpression expressionWithFormat:@"%@", [NGLColor redColor]];
        XCTExpectFailure(@"Awaiting unit test refactoring https://github.com/maplibre/maplibre-native/issues/421");
        NSExpression *functionExpression = [NSExpression expressionWithFormat:@"ngl_step:from:stops:($zoomLevel, %@, %@)", constantExpression, @{@18: constantExpression}];
        layer.hillshadeAccentColor = functionExpression;

        {
            using namespace nbgl::style::expression::dsl;
            propertyValue = nbgl::style::PropertyExpression<nbgl::Color>(
                step(zoom(), literal(nbgl::Color(1, 0, 0, 1)), 18.0, literal(nbgl::Color(1, 0, 0, 1)))
            );
        }

        XCTAssertEqual(rawLayer->getHillshadeAccentColor(), propertyValue,
                       @"Setting hillshadeAccentColor to a camera expression should update hillshade-accent-color.");
        XCTAssertEqualObjects(layer.hillshadeAccentColor, functionExpression,
                              @"hillshadeAccentColor should round-trip camera expressions.");


        layer.hillshadeAccentColor = nil;
        XCTAssertTrue(rawLayer->getHillshadeAccentColor().isUndefined(),
                      @"Unsetting hillshadeAccentColor should return hillshade-accent-color to the default value.");
        XCTAssertEqualObjects(layer.hillshadeAccentColor, defaultExpression,
                              @"hillshadeAccentColor should return the default value after being unset.");

        functionExpression = [NSExpression expressionForKeyPath:@"bogus"];
        XCTAssertThrowsSpecificNamed(layer.hillshadeAccentColor = functionExpression, NSException, NSInvalidArgumentException, @"NGLHillshadeLayer should raise an exception if a camera-data expression is applied to a property that does not support key paths to feature attributes.");
        functionExpression = [NSExpression expressionWithFormat:@"ngl_step:from:stops:(bogus, %@, %@)", constantExpression, @{@18: constantExpression}];
        functionExpression = [NSExpression expressionWithFormat:@"ngl_interpolate:withCurveType:parameters:stops:($zoomLevel, 'linear', nil, %@)", @{@10: functionExpression}];
        XCTAssertThrowsSpecificNamed(layer.hillshadeAccentColor = functionExpression, NSException, NSInvalidArgumentException, @"NGLHillshadeLayer should raise an exception if a camera-data expression is applied to a property that does not support key paths to feature attributes.");
        // Transition property test
        layer.hillshadeAccentColorTransition = transitionTest;
        auto toptions = rawLayer->getHillshadeAccentColorTransition();
        XCTAssert(toptions.delay && NGLTimeIntervalFromDuration(*toptions.delay) == transitionTest.delay);
        XCTAssert(toptions.duration && NGLTimeIntervalFromDuration(*toptions.duration) == transitionTest.duration);

        NGLTransition hillshadeAccentColorTransition = layer.hillshadeAccentColorTransition;
        XCTAssertEqual(hillshadeAccentColorTransition.delay, transitionTest.delay);
        XCTAssertEqual(hillshadeAccentColorTransition.duration, transitionTest.duration);
    }

    // hillshade-exaggeration
    {
        XCTAssertTrue(rawLayer->getHillshadeExaggeration().isUndefined(),
                      @"hillshade-exaggeration should be unset initially.");
        NSExpression *defaultExpression = layer.hillshadeExaggeration;

        NSExpression *constantExpression = [NSExpression expressionWithFormat:@"1"];
        layer.hillshadeExaggeration = constantExpression;
        nbgl::style::PropertyValue<float> propertyValue = { 1.0 };
        XCTAssertEqual(rawLayer->getHillshadeExaggeration(), propertyValue,
                       @"Setting hillshadeExaggeration to a constant value expression should update hillshade-exaggeration.");
        XCTAssertEqualObjects(layer.hillshadeExaggeration, constantExpression,
                              @"hillshadeExaggeration should round-trip constant value expressions.");

        constantExpression = [NSExpression expressionWithFormat:@"1"];
        XCTExpectFailure(@"Awaiting unit test refactoring https://github.com/maplibre/maplibre-native/issues/421");
        NSExpression *functionExpression = [NSExpression expressionWithFormat:@"ngl_step:from:stops:($zoomLevel, %@, %@)", constantExpression, @{@18: constantExpression}];
        layer.hillshadeExaggeration = functionExpression;

        {
            using namespace nbgl::style::expression::dsl;
            propertyValue = nbgl::style::PropertyExpression<float>(
                step(zoom(), literal(1.0), 18.0, literal(1.0))
            );
        }

        XCTAssertEqual(rawLayer->getHillshadeExaggeration(), propertyValue,
                       @"Setting hillshadeExaggeration to a camera expression should update hillshade-exaggeration.");
        XCTAssertEqualObjects(layer.hillshadeExaggeration, functionExpression,
                              @"hillshadeExaggeration should round-trip camera expressions.");


        layer.hillshadeExaggeration = nil;
        XCTAssertTrue(rawLayer->getHillshadeExaggeration().isUndefined(),
                      @"Unsetting hillshadeExaggeration should return hillshade-exaggeration to the default value.");
        XCTAssertEqualObjects(layer.hillshadeExaggeration, defaultExpression,
                              @"hillshadeExaggeration should return the default value after being unset.");

        functionExpression = [NSExpression expressionForKeyPath:@"bogus"];
        XCTAssertThrowsSpecificNamed(layer.hillshadeExaggeration = functionExpression, NSException, NSInvalidArgumentException, @"NGLHillshadeLayer should raise an exception if a camera-data expression is applied to a property that does not support key paths to feature attributes.");
        functionExpression = [NSExpression expressionWithFormat:@"ngl_step:from:stops:(bogus, %@, %@)", constantExpression, @{@18: constantExpression}];
        functionExpression = [NSExpression expressionWithFormat:@"ngl_interpolate:withCurveType:parameters:stops:($zoomLevel, 'linear', nil, %@)", @{@10: functionExpression}];
        XCTAssertThrowsSpecificNamed(layer.hillshadeExaggeration = functionExpression, NSException, NSInvalidArgumentException, @"NGLHillshadeLayer should raise an exception if a camera-data expression is applied to a property that does not support key paths to feature attributes.");
        // Transition property test
        layer.hillshadeExaggerationTransition = transitionTest;
        auto toptions = rawLayer->getHillshadeExaggerationTransition();
        XCTAssert(toptions.delay && NGLTimeIntervalFromDuration(*toptions.delay) == transitionTest.delay);
        XCTAssert(toptions.duration && NGLTimeIntervalFromDuration(*toptions.duration) == transitionTest.duration);

        NGLTransition hillshadeExaggerationTransition = layer.hillshadeExaggerationTransition;
        XCTAssertEqual(hillshadeExaggerationTransition.delay, transitionTest.delay);
        XCTAssertEqual(hillshadeExaggerationTransition.duration, transitionTest.duration);
    }

    // hillshade-highlight-color
    {
        XCTAssertTrue(rawLayer->getHillshadeHighlightColor().isUndefined(),
                      @"hillshade-highlight-color should be unset initially.");
        NSExpression *defaultExpression = layer.hillshadeHighlightColor;

        NSExpression *constantExpression = [NSExpression expressionWithFormat:@"%@", [NGLColor redColor]];
        layer.hillshadeHighlightColor = constantExpression;
        nbgl::style::PropertyValue<nbgl::Color> propertyValue = { { 1, 0, 0, 1 } };
        XCTAssertEqual(rawLayer->getHillshadeHighlightColor(), propertyValue,
                       @"Setting hillshadeHighlightColor to a constant value expression should update hillshade-highlight-color.");
        XCTAssertEqualObjects(layer.hillshadeHighlightColor, constantExpression,
                              @"hillshadeHighlightColor should round-trip constant value expressions.");

        constantExpression = [NSExpression expressionWithFormat:@"%@", [NGLColor redColor]];
        XCTExpectFailure(@"Awaiting unit test refactoring https://github.com/maplibre/maplibre-native/issues/421");
        NSExpression *functionExpression = [NSExpression expressionWithFormat:@"ngl_step:from:stops:($zoomLevel, %@, %@)", constantExpression, @{@18: constantExpression}];
        layer.hillshadeHighlightColor = functionExpression;

        {
            using namespace nbgl::style::expression::dsl;
            propertyValue = nbgl::style::PropertyExpression<nbgl::Color>(
                step(zoom(), literal(nbgl::Color(1, 0, 0, 1)), 18.0, literal(nbgl::Color(1, 0, 0, 1)))
            );
        }

        XCTAssertEqual(rawLayer->getHillshadeHighlightColor(), propertyValue,
                       @"Setting hillshadeHighlightColor to a camera expression should update hillshade-highlight-color.");
        XCTAssertEqualObjects(layer.hillshadeHighlightColor, functionExpression,
                              @"hillshadeHighlightColor should round-trip camera expressions.");


        layer.hillshadeHighlightColor = nil;
        XCTAssertTrue(rawLayer->getHillshadeHighlightColor().isUndefined(),
                      @"Unsetting hillshadeHighlightColor should return hillshade-highlight-color to the default value.");
        XCTAssertEqualObjects(layer.hillshadeHighlightColor, defaultExpression,
                              @"hillshadeHighlightColor should return the default value after being unset.");

        functionExpression = [NSExpression expressionForKeyPath:@"bogus"];
        XCTAssertThrowsSpecificNamed(layer.hillshadeHighlightColor = functionExpression, NSException, NSInvalidArgumentException, @"NGLHillshadeLayer should raise an exception if a camera-data expression is applied to a property that does not support key paths to feature attributes.");
        functionExpression = [NSExpression expressionWithFormat:@"ngl_step:from:stops:(bogus, %@, %@)", constantExpression, @{@18: constantExpression}];
        functionExpression = [NSExpression expressionWithFormat:@"ngl_interpolate:withCurveType:parameters:stops:($zoomLevel, 'linear', nil, %@)", @{@10: functionExpression}];
        XCTAssertThrowsSpecificNamed(layer.hillshadeHighlightColor = functionExpression, NSException, NSInvalidArgumentException, @"NGLHillshadeLayer should raise an exception if a camera-data expression is applied to a property that does not support key paths to feature attributes.");
        // Transition property test
        layer.hillshadeHighlightColorTransition = transitionTest;
        auto toptions = rawLayer->getHillshadeHighlightColorTransition();
        XCTAssert(toptions.delay && NGLTimeIntervalFromDuration(*toptions.delay) == transitionTest.delay);
        XCTAssert(toptions.duration && NGLTimeIntervalFromDuration(*toptions.duration) == transitionTest.duration);

        NGLTransition hillshadeHighlightColorTransition = layer.hillshadeHighlightColorTransition;
        XCTAssertEqual(hillshadeHighlightColorTransition.delay, transitionTest.delay);
        XCTAssertEqual(hillshadeHighlightColorTransition.duration, transitionTest.duration);
    }

    // hillshade-illumination-anchor
    {
        XCTAssertTrue(rawLayer->getHillshadeIlluminationAnchor().isUndefined(),
                      @"hillshade-illumination-anchor should be unset initially.");
        NSExpression *defaultExpression = layer.hillshadeIlluminationAnchor;

        NSExpression *constantExpression = [NSExpression expressionWithFormat:@"'viewport'"];
        layer.hillshadeIlluminationAnchor = constantExpression;
        nbgl::style::PropertyValue<nbgl::style::HillshadeIlluminationAnchorType> propertyValue = { nbgl::style::HillshadeIlluminationAnchorType::Viewport };
        XCTAssertEqual(rawLayer->getHillshadeIlluminationAnchor(), propertyValue,
                       @"Setting hillshadeIlluminationAnchor to a constant value expression should update hillshade-illumination-anchor.");
        XCTAssertEqualObjects(layer.hillshadeIlluminationAnchor, constantExpression,
                              @"hillshadeIlluminationAnchor should round-trip constant value expressions.");

        constantExpression = [NSExpression expressionWithFormat:@"'viewport'"];
        XCTExpectFailure(@"Awaiting unit test refactoring https://github.com/maplibre/maplibre-native/issues/421");
        NSExpression *functionExpression = [NSExpression expressionWithFormat:@"ngl_step:from:stops:($zoomLevel, %@, %@)", constantExpression, @{@18: constantExpression}];
        layer.hillshadeIlluminationAnchor = functionExpression;

        {
            using namespace nbgl::style::expression::dsl;
            propertyValue = nbgl::style::PropertyExpression<nbgl::style::HillshadeIlluminationAnchorType>(
                step(zoom(), literal("viewport"), 18.0, literal("viewport"))
            );
        }

        XCTAssertEqual(rawLayer->getHillshadeIlluminationAnchor(), propertyValue,
                       @"Setting hillshadeIlluminationAnchor to a camera expression should update hillshade-illumination-anchor.");
        XCTAssertEqualObjects(layer.hillshadeIlluminationAnchor, functionExpression,
                              @"hillshadeIlluminationAnchor should round-trip camera expressions.");


        layer.hillshadeIlluminationAnchor = nil;
        XCTAssertTrue(rawLayer->getHillshadeIlluminationAnchor().isUndefined(),
                      @"Unsetting hillshadeIlluminationAnchor should return hillshade-illumination-anchor to the default value.");
        XCTAssertEqualObjects(layer.hillshadeIlluminationAnchor, defaultExpression,
                              @"hillshadeIlluminationAnchor should return the default value after being unset.");

        functionExpression = [NSExpression expressionForKeyPath:@"bogus"];
        XCTAssertThrowsSpecificNamed(layer.hillshadeIlluminationAnchor = functionExpression, NSException, NSInvalidArgumentException, @"NGLHillshadeLayer should raise an exception if a camera-data expression is applied to a property that does not support key paths to feature attributes.");
        functionExpression = [NSExpression expressionWithFormat:@"ngl_step:from:stops:(bogus, %@, %@)", constantExpression, @{@18: constantExpression}];
        functionExpression = [NSExpression expressionWithFormat:@"ngl_interpolate:withCurveType:parameters:stops:($zoomLevel, 'linear', nil, %@)", @{@10: functionExpression}];
        XCTAssertThrowsSpecificNamed(layer.hillshadeIlluminationAnchor = functionExpression, NSException, NSInvalidArgumentException, @"NGLHillshadeLayer should raise an exception if a camera-data expression is applied to a property that does not support key paths to feature attributes.");
    }

    // hillshade-illumination-direction
    {
        XCTAssertTrue(rawLayer->getHillshadeIlluminationDirection().isUndefined(),
                      @"hillshade-illumination-direction should be unset initially.");
        NSExpression *defaultExpression = layer.hillshadeIlluminationDirection;

        NSExpression *constantExpression = [NSExpression expressionWithFormat:@"1"];
        layer.hillshadeIlluminationDirection = constantExpression;
        nbgl::style::PropertyValue<float> propertyValue = { 1.0 };
        XCTAssertEqual(rawLayer->getHillshadeIlluminationDirection(), propertyValue,
                       @"Setting hillshadeIlluminationDirection to a constant value expression should update hillshade-illumination-direction.");
        XCTAssertEqualObjects(layer.hillshadeIlluminationDirection, constantExpression,
                              @"hillshadeIlluminationDirection should round-trip constant value expressions.");

        constantExpression = [NSExpression expressionWithFormat:@"1"];
        XCTExpectFailure(@"Awaiting unit test refactoring https://github.com/maplibre/maplibre-native/issues/421");
        NSExpression *functionExpression = [NSExpression expressionWithFormat:@"ngl_step:from:stops:($zoomLevel, %@, %@)", constantExpression, @{@18: constantExpression}];
        layer.hillshadeIlluminationDirection = functionExpression;

        {
            using namespace nbgl::style::expression::dsl;
            propertyValue = nbgl::style::PropertyExpression<float>(
                step(zoom(), literal(1.0), 18.0, literal(1.0))
            );
        }

        XCTAssertEqual(rawLayer->getHillshadeIlluminationDirection(), propertyValue,
                       @"Setting hillshadeIlluminationDirection to a camera expression should update hillshade-illumination-direction.");
        XCTAssertEqualObjects(layer.hillshadeIlluminationDirection, functionExpression,
                              @"hillshadeIlluminationDirection should round-trip camera expressions.");


        layer.hillshadeIlluminationDirection = nil;
        XCTAssertTrue(rawLayer->getHillshadeIlluminationDirection().isUndefined(),
                      @"Unsetting hillshadeIlluminationDirection should return hillshade-illumination-direction to the default value.");
        XCTAssertEqualObjects(layer.hillshadeIlluminationDirection, defaultExpression,
                              @"hillshadeIlluminationDirection should return the default value after being unset.");

        functionExpression = [NSExpression expressionForKeyPath:@"bogus"];
        XCTAssertThrowsSpecificNamed(layer.hillshadeIlluminationDirection = functionExpression, NSException, NSInvalidArgumentException, @"NGLHillshadeLayer should raise an exception if a camera-data expression is applied to a property that does not support key paths to feature attributes.");
        functionExpression = [NSExpression expressionWithFormat:@"ngl_step:from:stops:(bogus, %@, %@)", constantExpression, @{@18: constantExpression}];
        functionExpression = [NSExpression expressionWithFormat:@"ngl_interpolate:withCurveType:parameters:stops:($zoomLevel, 'linear', nil, %@)", @{@10: functionExpression}];
        XCTAssertThrowsSpecificNamed(layer.hillshadeIlluminationDirection = functionExpression, NSException, NSInvalidArgumentException, @"NGLHillshadeLayer should raise an exception if a camera-data expression is applied to a property that does not support key paths to feature attributes.");
    }

    // hillshade-shadow-color
    {
        XCTAssertTrue(rawLayer->getHillshadeShadowColor().isUndefined(),
                      @"hillshade-shadow-color should be unset initially.");
        NSExpression *defaultExpression = layer.hillshadeShadowColor;

        NSExpression *constantExpression = [NSExpression expressionWithFormat:@"%@", [NGLColor redColor]];
        layer.hillshadeShadowColor = constantExpression;
        nbgl::style::PropertyValue<nbgl::Color> propertyValue = { { 1, 0, 0, 1 } };
        XCTAssertEqual(rawLayer->getHillshadeShadowColor(), propertyValue,
                       @"Setting hillshadeShadowColor to a constant value expression should update hillshade-shadow-color.");
        XCTAssertEqualObjects(layer.hillshadeShadowColor, constantExpression,
                              @"hillshadeShadowColor should round-trip constant value expressions.");

        constantExpression = [NSExpression expressionWithFormat:@"%@", [NGLColor redColor]];
        XCTExpectFailure(@"Awaiting unit test refactoring https://github.com/maplibre/maplibre-native/issues/421");
        NSExpression *functionExpression = [NSExpression expressionWithFormat:@"ngl_step:from:stops:($zoomLevel, %@, %@)", constantExpression, @{@18: constantExpression}];
        layer.hillshadeShadowColor = functionExpression;

        {
            using namespace nbgl::style::expression::dsl;
            propertyValue = nbgl::style::PropertyExpression<nbgl::Color>(
                step(zoom(), literal(nbgl::Color(1, 0, 0, 1)), 18.0, literal(nbgl::Color(1, 0, 0, 1)))
            );
        }

        XCTAssertEqual(rawLayer->getHillshadeShadowColor(), propertyValue,
                       @"Setting hillshadeShadowColor to a camera expression should update hillshade-shadow-color.");
        XCTAssertEqualObjects(layer.hillshadeShadowColor, functionExpression,
                              @"hillshadeShadowColor should round-trip camera expressions.");


        layer.hillshadeShadowColor = nil;
        XCTAssertTrue(rawLayer->getHillshadeShadowColor().isUndefined(),
                      @"Unsetting hillshadeShadowColor should return hillshade-shadow-color to the default value.");
        XCTAssertEqualObjects(layer.hillshadeShadowColor, defaultExpression,
                              @"hillshadeShadowColor should return the default value after being unset.");

        functionExpression = [NSExpression expressionForKeyPath:@"bogus"];
        XCTAssertThrowsSpecificNamed(layer.hillshadeShadowColor = functionExpression, NSException, NSInvalidArgumentException, @"NGLHillshadeLayer should raise an exception if a camera-data expression is applied to a property that does not support key paths to feature attributes.");
        functionExpression = [NSExpression expressionWithFormat:@"ngl_step:from:stops:(bogus, %@, %@)", constantExpression, @{@18: constantExpression}];
        functionExpression = [NSExpression expressionWithFormat:@"ngl_interpolate:withCurveType:parameters:stops:($zoomLevel, 'linear', nil, %@)", @{@10: functionExpression}];
        XCTAssertThrowsSpecificNamed(layer.hillshadeShadowColor = functionExpression, NSException, NSInvalidArgumentException, @"NGLHillshadeLayer should raise an exception if a camera-data expression is applied to a property that does not support key paths to feature attributes.");
        // Transition property test
        layer.hillshadeShadowColorTransition = transitionTest;
        auto toptions = rawLayer->getHillshadeShadowColorTransition();
        XCTAssert(toptions.delay && NGLTimeIntervalFromDuration(*toptions.delay) == transitionTest.delay);
        XCTAssert(toptions.duration && NGLTimeIntervalFromDuration(*toptions.duration) == transitionTest.duration);

        NGLTransition hillshadeShadowColorTransition = layer.hillshadeShadowColorTransition;
        XCTAssertEqual(hillshadeShadowColorTransition.delay, transitionTest.delay);
        XCTAssertEqual(hillshadeShadowColorTransition.duration, transitionTest.duration);
    }
}

- (void)testPropertyNames {
    [self testPropertyName:@"hillshade-accent-color" isBoolean:NO];
    [self testPropertyName:@"hillshade-exaggeration" isBoolean:NO];
    [self testPropertyName:@"hillshade-highlight-color" isBoolean:NO];
    [self testPropertyName:@"hillshade-illumination-anchor" isBoolean:NO];
    [self testPropertyName:@"hillshade-illumination-direction" isBoolean:NO];
    [self testPropertyName:@"hillshade-shadow-color" isBoolean:NO];
}

- (void)testValueAdditions {
    XCTAssertEqual([NSValue valueWithNGLHillshadeIlluminationAnchor:NGLHillshadeIlluminationAnchorMap].NGLHillshadeIlluminationAnchorValue, NGLHillshadeIlluminationAnchorMap);
    XCTAssertEqual([NSValue valueWithNGLHillshadeIlluminationAnchor:NGLHillshadeIlluminationAnchorViewport].NGLHillshadeIlluminationAnchorValue, NGLHillshadeIlluminationAnchorViewport);
}

@end
