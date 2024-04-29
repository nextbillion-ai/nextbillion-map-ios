#import <Foundation/Foundation.h>
#if TARGET_OS_IPHONE
    #import <UIKit/UIKit.h>
#else
    #import <Cocoa/Cocoa.h>
#endif

#import "NGLTypes.h"

@class NGLAttributedExpression;

NS_ASSUME_NONNULL_BEGIN

typedef NSString *NGLExpressionInterpolationMode NS_TYPED_ENUM;

/**
 An `NSString` identifying the `linear` interpolation type in an `NSExpression`.
 
 This attribute corresponds to the `linear` value in the
 <a href="https://www.nbmap.com/nbmap-gl-js/style-spec/#expressions-interpolate"><code>interpolate</code></a>
 expression operator in the Nbmap Style Specification.
 */
FOUNDATION_EXTERN NGL_EXPORT const NGLExpressionInterpolationMode NGLExpressionInterpolationModeLinear;

/**
 An `NSString` identifying the `expotential` interpolation type in an `NSExpression`.
 
 This attribute corresponds to the `exponential` value in the
 <a href="https://www.nbmap.com/nbmap-gl-js/style-spec/#expressions-interpolate"><code>interpolate</code></a>
 expression operator in the Nbmap Style Specification.
 */
FOUNDATION_EXTERN NGL_EXPORT const NGLExpressionInterpolationMode NGLExpressionInterpolationModeExponential;

/**
 An `NSString` identifying the `cubic-bezier` interpolation type in an `NSExpression`.
 
 This attribute corresponds to the `cubic-bezier` value in the
 <a href="https://www.nbmap.com/nbmap-gl-js/style-spec/#expressions-interpolate"><code>interpolate</code></a>
 expression operator in the Nbmap Style Specification.
 */
FOUNDATION_EXTERN NGL_EXPORT const NGLExpressionInterpolationMode NGLExpressionInterpolationModeCubicBezier;

/**
 Methods for creating expressions that use Nbmap-specific functionality and for
 converting to and from the JSON format defined in the
 <a href="https://www.nbmap.com/nbmap-gl-js/style-spec/#expressions">Nbmap Style Specification</a>.
 */
@interface NSExpression (NGLAdditions)

#pragma mark Creating Variable Expressions

/**
 `NSExpression` variable that corresponds to the
 <a href="https://www.nbmap.com/nbmap-gl-js/style-spec/#expressions-zoom"><code>zoom</code></a>
 expression operator in the Nbmap Style Specification.
 */
@property (class, nonatomic, readonly) NSExpression *zoomLevelVariableExpression;

/**
 `NSExpression` variable that corresponds to the
 <a href="https://www.nbmap.com/nbmap-gl-js/style-spec/#expressions-heatmap-density"><code>heatmap-density</code></a>
 expression operator in the Nbmap Style Specification.
 */
@property (class, nonatomic, readonly) NSExpression *heatmapDensityVariableExpression;

/**
 `NSExpression` variable that corresponds to the
 <a href="https://www.nbmap.com/nbmap-gl-js/style-spec/#expressions-line-progress"><code>line-progress</code></a>
 expression operator in the Nbmap Style Specification.
 */
@property (class, nonatomic, readonly) NSExpression *lineProgressVariableExpression;

/**
 `NSExpression` variable that corresponds to the
 <a href="https://www.nbmap.com/nbmap-gl-js/style-spec/#eexpressions-geometry-type"><code>geometry-type</code></a>
 expression operator in the Nbmap Style Specification.
 */
@property (class, nonatomic, readonly) NSExpression *geometryTypeVariableExpression;

/**
 `NSExpression` variable that corresponds to the
 <a href="https://www.nbmap.com/nbmap-gl-js/style-spec/#expressions-id"><code>id</code></a>
 expression operator in the Nbmap Style Specification.
 */
@property (class, nonatomic, readonly) NSExpression *featureIdentifierVariableExpression;

/**
 `NSExpression` variable that corresponds to the
 <a href="https://docs.nbmap.com/nbmap-gl-js/style-spec/#accumulated"><code>id</code></a>
 expression operator in the Nbmap Style Specification.
 */
@property (class, nonatomic, readonly) NSExpression *featureAccumulatedVariableExpression;

/**
 `NSExpression` variable that corresponds to the
 <a href="https://www.nbmap.com/nbmap-gl-js/style-spec/#expressions-properties"><code>properties</code></a>
 expression operator in the Nbmap Style Specification.
 */
@property (class, nonatomic, readonly) NSExpression *featureAttributesVariableExpression;

@property (class, nonatomic, readonly) NSExpression *featurePropertiesVariableExpression __attribute__((deprecated("", "featureAttributesVariableExpression")));

#pragma mark Creating Conditional Expressions

/**
 Returns a conditional function expression specifying the string predicate, and
 expressions for each condition.
 
 @param conditionPredicate The predicate to get evaluated.
 @param trueExpression The expression for conditions equal to true.
 @param falseExpression The expression for conditions equal to false.
 */
+ (instancetype)ngl_expressionForConditional:(nonnull NSPredicate *)conditionPredicate trueExpression:(nonnull NSExpression *)trueExpression falseExpresssion:(nonnull NSExpression *)falseExpression NS_SWIFT_NAME(init(forNGLConditional:trueExpression:falseExpression:));

#pragma mark Creating Ramp, Scale, and Curve Expressions

