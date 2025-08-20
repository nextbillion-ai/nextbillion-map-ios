// This file is generated.
// Edit platform/darwin/scripts/generate-style-code.js, then run `make darwin-style-code`.

#import "NGLStyleLayerTests.h"
#import "../../darwin/src/NSDate+NGLAdditions.h"

#import "NGLStyleLayer_Private.h"

#include <nbgl/style/layers/fill_extrusion_layer.hpp>
#include <nbgl/style/transition_options.hpp>
#include <nbgl/style/expression/dsl.hpp>

@interface NGLFillExtrusionLayerTests : NGLStyleLayerTests
@end

@implementation NGLFillExtrusionLayerTests

+ (NSString *)layerType {
    return @"fill-extrusion";
}

- (void)testPredicates {
    NGLPointFeature *feature = [[NGLPointFeature alloc] init];
    NGLShapeSource *source = [[NGLShapeSource alloc] initWithIdentifier:@"sourceID" shape:feature options:nil];
    NGLFillExtrusionStyleLayer *layer = [[NGLFillExtrusionStyleLayer alloc] initWithIdentifier:@"layerID" source:source];

    XCTAssertNil(layer.sourceLayerIdentifier);
    layer.sourceLayerIdentifier = @"layerID";
    XCTAssertEqualObjects(layer.sourceLayerIdentifier, @"layerID");
    layer.sourceLayerIdentifier = nil;
    XCTAssertNil(layer.sourceLayerIdentifier);

    XCTAssertNil(layer.predicate);
    layer.predicate = [NSPredicate predicateWithFormat:@"$featureIdentifier = 1"];
    XCTAssertEqualObjects(layer.predicate,  [NSPredicate predicateWithFormat:@"$featureIdentifier = 1"]);
    layer.predicate = nil;
    XCTAssertNil(layer.predicate);
}

