#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>

#import "NGLFoundation.h"

NS_ASSUME_NONNULL_BEGIN

/**
 `NGLDistanceFormatter` implements a formatter object meant to be used for
 geographic distances. The user’s current locale will be used by default
 but it can be overriden by changing the locale property of the numberFormatter.
 */
NGL_EXPORT
@interface NGLDistanceFormatter : NSLengthFormatter

/**
 Returns a localized formatted string for the provided distance.
 
 @param distance The distance, measured in meters.
 @return A localized formatted distance string including units.
 */
- (NSString *)stringFromDistance:(CLLocationDistance)distance;

@end

NS_ASSUME_NONNULL_END
