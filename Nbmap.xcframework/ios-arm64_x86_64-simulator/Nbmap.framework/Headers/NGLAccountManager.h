#import <Foundation/Foundation.h>

#import "NGLFoundation.h"
#import "NGLTileServerOptions.h"

NS_ASSUME_NONNULL_BEGIN

/**
 * Well-known tile servers enumeration
 * 
 * This enumeration defines the supported tile server providers that can be used
 * with the MapLibre Native SDK. The choice of tile server depends on the type
 * of access token you have available.
 */
typedef NS_ENUM(NSUInteger, NGLWellKnownTileServer) {
  /**
   * NextBillion MapTiler tile server
   *
   * Use this type when your access token only supports NextBillion MapTiler services.
   * MapTiler provides high-quality vector tiles with global coverage.
   * Requires a NextBillion MapTiler API key for authentication.
   */
  NGLMapTiler,

  /**
   * NextBillion TomTom tile server
   * 
   * Use this type when your access token supports NextBillion TomTom mapping services.
   * NextBillion provides mapping services powered by TomTom's infrastructure.
   * Offers global coverage with high performance and reliability.
   */
  NGLTomTom
};

/**
 * The ``NGLAccountManager`` object provides a global way to set SDK properties such
 * as apiKey, backend URL, etc.
 * 
 * This class serves as a centralized configuration manager for the MapLibre Native SDK.
 * It handles authentication, tile server configuration, and other global settings
 * that affect all map instances in your application.
 * 
 * @note This class uses class properties and methods, meaning all instances of
 *       ``NGLMapView`` in your application will share the same configuration.
 */
NGL_EXPORT
@interface NGLAccountManager : NSObject

// MARK: Tile Server Configuration

/**
 * Tile server options configuration
 * 
 * This property allows you to configure custom tile server settings including
 * the base URL, authentication headers, and other server-specific parameters.
 * 
 * @note Setting this property will override any well-known tile server configuration.
 * @see NGLTileServerOptions
 */
@property (class, copy, nullable) NGLTileServerOptions* tileServerOptions;

// MARK: Authorizing Access

/**
 * The API Key used by all instances of ``NGLMapView`` in the current application.
 * 
 * This property sets the authentication token required to access tile servers
 * and other mapping services. The API key is used for authentication and may
 * also be used for billing and usage tracking.
 * 
 * Setting this property to a value of `nil` has no effect.
 *
 * > Note: You must set the API key before attempting to load any style which
 *    requires the token. Therefore, you should generally set it before creating an instance of
 *    ``NGLMapView``. The recommended way to set an api key is to add an entry
 *    to your application's Info.plist file with the key `NBMapAccessKey``
 *    and the type `String`. Alternatively, you may call this method from your
 *    application delegate's `-applicationDidFinishLaunching:` method.
 * 
 * @see accessToken
 */
@property (class, copy, nullable) NSString* accessToken;

/**
 * The user identifier set by the application
 * 
 * This property allows you to set a custom user identifier that can be used
 * for analytics, billing, or user-specific features. This ID is typically
 * set by your application to identify the current user.
 * 
 * @note This is different from the auto-generated Nextbillion ID (nbId).
 * @see nbId
 */
@property (class, copy, nullable) NSString* userId;

/**
 * The Nextbillion ID (read-only, auto-generated)
 * 
 * This is an automatically generated unique identifier assigned by the Nextbillion
 * platform. It is used internally for tracking and analytics purposes.
 * 
 * @note This property is read-only and cannot be modified by the application.
 * @see userId
 */
@property (class, readonly, nullable) NSString* nbId;

/**
 * Dynamic API key header name for dynamic token scenarios
 * 
 * This property is used for dynamic API key scenarios where the NextBillion access token
 * changes dynamically. In normal circumstances, users do not need to set any value for
 * this parameter. Only when the user's NextBillion access token is dynamically changing,
 * all requests will dynamically include the token in the request header, and users need
 * to set this parameter to the key agreed upon with NextBillion services.
 * 
 * @note In most cases, this property should remain nil. Only set it when using
 *       dynamic token authentication with NextBillion services.
 */
@property (class, copy, nullable) NSString *apiKeyHeaderName;

/**
 * Cross-platform information string
 * 
 * This property allows you to set additional information that will be included
 * in API requests. This can be used to identify the platform, version, or
 * other application-specific information for analytics and debugging purposes.
 * 
 * @note The format and content of this string is application-specific.
 */
@property (class, copy, nullable) NSString *crossPlatformInfo;

// MARK: API Base URL Configuration

/**
 * Gets the current API base URL
 * 
 * Returns the base URL that is used for all API requests to the tile server.
 * This URL is typically set automatically when using a well-known tile server,
 * but can also be set manually for custom configurations.
 * 
 * @return The current API base URL, or nil if not configured
 * @see setAPIBaseURL:
 */
+ (nullable NSURL *)apiBaseURL;

/**
 * Sets the API base URL
 * 
 * This method allows you to set a custom base URL for API requests. This is
 * useful when using a custom tile server or when you need to route requests
 * through a proxy or custom endpoint.
 * 
 * @param apiBaseURL The new API base URL to use, or nil to clear the configuration
 * @see apiBaseURL
 */
+ (void)setAPIBaseURL:(nullable NSURL *)apiBaseURL;

/**
 * Switches the SDK to use a different well-known tile server
 * 
 * This method allows you to switch between different tile server configurations.
 * The SDK internally defaults to using `NGLTomTom`. If your API key doesn't support
 * NextBillion TomTom maps, you can use this method to switch to NextBillion MapTiler.
 * 
 * You can also use this method to switch tile servers during program execution,
 * but after calling this method, you must reinitialize any existing `NGLMapView` instances
 * for the changes to take effect.
 * 
 * @param tileServer The well-known tile server to switch to
 * @see NGLWellKnownTileServer
 */
+ (void)useWellKnownTileServer:(NGLWellKnownTileServer)tileServer;

@end

NS_ASSUME_NONNULL_END
