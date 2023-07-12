#import <Foundation/Foundation.h>
#import <CoreGraphics/CoreGraphics.h>

#import "NGLFoundation.h"

#pragma once

#if TARGET_OS_IPHONE
@class UIImage;
#define NGLImage UIImage
#else
@class NSImage;
#define NGLImage NSImage
#endif

#if TARGET_OS_IPHONE
@class UIColor;
#define NGLColor UIColor
#else
@class NSColor;
#define NGLColor NSColor
#endif

NS_ASSUME_NONNULL_BEGIN

typedef NSString *NGLExceptionName NS_TYPED_EXTENSIBLE_ENUM;

/**
 :nodoc: Generic exceptions used across multiple disparate classes. Exceptions
 that are unique to a class or class-cluster should be defined in those headers.
 */
FOUNDATION_EXTERN NGL_EXPORT NGLExceptionName const NGLAbstractClassException;

/** Indicates an error occurred in the Nbmap SDK. */
FOUNDATION_EXTERN NGL_EXPORT NSErrorDomain const NGLErrorDomain;

/** Error constants for the Nbmap SDK. */
typedef NS_ENUM(NSInteger, NGLErrorCode) {
    /** An unknown error occurred. */
    NGLErrorCodeUnknown = -1,
    /** The resource could not be found. */
    NGLErrorCodeNotFound = 1,
    /** The connection received an invalid server response. */
    NGLErrorCodeBadServerResponse = 2,
    /** An attempt to establish a connection failed. */
    NGLErrorCodeConnectionFailed = 3,
    /** A style parse error occurred while attempting to load the map. */
    NGLErrorCodeParseStyleFailed = 4,
    /** An attempt to load the style failed. */
    NGLErrorCodeLoadStyleFailed = 5,
    /** An error occurred while snapshotting the map. */
    NGLErrorCodeSnapshotFailed = 6,
    /** Source is in use and cannot be removed */
    NGLErrorCodeSourceIsInUseCannotRemove = 7,
    /** Source is in use and cannot be removed */
    NGLErrorCodeSourceIdentifierMismatch = 8,
    /** An error occurred while modifying the offline storage database */
    NGLErrorCodeModifyingOfflineStorageFailed = 9,
    /** Source is invalid and cannot be removed from the style (e.g. after a style change) */
    NGLErrorCodeSourceCannotBeRemovedFromStyle  = 10,
    /** An error occurred while rendering */
    NGLErrorCodeRenderingError = 11,
};

/** Options for enabling debugging features in an `NGLMapView` instance. */
typedef NS_OPTIONS(NSUInteger, NGLMapDebugMaskOptions) {
    /** Edges of tile boundaries are shown as thick, red lines to help diagnose
        tile clipping issues. */
    NGLMapDebugTileBoundariesMask = 1 << 1,
    /** Each tile shows its tile coordinate (x/y/z) in the upper-left corner. */
    NGLMapDebugTileInfoMask = 1 << 2,
    /** Each tile shows a timestamp indicating when it was loaded. */
    NGLMapDebugTimestampsMask = 1 << 3,
    /** Edges of glyphs and symbols are shown as faint, green lines to help
        diagnose collision and label placement issues. */
    NGLMapDebugCollisionBoxesMask = 1 << 4,
    /** Each drawing operation is replaced by a translucent fill. Overlapping
        drawing operations appear more prominent to help diagnose overdrawing.
        @note This option does nothing in Release builds of the SDK. */
    NGLMapDebugOverdrawVisualizationMask = 1 << 5,
#if !TARGET_OS_IPHONE
    /** The stencil buffer is shown instead of the color buffer.
        @note This option does nothing in Release builds of the SDK. */
    NGLMapDebugStencilBufferMask = 1 << 6,
    /** The depth buffer is shown instead of the color buffer.
        @note This option does nothing in Release builds of the SDK. */
    NGLMapDebugDepthBufferMask = 1 << 7,
#endif
};

/**
 A structure containing information about a transition.
 */
typedef struct __attribute__((objc_boxable)) NGLTransition {
    /**
     The amount of time the animation should take, not including the delay.
     */
    NSTimeInterval duration;
    
    /**
     The amount of time in seconds to wait before beginning the animation.
     */
    NSTimeInterval delay; 
} NGLTransition;

NS_INLINE NSString *NGLStringFromNGLTransition(NGLTransition transition) {
    return [NSString stringWithFormat:@"transition { duration: %f, delay: %f }", transition.duration, transition.delay];
}

/**
 Creates a new `NGLTransition` from the given duration and delay.
 
 @param duration The amount of time the animation should take, not including 
 the delay.
 @param delay The amount of time in seconds to wait before beginning the 
 animation.
 
 @return Returns a `NGLTransition` struct containing the transition attributes.
 */
NS_INLINE NGLTransition NGLTransitionMake(NSTimeInterval duration, NSTimeInterval delay) {
    NGLTransition transition;
    transition.duration = duration;
    transition.delay = delay;
    
    return transition;
}

/**
 Constants indicating the visibility of different map ornaments.
 */
typedef NS_ENUM(NSInteger, NGLOrnamentVisibility) {
    /** A constant indicating that the ornament adapts to the current map state. */
    NGLOrnamentVisibilityAdaptive,
    /** A constant indicating that the ornament is always hidden. */
    NGLOrnamentVisibilityHidden,
    /** A constant indicating that the ornament is always visible. */
    NGLOrnamentVisibilityVisible
};

NS_ASSUME_NONNULL_END
