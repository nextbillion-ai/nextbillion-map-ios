#import "NGLFoundation.h"

NS_ASSUME_NONNULL_BEGIN

/** Options for `NGLAttributedExpression.attributes`. */
typedef NSString * NGLAttributedExpressionKey NS_TYPED_ENUM;

/** The font name string array expression used to format the text. */
FOUNDATION_EXTERN NGL_EXPORT NGLAttributedExpressionKey const NGLFontNamesAttribute;

/** The font scale number expression relative to `NGLSymbolStyleLayer.textFontSize` used to format the text. */
FOUNDATION_EXTERN NGL_EXPORT NGLAttributedExpressionKey const NGLFontScaleAttribute;

/** The font color expression used to format the text. */
FOUNDATION_EXTERN NGL_EXPORT NGLAttributedExpressionKey const NGLFontColorAttribute;

/**
 An `NGLAttributedExpression` object associates text formatting attibutes (such as font size or
 font names) to an `NSExpression`.
 
 ### Example
 ```swift
 let redColor = UIColor.red
 let expression = NSExpression(forConstantValue: "Foo")
 let attributes: [NGLAttributedExpressionKey: NSExpression] = [.fontNamesAttribute : NSExpression(forConstantValue: ["DIN Offc Pro Italic",
                                                                                                                     "Arial Unicode MS Regular"]),
                                                               .fontScaleAttribute: NSExpression(forConstantValue: 1.2),
                                                               .fontColorAttribute: NSExpression(forConstantValue: redColor)]
 let attributedExpression = NGLAttributedExpression(expression, attributes:attributes)
 ```
 
 */
NGL_EXPORT
@interface NGLAttributedExpression : NSObject

/**
 The expression content of the receiver as `NSExpression`.
 */
@property (strong, nonatomic) NSExpression *expression;

#if TARGET_OS_IPHONE
/**
 The formatting attributes dictionary.
 Key | Value Type
 --- | ---
 `NGLFontNamesAttribute` | An `NSExpression` evaluating to an `NSString` array.
 `NGLFontScaleAttribute` | An `NSExpression` evaluating to an `NSNumber` value.
 `NGLFontColorAttribute` | An `NSExpression` evaluating to an `UIColor`.

 */
@property (strong, nonatomic, readonly) NSDictionary<NGLAttributedExpressionKey, NSExpression *> *attributes;
#else
/**
 The formatting attributes dictionary.
 Key | Value Type
 --- | ---
 `NGLFontNamesAttribute` | An `NSExpression` evaluating to an `NSString` array.
 `NGLFontScaleAttribute` | An `NSExpression` evaluating to an `NSNumber` value.
 `NGLFontColorAttribute` | An `NSExpression` evaluating to an `NSColor` on macos.
 */
@property (strong, nonatomic, readonly) NSDictionary<NGLAttributedExpressionKey, NSExpression *> *attributes;
#endif


/**
 Returns an `NGLAttributedExpression` object initialized with an expression and no attribute information.
 */
- (instancetype)initWithExpression:(NSExpression *)expression;

/** 
 Returns an `NGLAttributedExpression` object initialized with an expression and text format attributes.
 */
- (instancetype)initWithExpression:(NSExpression *)expression attributes:(nonnull NSDictionary <NGLAttributedExpressionKey, NSExpression *> *)attrs;

/**
 Creates an `NGLAttributedExpression` object initialized with an expression and the format attributes for font names and font size.
 */
+ (instancetype)attributedExpression:(NSExpression *)expression fontNames:(nullable NSArray<NSString*> *)fontNames fontScale:(nullable NSNumber *)fontScale;

/**
 Creates an `NGLAttributedExpression` object initialized with an expression and the format attributes dictionary.
 */
+ (instancetype)attributedExpression:(NSExpression *)expression attributes:(nonnull NSDictionary <NGLAttributedExpressionKey, NSExpression *> *)attrs;

@end

NS_ASSUME_NONNULL_END
