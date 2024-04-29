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

/**
 Setting this property to a value of `nil` has no effect.
 
 The name of the API key header. If set, the API key will be added to the request header with this name instead of in the query.
 
 @note You can set the header name  before attempting to load any Nbmap-hosted
 style. Therefore, you should generally set it before creating an instance of
 `NGLMapView`. The recommended way to set an access token is to add an entry
 to your application’s Info.plist file with the key `NBMapApiKeyHeaderName`
 and the type `String`. Alternatively, you may call this method from your
 application delegate’s `-applicationDidFinishLaunching:` method.
 */
@property (class, copy, nullable) NSString *apiKeyHeaderName;

@property (class, nonatomic, strong, readonly) NSURL *apiBaseURL;

+ (void)setAPIBaseURL:(NSURL *)apiBaseURL;

@end

NS_ASSUME_NONNULL_END
