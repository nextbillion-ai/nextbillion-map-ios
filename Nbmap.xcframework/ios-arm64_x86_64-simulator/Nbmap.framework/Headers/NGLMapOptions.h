#import <Foundation/Foundation.h>

#import "NGLActionJournalOptions.h"
#import "NGLFoundation.h"
#import "NGLStyle.h"

NS_ASSUME_NONNULL_BEGIN

/**
 The ``NGLMapOptions`` object provides a way to set map properties for each instance
 */
NGL_EXPORT
@interface NGLMapOptions : NSObject

/**
 URL of the map style to display. The URL may be a full HTTP
 or HTTPS URL, a canonical URL or a path to a local file relative
 to the application’s resource path. Specify `nil` for the default style.
 */
@property (nonatomic, nullable) NSURL *styleURL;

/**
 JSON string of the map style to display. The JSON must conform to the
 <a href="https://maplibre.org/maplibre-style-spec/">MapLibre Style Specification</a>.
 Specify `nil` for the default style.
 Ignored if `styleURL` is set to a non-nil value.
 */

@property (nonatomic, nullable) NSString *styleJSON;

/**
 The predefined style type to use for the map. This property provides a convenient way
 to set the map style using predefined style types such as Bright, Night, and Satellite.
 
 If both `styleType` and `styleURL` are set, `styleURL` takes precedence.
 If both `styleType` and `styleJSON` are set, `styleJSON` takes precedence.
 */
@property (nonatomic) NGMapStyleType styleType;

/**
 Action journal  options
 */
@property (nonatomic, nonnull) NGLActionJournalOptions *actionJournalOptions;

/**
 Convenience initializer that creates map options with a specific style type.
 
 @param styleType The predefined style type to use for the map.
 @return A new NGLMapOptions instance configured with the specified style type.
 */
- (instancetype)initWithStyleType:(NGMapStyleType)styleType;

@end

NS_ASSUME_NONNULL_END
