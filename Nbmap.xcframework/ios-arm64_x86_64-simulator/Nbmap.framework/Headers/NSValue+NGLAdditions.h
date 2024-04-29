#import <Foundation/Foundation.h>

#import "NGLGeometry.h"
#import "NGLLight.h"
#import "NGLOfflinePack.h"
#import "NGLTypes.h"

NS_ASSUME_NONNULL_BEGIN

/**
 Methods for round-tripping values for Nbmap-defined types.
 */
@interface NSValue (NGLAdditions)

#pragma mark Working with Geographic Coordinate Values

/**
 Creates a new value object containing the specified Core Location geographic
 coordinate structure.

 @param coordinate The value for the new object.
 @return A new value object that contains the geographic coordinate information.
 */
+ (instancetype)valueWithNGLCoordinate:(CLLocationCoordinate2D)coordinate;

/**
 The Core Location geographic coordinate structure representation of the value.
 */
@property (readonly) CLLocationCoordinate2D NGLCoordinateValue;

/**
 Creates a new value object containing the specified Nbmap map point structure.

 @param point The value for the new object.
 @return A new value object that contains the coordinate and zoom level information.
 */
+ (instancetype)valueWithNGLMapPoint:(NGLMapPoint)point;

/**
 The Nbmap map point structure representation of the value.
 */
@property (readonly) NGLMapPoint NGLMapPointValue;

/**
 Creates a new value object containing the specified Nbmap coordinate span
 structure.

 @param span The value for the new object.
 @return A new value object that contains the coordinate span information.
 */
+ (instancetype)valueWithNGLCoordinateSpan:(NGLCoordinateSpan)span;

/**
 The Nbmap coordinate span structure representation of the value.
 */
@property (readonly) NGLCoordinateSpan NGLCoordinateSpanValue;

/**
 Creates a new value object containing the specified Nbmap coordinate bounds
 structure.

 @param bounds The value for the new object.
 @return A new value object that contains the coordinate bounds information.
 */
+ (instancetype)valueWithNGLCoordinateBounds:(NGLCoordinateBounds)bounds;

/**
 The Nbmap coordinate bounds structure representation of the value.
 */
@property (readonly) NGLCoordinateBounds NGLCoordinateBoundsValue;

/**
 Creates a new value object containing the specified Nbmap coordinate 
 quad structure.

 @param quad The value for the new object.
 @return A new value object that contains the coordinate quad information.
 */
+ (instancetype)valueWithNGLCoordinateQuad:(NGLCoordinateQuad)quad;

/**
 The Nbmap coordinate quad structure representation of the value.
 */
- (NGLCoordinateQuad)NGLCoordinateQuadValue;

#pragma mark Working with Offline Map Values

/**
 Creates a new value object containing the given `NGLOfflinePackProgress`
 structure.

 @param progress The value for the new object.
 @return A new value object that contains the offline pack progress information.
 */
+ (NSValue *)valueWithNGLOfflinePackProgress:(NGLOfflinePackProgress)progress;

/**
 The `NGLOfflinePackProgress` structure representation of the value.
 */
@property (readonly) NGLOfflinePackProgress NGLOfflinePackProgressValue;

#pragma mark Working with Transition Values

/**
 Creates a new value object containing the given `NGLTransition`
 structure.
 
 @param transition The value for the new object.
 @return A new value object that contains the transition information.
 */
+ (NSValue *)valueWithNGLTransition:(NGLTransition)transition;

/**
 The `NGLTransition` structure representation of the value.
 */
@property (readonly) NGLTransition NGLTransitionValue;

/**
 Creates a new value object containing the given `NGLSphericalPosition`
 structure.
 
 @param lightPosition The value for the new object.
 @return A new value object that contains the light position information.
 */
+ (instancetype)valueWithNGLSphericalPosition:(NGLSphericalPosition)lightPosition;

/**
 The `NGLSphericalPosition` structure representation of the value.
 */
@property (readonly) NGLSphericalPosition NGLSphericalPositionValue;

/**
 Creates a new value object containing the given `NGLLightAnchor`
 enum.
 
 @param lightAnchor The value for the new object.
 @return A new value object that contains the light anchor information.
 */
+ (NSValue *)valueWithNGLLightAnchor:(NGLLightAnchor)lightAnchor;

/**
 The `NGLLightAnchor` enum representation of the value.
 */
@property (readonly) NGLLightAnchor NGLLightAnchorValue;

@end

NS_ASSUME_NONNULL_END
