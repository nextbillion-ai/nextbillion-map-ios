#import <Foundation/Foundation.h>

#import "NGLFoundation.h"

NS_ASSUME_NONNULL_BEGIN

/**
 The `NGLAccountManager` object provides a global way to set a Nbmap API access
 token.
 */
NGL_EXPORT
@interface NGLAccountManager : NSObject

#pragma mark Authorizing Access

/**
 Setting this property to a value of `nil` has no effect.

 @note You must set the access token before attempting to load any Nbmap-hosted
    style. Therefore, you should generally set it before creating an instance of
    `NGLMapView`. The recommended way to set an access token is to add an entry
    to your application’s Info.plist file with the key `NBMapAccessKey`
    and the type `String`. Alternatively, you may call this method from your
    application delegate’s `-applicationDidFinishLaunching:` method.
 */
@property (class, copy, nullable) NSString *accessToken;

@end

NS_ASSUME_NONNULL_END
