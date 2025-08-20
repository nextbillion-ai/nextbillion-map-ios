#import "NGLFoundation.h"

/**
 Bitmask values that describe why a camera move occurred.

 Values of this type are passed to the ``NGLMapView``'s delegate in the following methods:

 - ``NGLMapViewDelegate/mapView:shouldChangeFromCamera:toCamera:reason:``
 - ``NGLMapViewDelegate/mapView:regionWillChangeWithReason:animated:``
 - ``NGLMapViewDelegate/mapView:regionIsChangingWithReason:``
 - ``NGLMapViewDelegate/mapView:regionDidChangeWithReason:animated:``

 It's important to note that it's almost impossible to perform a rotate without zooming (in or out),
 so if you'll often find ``NGLCameraChangeReasonGesturePinch`` set alongside
 ``NGLCameraChangeReasonGestureRotate``.

 Since there are several reasons why a zoom or rotation has occurred, it is worth considering
 creating a combined constant, for example:

 ```objc
 static const NGLCameraChangeReason anyZoom = NGLCameraChangeReasonGesturePinch |
                                                NGLCameraChangeReasonGestureZoomIn |
                                                NGLCameraChangeReasonGestureZoomOut |
                                                NGLCameraChangeReasonGestureOneFingerZoom;

 static const NGLCameraChangeReason anyRotation = NGLCameraChangeReasonResetNorth |
 NGLCameraChangeReasonGestureRotate;
 ```
 */
typedef NS_OPTIONS(NSUInteger, NGLCameraChangeReason) {
  /// The reason for the camera change has not be specified.
  NGLCameraChangeReasonNone = 0,

  /// Set when a public API that moves the camera is called. This may be set for some
  /// gestures, for example NGLCameraChangeReasonResetNorth.
  NGLCameraChangeReasonProgrammatic = 1 << 0,

  /// The user tapped the compass to reset the map orientation so North is up.
  NGLCameraChangeReasonResetNorth = 1 << 1,

  /// The user panned the map.
  NGLCameraChangeReasonGesturePan = 1 << 2,

  /// The user pinched to zoom in/out.
  NGLCameraChangeReasonGesturePinch = 1 << 3,

  // :nodoc: The user rotated the map.
  NGLCameraChangeReasonGestureRotate = 1 << 4,

  /// The user zoomed the map in (one finger double tap).
  NGLCameraChangeReasonGestureZoomIn = 1 << 5,

  /// The user zoomed the map out (two finger single tap).
  NGLCameraChangeReasonGestureZoomOut = 1 << 6,

  /// The user long pressed on the map for a quick zoom (single tap, then long press and
  /// drag up/down).
  NGLCameraChangeReasonGestureOneFingerZoom = 1 << 7,

  // The user panned with two fingers to tilt the map (two finger drag).
  NGLCameraChangeReasonGestureTilt = 1 << 8,

  // Cancelled
  NGLCameraChangeReasonTransitionCancelled = 1 << 16

};
