#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSPredicate (NGLAdditions)

#pragma mark Converting JSON Expressions

/**
 Returns a predicate equivalent to the given Foundation object deserialized
 from JSON data.
 
 The Foundation object is interpreted according to the
 [Nbmap Style Specification](https://www.nbmap.com/nbmap-gl-js/style-spec/#expressions).
 See the
 “[Predicates and Expressions](../predicates-and-expressions.html)”
 guide for a correspondence of operators and types between the style
 specification and the `NSPredicate` representation used by this SDK.
 
 @param object A Foundation object deserialized from JSON data, for example
 using `NSJSONSerialization`.
 @return An initialized predicate equivalent to `object`, suitable for use
 with the `NGLVectorStyleLayer.predicate` property.
 */
+ (instancetype)predicateWithNGLJSONObject:(id)object NS_SWIFT_NAME(init(nglJSONObject:));

/**
 An equivalent Foundation object that can be serialized as JSON.
 
 The Foundation object conforms to the
 [Nbmap Style Specification](https://www.nbmap.com/nbmap-gl-js/style-spec/#expressions).
 See the
 “[Predicates and Expressions](../predicates-and-expressions.html)”
 guide for a correspondence of operators and types between the style
 specification and the `NSPredicate` representation used by this SDK.
 
 You can use `NSJSONSerialization` to serialize the Foundation object as data to
 write to a file.
 */
@property (nonatomic, readonly) id ngl_jsonExpressionObject;

@end

NS_ASSUME_NONNULL_END
