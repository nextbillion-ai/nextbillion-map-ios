#import <Foundation/Foundation.h>

#import "NGLFoundation.h"
#import "NGLTileServerOptions.h"

NS_ASSUME_NONNULL_BEGIN

/**
 Well-known tile servers
 */
typedef NS_ENUM(NSUInteger, NGLWellKnownTileServer) {
  /**
   Maptiler
   */
  NGLMapTiler,
  /**
   MapLibre
   */
//  NGLMapLibre,
  /**
   Nextbillion
   */
  NGLTomTom
};

/**
 The ``NGLAccountManager`` object provides a global way to set SDK properties such
 as apiKey, backend URL, etc.
 */
NGL_EXPORT
@interface NGLAccountManager : NSObject

// MARK: Tile Server Configuration

/**
 Tile server options
 */
@property (class, copy, nullable) NGLTileServerOptions* tileServerOptions;

// MARK: Authorizing Access

/**
 The API Key used by all instances of ``NGLMapView`` in the current application.
 Setting this property to a value of `nil` has no effect.

 > Note: You must set the API key before attempting to load any style which
    requires the token. Therefore, you should generally set it before creating an instance of
    ``NGLMapView``. The recommended way to set an api key is to add an entry
    to your application's Info.plist file with the key `NBMapAccessKey``
    and the type `String`. Alternatively, you may call this method from your
    application delegate's `-applicationDidFinishLaunching:` method.
 */
@property (class, copy, nullable) NSString* accessToken;

/// The user id which user setted
@property (class, copy, nullable) NSString* userId;

/// The Nextbillion ID (read-only, auto-generated)
@property (class, readonly, nullable) NSString* nbId;

@property (class, copy, nullable) NSString *apiKeyHeaderName;


@property (class, copy, nullable) NSString *crossPlatformInfo;

/**
 Instructs the SDk to use the give tile server
 */
+ (void)useWellKnownTileServer:(NGLWellKnownTileServer)tileServer;

@end

NS_ASSUME_NONNULL_END