- (void)testProperties {
    NGLPointFeature *feature = [[NGLPointFeature alloc] init];
    NGLShapeSource *source = [[NGLShapeSource alloc] initWithIdentifier:@"sourceID" shape:feature options:nil];

    NGLFillExtrusionStyleLayer *layer = [[NGLFillExtrusionStyleLayer alloc] initWithIdentifier:@"layerID" source:source];
    XCTAssertNotEqual(layer.rawLayer, nullptr);
    XCTAssertEqualObjects(@(layer.rawLayer->getTypeInfo()->type), @"fill-extrusion");
    auto rawLayer = static_cast<nbgl::style::FillExtrusionLayer*>(layer.rawLayer);

    NGLTransition transitionTest = NGLTransitionMake(5, 4);


    // fill-extrusion-base
    {
        XCTAssertTrue(rawLayer->getFillExtrusionBase().isUndefined(),
                      @"fill-extrusion-base should be unset initially.");
        NSExpression *defaultExpression = layer.fillExtrusionBase;

        NSExpression *constantExpression = [NSExpression expressionWithFormat:@"1"];
        layer.fillExtrusionBase = constantExpression;
        nbgl::style::PropertyValue<float> propertyValue = { 1.0 };
        XCTAssertEqual(rawLayer->getFillExtrusionBase(), propertyValue,
                       @"Setting fillExtrusionBase to a constant value expression should update fill-extrusion-base.");
        XCTAssertEqualObjects(layer.fillExtrusionBase, constantExpression,
                              @"fillExtrusionBase should round-trip constant value expressions.");

        constantExpression = [NSExpression expressionWithFormat:@"1"];
        XCTExpectFailure(@"Awaiting unit test refactoring https://github.com/maplibre/maplibre-native/issues/421");
        NSExpression *functionExpression = [NSExpression expressionWithFormat:@"ngl_step:from:stops:($zoomLevel, %@, %@)", constantExpression, @{@18: constantExpression}];
        layer.fillExtrusionBase = functionExpression;

        {
            using namespace nbgl::style::expression::dsl;
            propertyValue = nbgl::style::PropertyExpression<float>(
                step(zoom(), literal(1.0), 18.0, literal(1.0))
            );
        }

        XCTAssertEqual(rawLayer->getFillExtrusionBase(), propertyValue,
                       @"Setting fillExtrusionBase to a camera expression should update fill-extrusion-base.");
        XCTAssertEqualObjects(layer.fillExtrusionBase, functionExpression,
                              @"fillExtrusionBase should round-trip camera expressions.");

        functionExpression = [NSExpression expressionWithFormat:@"ngl_interpolate:withCurveType:parameters:stops:(keyName, 'linear', nil, %@)", @{@18: constantExpression}];
        layer.fillExtrusionBase = functionExpression;

        {
            using namespace nbgl::style::expression::dsl;
            propertyValue = nbgl::style::PropertyExpression<float>(
                interpolate(linear(), number(get("keyName")), 18.0, literal(1.0))
            );
        }

        XCTAssertEqual(rawLayer->getFillExtrusionBase(), propertyValue,
                       @"Setting fillExtrusionBase to a data expression should update fill-extrusion-base.");
        NSExpression *pedanticFunctionExpression = [NSExpression expressionWithFormat:@"ngl_interpolate:withCurveType:parameters:stops:(CAST(keyName, 'NSNumber'), 'linear', nil, %@)", @{@18: constantExpression}];
        XCTAssertEqualObjects(layer.fillExtrusionBase, pedanticFunctionExpression,
                              @"fillExtrusionBase should round-trip data expressions.");

        functionExpression = [NSExpression expressionWithFormat:@"ngl_interpolate:withCurveType:parameters:stops:($zoomLevel, 'linear', nil, %@)", @{@10: functionExpression}];
        layer.fillExtrusionBase = functionExpression;

        {
            using namespace nbgl::style::expression::dsl;
            propertyValue = nbgl::style::PropertyExpression<float>(
                interpolate(linear(), zoom(), 10.0, interpolate(linear(), number(get("keyName")), 18.0, literal(1.0)))
            );
        }

        XCTAssertEqual(rawLayer->getFillExtrusionBase(), propertyValue,
                       @"Setting fillExtrusionBase to a camera-data expression should update fill-extrusion-base.");
        pedanticFunctionExpression = [NSExpression expressionWithFormat:@"ngl_interpolate:withCurveType:parameters:stops:($zoomLevel, 'linear', nil, %@)", @{@10: pedanticFunctionExpression}];
        XCTAssertEqualObjects(layer.fillExtrusionBase, pedanticFunctionExpression,
                              @"fillExtrusionBase should round-trip camera-data expressions.");

        layer.fillExtrusionBase = nil;
        XCTAssertTrue(rawLayer->getFillExtrusionBase().isUndefined(),
                      @"Unsetting fillExtrusionBase should return fill-extrusion-base to the default value.");
        XCTAssertEqualObjects(layer.fillExtrusionBase, defaultExpression,
                              @"fillExtrusionBase should return the default value after being unset.");
        // Transition property test
        layer.fillExtrusionBaseTransition = transitionTest;
        auto toptions = rawLayer->getFillExtrusionBaseTransition();
        XCTAssert(toptions.delay && NGLTimeIntervalFromDuration(*toptions.delay) == transitionTest.delay);
        XCTAssert(toptions.duration && NGLTimeIntervalFromDuration(*toptions.duration) == transitionTest.duration);

        NGLTransition fillExtrusionBaseTransition = layer.fillExtrusionBaseTransition;
        XCTAssertEqual(fillExtrusionBaseTransition.delay, transitionTest.delay);
        XCTAssertEqual(fillExtrusionBaseTransition.duration, transitionTest.duration);
    }

    // fill-extrusion-color
    {
        XCTAssertTrue(rawLayer->getFillExtrusionColor().isUndefined(),
                      @"fill-extrusion-color should be unset initially.");
        NSExpression *defaultExpression = layer.fillExtrusionColor;

        NSExpression *constantExpression = [NSExpression expressionWithFormat:@"%@", [NGLColor redColor]];
        layer.fillExtrusionColor = constantExpression;
        nbgl::style::PropertyValue<nbgl::Color> propertyValue = { { 1, 0, 0, 1 } };
        XCTAssertEqual(rawLayer->getFillExtrusionColor(), propertyValue,
                       @"Setting fillExtrusionColor to a constant value expression should update fill-extrusion-color.");
        XCTAssertEqualObjects(layer.fillExtrusionColor, constantExpression,
                              @"fillExtrusionColor should round-trip constant value expressions.");

        constantExpression = [NSExpression expressionWithFormat:@"%@", [NGLColor redColor]];
        XCTExpectFailure(@"Awaiting unit test refactoring https://github.com/maplibre/maplibre-native/issues/421");
        NSExpression *functionExpression = [NSExpression expressionWithFormat:@"ngl_step:from:stops:($zoomLevel, %@, %@)", constantExpression, @{@18: constantExpression}];
        layer.fillExtrusionColor = functionExpression;

        {
            using namespace nbgl::style::expression::dsl;
            propertyValue = nbgl::style::PropertyExpression<nbgl::Color>(
                step(zoom(), literal(nbgl::Color(1, 0, 0, 1)), 18.0, literal(nbgl::Color(1, 0, 0, 1)))
            );
        }

        XCTAssertEqual(rawLayer->getFillExtrusionColor(), propertyValue,
                       @"Setting fillExtrusionColor to a camera expression should update fill-extrusion-color.");
        XCTAssertEqualObjects(layer.fillExtrusionColor, functionExpression,
                              @"fillExtrusionColor should round-trip camera expressions.");

        functionExpression = [NSExpression expressionWithFormat:@"ngl_interpolate:withCurveType:parameters:stops:(keyName, 'linear', nil, %@)", @{@18: constantExpression}];
        layer.fillExtrusionColor = functionExpression;

        {
            using namespace nbgl::style::expression::dsl;
            propertyValue = nbgl::style::PropertyExpression<nbgl::Color>(
                interpolate(linear(), number(get("keyName")), 18.0, literal(nbgl::Color(1, 0, 0, 1)))
            );
        }

        XCTAssertEqual(rawLayer->getFillExtrusionColor(), propertyValue,
                       @"Setting fillExtrusionColor to a data expression should update fill-extrusion-color.");
        NSExpression *pedanticFunctionExpression = [NSExpression expressionWithFormat:@"ngl_interpolate:withCurveType:parameters:stops:(CAST(keyName, 'NSNumber'), 'linear', nil, %@)", @{@18: constantExpression}];
        XCTAssertEqualObjects(layer.fillExtrusionColor, pedanticFunctionExpression,
                              @"fillExtrusionColor should round-trip data expressions.");

        functionExpression = [NSExpression expressionWithFormat:@"ngl_interpolate:withCurveType:parameters:stops:($zoomLevel, 'linear', nil, %@)", @{@10: functionExpression}];
        layer.fillExtrusionColor = functionExpression;

        {
            using namespace nbgl::style::expression::dsl;
            propertyValue = nbgl::style::PropertyExpression<nbgl::Color>(
                interpolate(linear(), zoom(), 10.0, interpolate(linear(), number(get("keyName")), 18.0, literal(nbgl::Color(1, 0, 0, 1))))
            );
        }

        XCTAssertEqual(rawLayer->getFillExtrusionColor(), propertyValue,
                       @"Setting fillExtrusionColor to a camera-data expression should update fill-extrusion-color.");
        pedanticFunctionExpression = [NSExpression expressionWithFormat:@"ngl_interpolate:withCurveType:parameters:stops:($zoomLevel, 'linear', nil, %@)", @{@10: pedanticFunctionExpression}];
        XCTAssertEqualObjects(layer.fillExtrusionColor, pedanticFunctionExpression,
                              @"fillExtrusionColor should round-trip camera-data expressions.");

        layer.fillExtrusionColor = nil;
        XCTAssertTrue(rawLayer->getFillExtrusionColor().isUndefined(),
                      @"Unsetting fillExtrusionColor should return fill-extrusion-color to the default value.");
        XCTAssertEqualObjects(layer.fillExtrusionColor, defaultExpression,
                              @"fillExtrusionColor should return the default value after being unset.");
        // Transition property test
        layer.fillExtrusionColorTransition = transitionTest;
        auto toptions = rawLayer->getFillExtrusionColorTransition();
        XCTAssert(toptions.delay && NGLTimeIntervalFromDuration(*toptions.delay) == transitionTest.delay);
        XCTAssert(toptions.duration && NGLTimeIntervalFromDuration(*toptions.duration) == transitionTest.duration);

        NGLTransition fillExtrusionColorTransition = layer.fillExtrusionColorTransition;
        XCTAssertEqual(fillExtrusionColorTransition.delay, transitionTest.delay);
        XCTAssertEqual(fillExtrusionColorTransition.duration, transitionTest.duration);
    }

    // fill-extrusion-vertical-gradient
    {
        XCTAssertTrue(rawLayer->getFillExtrusionVerticalGradient().isUndefined(),
                      @"fill-extrusion-vertical-gradient should be unset initially.");
        NSExpression *defaultExpression = layer.fillExtrusionHasVerticalGradient;

        NSExpression *constantExpression = [NSExpression expressionWithFormat:@"false"];
        layer.fillExtrusionHasVerticalGradient = constantExpression;
        nbgl::style::PropertyValue<bool> propertyValue = { false };
        XCTAssertEqual(rawLayer->getFillExtrusionVerticalGradient(), propertyValue,
                       @"Setting fillExtrusionHasVerticalGradient to a constant value expression should update fill-extrusion-vertical-gradient.");
        XCTAssertEqualObjects(layer.fillExtrusionHasVerticalGradient, constantExpression,
                              @"fillExtrusionHasVerticalGradient should round-trip constant value expressions.");

        constantExpression = [NSExpression expressionWithFormat:@"false"];
        XCTExpectFailure(@"Awaiting unit test refactoring https://github.com/maplibre/maplibre-native/issues/421");
        NSExpression *functionExpression = [NSExpression expressionWithFormat:@"ngl_step:from:stops:($zoomLevel, %@, %@)", constantExpression, @{@18: constantExpression}];
        layer.fillExtrusionHasVerticalGradient = functionExpression;

        {
            using namespace nbgl::style::expression::dsl;
            propertyValue = nbgl::style::PropertyExpression<bool>(
                step(zoom(), literal(false), 18.0, literal(false))
            );
        }

        XCTAssertEqual(rawLayer->getFillExtrusionVerticalGradient(), propertyValue,
                       @"Setting fillExtrusionHasVerticalGradient to a camera expression should update fill-extrusion-vertical-gradient.");
        XCTAssertEqualObjects(layer.fillExtrusionHasVerticalGradient, functionExpression,
                              @"fillExtrusionHasVerticalGradient should round-trip camera expressions.");


        layer.fillExtrusionHasVerticalGradient = nil;
        XCTAssertTrue(rawLayer->getFillExtrusionVerticalGradient().isUndefined(),
                      @"Unsetting fillExtrusionHasVerticalGradient should return fill-extrusion-vertical-gradient to the default value.");
        XCTAssertEqualObjects(layer.fillExtrusionHasVerticalGradient, defaultExpression,
                              @"fillExtrusionHasVerticalGradient should return the default value after being unset.");

        functionExpression = [NSExpression expressionForKeyPath:@"bogus"];
        XCTAssertThrowsSpecificNamed(layer.fillExtrusionHasVerticalGradient = functionExpression, NSException, NSInvalidArgumentException, @"NGLFillExtrusionLayer should raise an exception if a camera-data expression is applied to a property that does not support key paths to feature attributes.");
        functionExpression = [NSExpression expressionWithFormat:@"ngl_step:from:stops:(bogus, %@, %@)", constantExpression, @{@18: constantExpression}];
        functionExpression = [NSExpression expressionWithFormat:@"ngl_interpolate:withCurveType:parameters:stops:($zoomLevel, 'linear', nil, %@)", @{@10: functionExpression}];
        XCTAssertThrowsSpecificNamed(layer.fillExtrusionHasVerticalGradient = functionExpression, NSException, NSInvalidArgumentException, @"NGLFillExtrusionLayer should raise an exception if a camera-data expression is applied to a property that does not support key paths to feature attributes.");
    }

    // fill-extrusion-height
    {
        XCTAssertTrue(rawLayer->getFillExtrusionHeight().isUndefined(),
                      @"fill-extrusion-height should be unset initially.");
        NSExpression *defaultExpression = layer.fillExtrusionHeight;

        NSExpression *constantExpression = [NSExpression expressionWithFormat:@"1"];
        layer.fillExtrusionHeight = constantExpression;
        nbgl::style::PropertyValue<float> propertyValue = { 1.0 };
        XCTAssertEqual(rawLayer->getFillExtrusionHeight(), propertyValue,
                       @"Setting fillExtrusionHeight to a constant value expression should update fill-extrusion-height.");
        XCTAssertEqualObjects(layer.fillExtrusionHeight, constantExpression,
                              @"fillExtrusionHeight should round-trip constant value expressions.");

        constantExpression = [NSExpression expressionWithFormat:@"1"];
        XCTExpectFailure(@"Awaiting unit test refactoring https://github.com/maplibre/maplibre-native/issues/421");
        NSExpression *functionExpression = [NSExpression expressionWithFormat:@"ngl_step:from:stops:($zoomLevel, %@, %@)", constantExpression, @{@18: constantExpression}];
        layer.fillExtrusionHeight = functionExpression;

        {
            using namespace nbgl::style::expression::dsl;
            propertyValue = nbgl::style::PropertyExpression<float>(
                step(zoom(), literal(1.0), 18.0, literal(1.0))
            );
        }

        XCTAssertEqual(rawLayer->getFillExtrusionHeight(), propertyValue,
                       @"Setting fillExtrusionHeight to a camera expression should update fill-extrusion-height.");
        XCTAssertEqualObjects(layer.fillExtrusionHeight, functionExpression,
                              @"fillExtrusionHeight should round-trip camera expressions.");

        functionExpression = [NSExpression expressionWithFormat:@"ngl_interpolate:withCurveType:parameters:stops:(keyName, 'linear', nil, %@)", @{@18: constantExpression}];
        layer.fillExtrusionHeight = functionExpression;

        {
            using namespace nbgl::style::expression::dsl;
            propertyValue = nbgl::style::PropertyExpression<float>(
                interpolate(linear(), number(get("keyName")), 18.0, literal(1.0))
            );
        }

        XCTAssertEqual(rawLayer->getFillExtrusionHeight(), propertyValue,
                       @"Setting fillExtrusionHeight to a data expression should update fill-extrusion-height.");
        NSExpression *pedanticFunctionExpression = [NSExpression expressionWithFormat:@"ngl_interpolate:withCurveType:parameters:stops:(CAST(keyName, 'NSNumber'), 'linear', nil, %@)", @{@18: constantExpression}];
        XCTAssertEqualObjects(layer.fillExtrusionHeight, pedanticFunctionExpression,
                              @"fillExtrusionHeight should round-trip data expressions.");

        functionExpression = [NSExpression expressionWithFormat:@"ngl_interpolate:withCurveType:parameters:stops:($zoomLevel, 'linear', nil, %@)", @{@10: functionExpression}];
        layer.fillExtrusionHeight = functionExpression;

        {
            using namespace nbgl::style::expression::dsl;
            propertyValue = nbgl::style::PropertyExpression<float>(
                interpolate(linear(), zoom(), 10.0, interpolate(linear(), number(get("keyName")), 18.0, literal(1.0)))
            );
        }

        XCTAssertEqual(rawLayer->getFillExtrusionHeight(), propertyValue,
                       @"Setting fillExtrusionHeight to a camera-data expression should update fill-extrusion-height.");
        pedanticFunctionExpression = [NSExpression expressionWithFormat:@"ngl_interpolate:withCurveType:parameters:stops:($zoomLevel, 'linear', nil, %@)", @{@10: pedanticFunctionExpression}];
        XCTAssertEqualObjects(layer.fillExtrusionHeight, pedanticFunctionExpression,
                              @"fillExtrusionHeight should round-trip camera-data expressions.");

        layer.fillExtrusionHeight = nil;
        XCTAssertTrue(rawLayer->getFillExtrusionHeight().isUndefined(),
                      @"Unsetting fillExtrusionHeight should return fill-extrusion-height to the default value.");
        XCTAssertEqualObjects(layer.fillExtrusionHeight, defaultExpression,
                              @"fillExtrusionHeight should return the default value after being unset.");
        // Transition property test
        layer.fillExtrusionHeightTransition = transitionTest;
        auto toptions = rawLayer->getFillExtrusionHeightTransition();
        XCTAssert(toptions.delay && NGLTimeIntervalFromDuration(*toptions.delay) == transitionTest.delay);
        XCTAssert(toptions.duration && NGLTimeIntervalFromDuration(*toptions.duration) == transitionTest.duration);

        NGLTransition fillExtrusionHeightTransition = layer.fillExtrusionHeightTransition;
        XCTAssertEqual(fillExtrusionHeightTransition.delay, transitionTest.delay);
        XCTAssertEqual(fillExtrusionHeightTransition.duration, transitionTest.duration);
    }

    // fill-extrusion-opacity
    {
        XCTAssertTrue(rawLayer->getFillExtrusionOpacity().isUndefined(),
                      @"fill-extrusion-opacity should be unset initially.");
        NSExpression *defaultExpression = layer.fillExtrusionOpacity;

        NSExpression *constantExpression = [NSExpression expressionWithFormat:@"1"];
        layer.fillExtrusionOpacity = constantExpression;
        nbgl::style::PropertyValue<float> propertyValue = { 1.0 };
        XCTAssertEqual(rawLayer->getFillExtrusionOpacity(), propertyValue,
                       @"Setting fillExtrusionOpacity to a constant value expression should update fill-extrusion-opacity.");
        XCTAssertEqualObjects(layer.fillExtrusionOpacity, constantExpression,
                              @"fillExtrusionOpacity should round-trip constant value expressions.");

        constantExpression = [NSExpression expressionWithFormat:@"1"];
        XCTExpectFailure(@"Awaiting unit test refactoring https://github.com/maplibre/maplibre-native/issues/421");
        NSExpression *functionExpression = [NSExpression expressionWithFormat:@"ngl_step:from:stops:($zoomLevel, %@, %@)", constantExpression, @{@18: constantExpression}];
        layer.fillExtrusionOpacity = functionExpression;

        {
            using namespace nbgl::style::expression::dsl;
            propertyValue = nbgl::style::PropertyExpression<float>(
                step(zoom(), literal(1.0), 18.0, literal(1.0))
            );
        }

        XCTAssertEqual(rawLayer->getFillExtrusionOpacity(), propertyValue,
                       @"Setting fillExtrusionOpacity to a camera expression should update fill-extrusion-opacity.");
        XCTAssertEqualObjects(layer.fillExtrusionOpacity, functionExpression,
                              @"fillExtrusionOpacity should round-trip camera expressions.");


        layer.fillExtrusionOpacity = nil;
        XCTAssertTrue(rawLayer->getFillExtrusionOpacity().isUndefined(),
                      @"Unsetting fillExtrusionOpacity should return fill-extrusion-opacity to the default value.");
        XCTAssertEqualObjects(layer.fillExtrusionOpacity, defaultExpression,
                              @"fillExtrusionOpacity should return the default value after being unset.");

        functionExpression = [NSExpression expressionForKeyPath:@"bogus"];
        XCTAssertThrowsSpecificNamed(layer.fillExtrusionOpacity = functionExpression, NSException, NSInvalidArgumentException, @"NGLFillExtrusionLayer should raise an exception if a camera-data expression is applied to a property that does not support key paths to feature attributes.");
        functionExpression = [NSExpression expressionWithFormat:@"ngl_step:from:stops:(bogus, %@, %@)", constantExpression, @{@18: constantExpression}];
        functionExpression = [NSExpression expressionWithFormat:@"ngl_interpolate:withCurveType:parameters:stops:($zoomLevel, 'linear', nil, %@)", @{@10: functionExpression}];
        XCTAssertThrowsSpecificNamed(layer.fillExtrusionOpacity = functionExpression, NSException, NSInvalidArgumentException, @"NGLFillExtrusionLayer should raise an exception if a camera-data expression is applied to a property that does not support key paths to feature attributes.");
        // Transition property test
        layer.fillExtrusionOpacityTransition = transitionTest;
        auto toptions = rawLayer->getFillExtrusionOpacityTransition();
        XCTAssert(toptions.delay && NGLTimeIntervalFromDuration(*toptions.delay) == transitionTest.delay);
        XCTAssert(toptions.duration && NGLTimeIntervalFromDuration(*toptions.duration) == transitionTest.duration);

        NGLTransition fillExtrusionOpacityTransition = layer.fillExtrusionOpacityTransition;
        XCTAssertEqual(fillExtrusionOpacityTransition.delay, transitionTest.delay);
        XCTAssertEqual(fillExtrusionOpacityTransition.duration, transitionTest.duration);
    }

    // fill-extrusion-pattern
    {
        XCTAssertTrue(rawLayer->getFillExtrusionPattern().isUndefined(),
                      @"fill-extrusion-pattern should be unset initially.");
        NSExpression *defaultExpression = layer.fillExtrusionPattern;

        NSExpression *constantExpression = [NSExpression expressionForConstantValue:@"Fill Extrusion Pattern"];
        layer.fillExtrusionPattern = constantExpression;
        nbgl::style::PropertyValue<nbgl::style::expression::Image> propertyValue = { "Fill Extrusion Pattern" };
        XCTAssertEqual(rawLayer->getFillExtrusionPattern(), propertyValue,
                       @"Setting fillExtrusionPattern to a constant value expression should update fill-extrusion-pattern.");
        XCTAssertEqualObjects(layer.fillExtrusionPattern, constantExpression,
                              @"fillExtrusionPattern should round-trip constant value expressions.");

        constantExpression = [NSExpression expressionWithFormat:@"NGL_FUNCTION('image', 'Fill Extrusion Pattern')"];
        XCTExpectFailure(@"Awaiting unit test refactoring https://github.com/maplibre/maplibre-native/issues/421");
        NSExpression *functionExpression = [NSExpression expressionWithFormat:@"ngl_step:from:stops:($zoomLevel, %@, %@)", constantExpression, @{@18: constantExpression}];
        layer.fillExtrusionPattern = functionExpression;

        {
            using namespace nbgl::style::expression::dsl;
            propertyValue = nbgl::style::PropertyExpression<nbgl::style::expression::Image>(
                step(zoom(), image(literal("Fill Extrusion Pattern")), 18.0, image(literal("Fill Extrusion Pattern")))
            );
        }

        XCTAssertEqual(rawLayer->getFillExtrusionPattern(), propertyValue,
                       @"Setting fillExtrusionPattern to a camera expression should update fill-extrusion-pattern.");
        XCTAssertEqualObjects(layer.fillExtrusionPattern, functionExpression,
                              @"fillExtrusionPattern should round-trip camera expressions.");


        layer.fillExtrusionPattern = nil;
        XCTAssertTrue(rawLayer->getFillExtrusionPattern().isUndefined(),
                      @"Unsetting fillExtrusionPattern should return fill-extrusion-pattern to the default value.");
        XCTAssertEqualObjects(layer.fillExtrusionPattern, defaultExpression,
                              @"fillExtrusionPattern should return the default value after being unset.");
        // Transition property test
        layer.fillExtrusionPatternTransition = transitionTest;
        auto toptions = rawLayer->getFillExtrusionPatternTransition();
        XCTAssert(toptions.delay && NGLTimeIntervalFromDuration(*toptions.delay) == transitionTest.delay);
        XCTAssert(toptions.duration && NGLTimeIntervalFromDuration(*toptions.duration) == transitionTest.duration);

        NGLTransition fillExtrusionPatternTransition = layer.fillExtrusionPatternTransition;
        XCTAssertEqual(fillExtrusionPatternTransition.delay, transitionTest.delay);
        XCTAssertEqual(fillExtrusionPatternTransition.duration, transitionTest.duration);
    }

    // fill-extrusion-translate
    {
        XCTAssertTrue(rawLayer->getFillExtrusionTranslate().isUndefined(),
                      @"fill-extrusion-translate should be unset initially.");
        NSExpression *defaultExpression = layer.fillExtrusionTranslation;

        NSExpression *constantExpression = [NSExpression expressionWithFormat:@"%@",
#if TARGET_OS_IPHONE
            [NSValue valueWithCGVector:CGVectorMake(1, 1)]
#else
            [NSValue valueWithNGLVector:CGVectorMake(1, -1)]
#endif
        ];
        layer.fillExtrusionTranslation = constantExpression;
        nbgl::style::PropertyValue<std::array<float, 2>> propertyValue = { { 1, 1 } };
        XCTAssertEqual(rawLayer->getFillExtrusionTranslate(), propertyValue,
                       @"Setting fillExtrusionTranslation to a constant value expression should update fill-extrusion-translate.");
        XCTAssertEqualObjects(layer.fillExtrusionTranslation, constantExpression,
                              @"fillExtrusionTranslation should round-trip constant value expressions.");

        constantExpression = [NSExpression expressionWithFormat:@"{1, 1}"];
        XCTExpectFailure(@"Awaiting unit test refactoring https://github.com/maplibre/maplibre-native/issues/421");
        NSExpression *functionExpression = [NSExpression expressionWithFormat:@"ngl_step:from:stops:($zoomLevel, %@, %@)", constantExpression, @{@18: constantExpression}];
        layer.fillExtrusionTranslation = functionExpression;

        {
            using namespace nbgl::style::expression::dsl;
            propertyValue = nbgl::style::PropertyExpression<std::array<float, 2>>(
                step(zoom(), literal({ 1, 1 }), 18.0, literal({ 1, 1 }))
            );
        }

        XCTAssertEqual(rawLayer->getFillExtrusionTranslate(), propertyValue,
                       @"Setting fillExtrusionTranslation to a camera expression should update fill-extrusion-translate.");
        XCTAssertEqualObjects(layer.fillExtrusionTranslation, functionExpression,
                              @"fillExtrusionTranslation should round-trip camera expressions.");


        layer.fillExtrusionTranslation = nil;
        XCTAssertTrue(rawLayer->getFillExtrusionTranslate().isUndefined(),
                      @"Unsetting fillExtrusionTranslation should return fill-extrusion-translate to the default value.");
        XCTAssertEqualObjects(layer.fillExtrusionTranslation, defaultExpression,
                              @"fillExtrusionTranslation should return the default value after being unset.");

        functionExpression = [NSExpression expressionForKeyPath:@"bogus"];
        XCTAssertThrowsSpecificNamed(layer.fillExtrusionTranslation = functionExpression, NSException, NSInvalidArgumentException, @"NGLFillExtrusionLayer should raise an exception if a camera-data expression is applied to a property that does not support key paths to feature attributes.");
        functionExpression = [NSExpression expressionWithFormat:@"ngl_step:from:stops:(bogus, %@, %@)", constantExpression, @{@18: constantExpression}];
        functionExpression = [NSExpression expressionWithFormat:@"ngl_interpolate:withCurveType:parameters:stops:($zoomLevel, 'linear', nil, %@)", @{@10: functionExpression}];
        XCTAssertThrowsSpecificNamed(layer.fillExtrusionTranslation = functionExpression, NSException, NSInvalidArgumentException, @"NGLFillExtrusionLayer should raise an exception if a camera-data expression is applied to a property that does not support key paths to feature attributes.");
    }

    // fill-extrusion-translate-anchor
    {
        XCTAssertTrue(rawLayer->getFillExtrusionTranslateAnchor().isUndefined(),
                      @"fill-extrusion-translate-anchor should be unset initially.");
        NSExpression *defaultExpression = layer.fillExtrusionTranslationAnchor;

        NSExpression *constantExpression = [NSExpression expressionWithFormat:@"'viewport'"];
        layer.fillExtrusionTranslationAnchor = constantExpression;
        nbgl::style::PropertyValue<nbgl::style::TranslateAnchorType> propertyValue = { nbgl::style::TranslateAnchorType::Viewport };
        XCTAssertEqual(rawLayer->getFillExtrusionTranslateAnchor(), propertyValue,
                       @"Setting fillExtrusionTranslationAnchor to a constant value expression should update fill-extrusion-translate-anchor.");
        XCTAssertEqualObjects(layer.fillExtrusionTranslationAnchor, constantExpression,
                              @"fillExtrusionTranslationAnchor should round-trip constant value expressions.");

        constantExpression = [NSExpression expressionWithFormat:@"'viewport'"];
        XCTExpectFailure(@"Awaiting unit test refactoring https://github.com/maplibre/maplibre-native/issues/421");
        NSExpression *functionExpression = [NSExpression expressionWithFormat:@"ngl_step:from:stops:($zoomLevel, %@, %@)", constantExpression, @{@18: constantExpression}];
        layer.fillExtrusionTranslationAnchor = functionExpression;

        {
            using namespace nbgl::style::expression::dsl;
            propertyValue = nbgl::style::PropertyExpression<nbgl::style::TranslateAnchorType>(
                step(zoom(), literal("viewport"), 18.0, literal("viewport"))
            );
        }

        XCTAssertEqual(rawLayer->getFillExtrusionTranslateAnchor(), propertyValue,
                       @"Setting fillExtrusionTranslationAnchor to a camera expression should update fill-extrusion-translate-anchor.");
        XCTAssertEqualObjects(layer.fillExtrusionTranslationAnchor, functionExpression,
                              @"fillExtrusionTranslationAnchor should round-trip camera expressions.");


        layer.fillExtrusionTranslationAnchor = nil;
        XCTAssertTrue(rawLayer->getFillExtrusionTranslateAnchor().isUndefined(),
                      @"Unsetting fillExtrusionTranslationAnchor should return fill-extrusion-translate-anchor to the default value.");
        XCTAssertEqualObjects(layer.fillExtrusionTranslationAnchor, defaultExpression,
                              @"fillExtrusionTranslationAnchor should return the default value after being unset.");

        functionExpression = [NSExpression expressionForKeyPath:@"bogus"];
        XCTAssertThrowsSpecificNamed(layer.fillExtrusionTranslationAnchor = functionExpression, NSException, NSInvalidArgumentException, @"NGLFillExtrusionLayer should raise an exception if a camera-data expression is applied to a property that does not support key paths to feature attributes.");
        functionExpression = [NSExpression expressionWithFormat:@"ngl_step:from:stops:(bogus, %@, %@)", constantExpression, @{@18: constantExpression}];
        functionExpression = [NSExpression expressionWithFormat:@"ngl_interpolate:withCurveType:parameters:stops:($zoomLevel, 'linear', nil, %@)", @{@10: functionExpression}];
        XCTAssertThrowsSpecificNamed(layer.fillExtrusionTranslationAnchor = functionExpression, NSException, NSInvalidArgumentException, @"NGLFillExtrusionLayer should raise an exception if a camera-data expression is applied to a property that does not support key paths to feature attributes.");
    }
}

