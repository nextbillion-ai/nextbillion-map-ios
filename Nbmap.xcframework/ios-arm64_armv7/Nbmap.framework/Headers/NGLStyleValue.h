#import <Foundation/Foundation.h>
#import <CoreGraphics/CoreGraphics.h>

#import "NGLFoundation.h"
#import "NGLTypes.h"

NS_ASSUME_NONNULL_BEGIN

typedef NSString *NGLStyleFunctionOption NS_STRING_ENUM NS_UNAVAILABLE;

FOUNDATION_EXTERN NGL_EXPORT const NGLStyleFunctionOption NGLStyleFunctionOptionInterpolationBase __attribute__((unavailable("Use NSExpression instead, applying the ngl_interpolate:withCurveType:parameters:stops: function with a curve type of “exponential” and a non-nil parameter.")));

FOUNDATION_EXTERN NGL_EXPORT const NGLStyleFunctionOption NGLStyleFunctionOptionDefaultValue __attribute__((unavailable("Use +[NSExpression expressionForConditional:trueExpression:falseExpression:] instead.")));

typedef NS_ENUM(NSUInteger, NGLInterpolationMode) {
    NGLInterpolationModeExponential __attribute__((unavailable("Use NSExpression instead, applying the ngl_interpolate:withCurveType:parameters:stops: function with a curve type of “exponential”."))) = 0,
    NGLInterpolationModeInterval __attribute__((unavailable("Use NSExpression instead, calling the ngl_step:from:stops: function."))),
    NGLInterpolationModeCategorical __attribute__((unavailable("Use NSExpression instead."))),
    NGLInterpolationModeIdentity __attribute__((unavailable("Use +[NSExpression expressionForKeyPath:] instead.")))
} __attribute__((unavailable("Use NSExpression instead.")));

NGL_EXPORT __attribute__((unavailable("Use NSExpression instead.")))
@interface NGLStyleValue<T> : NSObject
@end

NGL_EXPORT __attribute__((unavailable("Use +[NSExpression expressionForConstantValue:] instead.")))
@interface NGLConstantStyleValue<T> : NGLStyleValue<T>
@end

@compatibility_alias NGLStyleConstantValue NGLConstantStyleValue;

NGL_EXPORT __attribute__((unavailable("Use NSExpression instead, calling the ngl_step:from:stops: or ngl_interpolate:withCurveType:parameters:stops: function.")))
@interface NGLStyleFunction<T> : NGLStyleValue<T>
@end

NGL_EXPORT __attribute__((unavailable("Use NSExpression instead, applying the ngl_step:from:stops: or ngl_interpolate:withCurveType:parameters:stops: function to the $zoomLevel variable.")))
@interface NGLCameraStyleFunction<T> : NGLStyleFunction<T>
@end

NGL_EXPORT __attribute__((unavailable("Use NSExpression instead, applying the ngl_step:from:stops: or ngl_interpolate:withCurveType:parameters:stops: function to a key path expression.")))
@interface NGLSourceStyleFunction<T> : NGLStyleFunction<T>
@end

NGL_EXPORT __attribute__((unavailable("Use a NSExpression instead with nested ngl_step:from:stops: or ngl_interpolate:withCurveType:parameters:stops: function calls.")))
@interface NGLCompositeStyleFunction<T> : NGLStyleFunction<T>
@end

NS_ASSUME_NONNULL_END