/**
 Returns a step function expression specifying the stepping, from expression
 and stops.
 
 @param steppingExpression The stepping expression.
 @param minimumExpression The expression which could be a constant or function expression.
 @param stops The stops must be an `NSDictionary` constant `NSExpression`.
 
 #### Related examples
 See the <a href="https://docs.nbmap.com/ios/maps/examples/dds-circle-layer/">
 Data-driven circles</a>, <a href="https://docs.nbmap.com/ios/maps/examples/clustering/">
 Cluster point data</a>, and <a href="https://docs.nbmap.com/ios/maps/examples/clustering-with-images/">
 Use images to cluster point data</a> examples to learn how to use this
 expression to style a map layer based on an attribute value.
 */
+ (instancetype)ngl_expressionForSteppingExpression:(nonnull NSExpression*)steppingExpression fromExpression:(nonnull NSExpression *)minimumExpression stops:(nonnull NSExpression*)stops NS_SWIFT_NAME(init(forNGLStepping:from:stops:));

/**
 Returns an interpolated function expression specifying the function operator, curve type,
 parameters and steps.
 
 @param inputExpression The interpolating expression input.
 @param curveType The curve type could be `NGLExpressionInterpolationModeLinear`,
 `NGLExpressionInterpolationModeExponential` and
 `NGLExpressionInterpolationModeCubicBezier`.
 @param parameters The parameters expression.
 @param stops The stops expression.
 
 #### Related examples
 See the <a href="https://docs.nbmap.com/ios/maps/examples/heatmap-example/">
 Create a heatmap layer</a> example to learn how to style an `NGLHeatmapStyleLayer`
 based on zoom level and point density with this expression.
 */
+ (instancetype)ngl_expressionForInterpolatingExpression:(nonnull NSExpression*)inputExpression withCurveType:(nonnull NGLExpressionInterpolationMode)curveType parameters:(nullable NSExpression *)parameters stops:(nonnull NSExpression*)stops NS_SWIFT_NAME(init(forNGLInterpolating:curveType:parameters:stops:));

/**
 Returns a match function expression specifying the input, matching values,
 and default value.
 
 @param inputExpression The matching expression.
 @param matchedExpressions The matched values expression dictionary must be condition : value.
 @param defaultExpression The defaultValue expression to be used in case there is no match.
 */
+ (instancetype)ngl_expressionForMatchingExpression:(nonnull NSExpression *)inputExpression inDictionary:(nonnull NSDictionary<NSExpression *, NSExpression *> *)matchedExpressions defaultExpression:(nonnull NSExpression *)defaultExpression NS_SWIFT_NAME(init(forNGLMatchingKey:in:default:));

/**
 Returns an attributed function expression specifying an `NGLAttributedExpression` constant
 expression array.
 
 @param attributedExpressions The `NGLAttributedExpression` constant expression array.
 */
+ (instancetype)ngl_expressionForAttributedExpressions:(nonnull NSArray<NSExpression *> *)attributedExpressions NS_SWIFT_NAME(init(forAttributedExpressions:));

#pragma mark Concatenating String Expressions

/**
 Returns a constant expression appending the passed expression.
 
 @note Both the receiver and the given expression must be an `NSString` constant
 expression type; otherwise, an exception is rised.
 
 @param expression The expression to append to the receiver.
 */
- (instancetype)ngl_expressionByAppendingExpression:(nonnull NSExpression *)expression NS_SWIFT_NAME(ngl_appending(_:));

#pragma mark Converting JSON Expressions

/**
 Returns an expression equivalent to the given Foundation object deserialized
 from JSON data.
 
 The Foundation object is interpreted according to the
 [Nbmap Style Specification](https://www.nbmap.com/nbmap-gl-js/style-spec/#expressions).
 See the
 “[Information for Style Authors](../for-style-authors.html#setting-attribute-values)”
 guide for a correspondence of operators and types between the style
 specification and the `NSExpression` representation used by this SDK.
 
 @param object A Foundation object deserialized from JSON data, for example
    using `NSJSONSerialization`.
 @return An initialized expression equivalent to `object`, suitable for use as
    the value of a style layer attribute.
 */
+ (instancetype)expressionWithNGLJSONObject:(id)object NS_SWIFT_NAME(init(nglJSONObject:));

/**
 An equivalent Foundation object that can be serialized as JSON.
 
 The Foundation object conforms to the
 [Nbmap Style Specification](https://www.nbmap.com/nbmap-gl-js/style-spec/#expressions).
 See the
 “[Information for Style Authors](../for-style-authors.html#setting-attribute-values)”
 guide for a correspondence of operators and types between the style
 specification and the `NSExpression` representation used by this SDK.
 
 You can use `NSJSONSerialization` to serialize the Foundation object as data to
 write to a file.
 */
@property (nonatomic, readonly) id ngl_jsonExpressionObject;

#pragma mark Localizing the Expression

/**
 Returns a copy of the receiver localized into the given locale.
 
 This method assumes the receiver refers to the feature attributes that are
 available in vector tiles supplied by the
 <a href="https://www.nbmap.com/vector-tiles/nbmap-streets-v8/#overview">Nbmap Streets source</a>.
 On iOS, the user can set the system’s preferred language in Settings, General
 Settings, Language & Region. On macOS, the user can set the system’s preferred
 language in the Language & Region pane of System Preferences.
 
 @param locale The locale into which labels should be localized. To use the
    system’s preferred language, if supported, specify `nil`. To use the local
    language, specify a locale with the identifier `mul`.
 */
- (NSExpression *)ngl_expressionLocalizedIntoLocale:(nullable NSLocale *)locale;

@end

NS_ASSUME_NONNULL_END