- (void)testPropertyNames {
    [self testPropertyName:@"fill-extrusion-base" isBoolean:NO];
    [self testPropertyName:@"fill-extrusion-color" isBoolean:NO];
    [self testPropertyName:@"fill-extrusion-has-vertical-gradient" isBoolean:YES];
    [self testPropertyName:@"fill-extrusion-height" isBoolean:NO];
    [self testPropertyName:@"fill-extrusion-opacity" isBoolean:NO];
    [self testPropertyName:@"fill-extrusion-pattern" isBoolean:NO];
    [self testPropertyName:@"fill-extrusion-translation" isBoolean:NO];
    [self testPropertyName:@"fill-extrusion-translation-anchor" isBoolean:NO];
}

- (void)testValueAdditions {
    XCTAssertEqual([NSValue valueWithNGLFillExtrusionTranslationAnchor:NGLFillExtrusionTranslationAnchorMap].NGLFillExtrusionTranslationAnchorValue, NGLFillExtrusionTranslationAnchorMap);
    XCTAssertEqual([NSValue valueWithNGLFillExtrusionTranslationAnchor:NGLFillExtrusionTranslationAnchorViewport].NGLFillExtrusionTranslationAnchorValue, NGLFillExtrusionTranslationAnchorViewport);
}

@end
