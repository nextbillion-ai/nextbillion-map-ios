#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>
#import <QuartzCore/QuartzCore.h>

#import "NGLFoundation.h"
#import "NGLStyleValue.h"
#import "NGLStyleLayer.h"
#import "NGLGeometry.h"

NS_ASSUME_NONNULL_BEGIN

@class NGLMapView;
@class NGLStyle;

typedef struct NGLStyleLayerDrawingContext {
    CGSize size;
    CLLocationCoordinate2D centerCoordinate;
    double zoomLevel;
    CLLocationDirection direction;
    CGFloat pitch;
    CGFloat fieldOfView;
    NGLMatrix4 projectionMatrix;
} NGLStyleLayerDrawingContext;

NGL_EXPORT
@interface NGLOpenGLStyleLayer : NGLStyleLayer

@property (nonatomic, weak, readonly) NGLStyle *style;

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
#if TARGET_OS_IPHONE
@property (nonatomic, readonly) EAGLContext *context;
#else
@property (nonatomic, readonly) CGLContextObj context;
#endif
#pragma clang diagnostic pop

- (instancetype)initWithIdentifier:(NSString *)identifier;

- (void)didMoveToMapView:(NGLMapView *)mapView;

- (void)willMoveFromMapView:(NGLMapView *)mapView;

- (void)drawInMapView:(NGLMapView *)mapView withContext:(NGLStyleLayerDrawingContext)context;

- (void)setNeedsDisplay;

@end

NS_ASSUME_NONNULL_END
