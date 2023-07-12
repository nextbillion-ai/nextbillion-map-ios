#import <Foundation/Foundation.h>

#import "NGLFoundation.h"
#import "NGLOfflineRegion.h"
#import "NGLGeometry.h"

NS_ASSUME_NONNULL_BEGIN

/**
 An offline region defined by a style URL, geographic coordinate bounds, and
 range of zoom levels.
 
 To minimize the resources required by an irregularly shaped offline region,
 use the NGLShapeOfflineRegion class instead.
 
 ### Example
 ```swift
 let northeast = CLLocationCoordinate2D(latitude: 40.989329, longitude: -102.062592)
 let southwest = CLLocationCoordinate2D(latitude: 36.986207, longitude: -109.049896)
 let bbox = NGLCoordinateBounds(sw: southwest, ne: northeast)
 
 let region = NGLTilePyramidOfflineRegion(styleURL: NGLStyle.lightStyleURL, bounds: bbox, fromZoomLevel: 11, toZoomLevel: 14)
 let context = "Tile Pyramid Region".data(using: .utf8)
 NGLOfflineStorage.shared.addPack(for: region, withContext: context!)
 ```
  
 #### Related examples
 See the <a href="https://docs.nbmap.com/ios/maps/examples/offline-pack/">
 Download an offline map</a> example to learn how to define an offline region
 to be downloaded to a user's device.
 */
NGL_EXPORT
@interface NGLTilePyramidOfflineRegion : NSObject <NGLOfflineRegion, NSSecureCoding, NSCopying>

/**
 The coordinate bounds for the geographic region covered by the downloaded
 tiles.
 */
@property (nonatomic, readonly) NGLCoordinateBounds bounds;

/**
 The minimum zoom level for which to download tiles and other resources.

 For more information about zoom levels, `-[NGLMapView zoomLevel]`.
 */
@property (nonatomic, readonly) double minimumZoomLevel;

/**
 The maximum zoom level for which to download tiles and other resources.

 For more information about zoom levels, `-[NGLMapView zoomLevel]`.
 */
@property (nonatomic, readonly) double maximumZoomLevel;

- (instancetype)init NS_UNAVAILABLE;

/**
 Initializes a newly created offline region with the given style URL, geographic
 coordinate bounds, and range of zoom levels.

 This is the designated initializer for `NGLTilePyramidOfflineRegion`.

 @param styleURL URL of the map style for which to download resources. The URL
    may be a full HTTP or HTTPS URL or a Nbmap
    style URL (`nbmap://styles/{user}/{style}`). Specify `nil` for the default style.
    Relative file URLs cannot be used as offline style URLs. To download the
    online resources required by a local style, specify a URL to an online copy
    of the style.
 @param bounds The coordinate bounds for the geographic region to be covered by
    the downloaded tiles.
 @param minimumZoomLevel The minimum zoom level to be covered by the downloaded
    tiles. This parameter should be set to at least 0 but no greater than the
    value of the `maximumZoomLevel` parameter. For each required tile source, if
    this parameter is set to a value less than the tile source’s minimum zoom
    level, the download covers zoom levels down to the tile source’s minimum
    zoom level.
 @param maximumZoomLevel The maximum zoom level to be covered by the downloaded
    tiles. This parameter should be set to at least the value of the
    `minimumZoomLevel` parameter. For each required tile source, if this
    parameter is set to a value greater than the tile source’s minimum zoom
    level, the download covers zoom levels up to the tile source’s maximum zoom
    level.
 */
- (instancetype)initWithStyleURL:(nullable NSURL *)styleURL bounds:(NGLCoordinateBounds)bounds fromZoomLevel:(double)minimumZoomLevel toZoomLevel:(double)maximumZoomLevel NS_DESIGNATED_INITIALIZER;

@end

NS_ASSUME_NONNULL_END
