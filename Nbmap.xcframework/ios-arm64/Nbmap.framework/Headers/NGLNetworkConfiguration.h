#import <Foundation/Foundation.h>

#import "NGLFoundation.h"

NS_ASSUME_NONNULL_BEGIN

@class NGLNetworkConfiguration;

@protocol NGLNetworkConfigurationDelegate <NSObject>
@optional

/**
 :nodoc:
 Provides an `NSURLSession` object for the specified `NGLNetworkConfiguration`.
 This API should be considered experimental, likely to be removed or changed in
 future releases.

 This method is called from background threads, i.e. it is not called on the main
 thread.

 @note Background sessions (i.e. created with
 `-[NSURLSessionConfiguration backgroundSessionConfigurationWithIdentifier:]`)
 and sessions created with a delegate that conforms to `NSURLSessionDataDelegate`
 are not supported at this time.
 */
- (NSURLSession *)sessionForNetworkConfiguration:(NGLNetworkConfiguration *)configuration;
@end


/**
 The `NGLNetworkConfiguration` object provides a global way to set a base
 `NSURLSessionConfiguration`, and other resources.
 */
NGL_EXPORT
@interface NGLNetworkConfiguration : NSObject

/**
 :nodoc:
 Delegate for the `NGLNetworkConfiguration` class.
 */
@property (nonatomic, weak) id<NGLNetworkConfigurationDelegate> delegate;

/**
 Returns the shared instance of the `NGLNetworkConfiguration` class.
 */
@property (class, nonatomic, readonly) NGLNetworkConfiguration *sharedManager;

/**
 The session configuration object that is used by the `NSURLSession` objects
 in this SDK.
 
 If this property is set to nil or if no session configuration is provided this property
 is set to the default session configuration.
 
 Assign this object before instantiating any `NGLMapView` object, or using
 `NGLOfflineStorage`
 
 @note `NSURLSession` objects store a copy of this configuration. Any further changes
 to mutable properties on this configuration object passed to a session’s initializer
 will not affect the behavior of that session.

 @note Background sessions are not currently supported.
 */
@property (atomic, strong, null_resettable) NSURLSessionConfiguration *sessionConfiguration;

@end

NS_ASSUME_NONNULL_END
