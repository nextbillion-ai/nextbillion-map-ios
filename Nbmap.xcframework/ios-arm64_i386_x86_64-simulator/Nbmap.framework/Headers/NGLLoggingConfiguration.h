#import <Foundation/Foundation.h>

#import "NGLFoundation.h"

#ifndef NGL_LOGGING_DISABLED
    #ifndef NGL_LOGGING_ENABLE_DEBUG
        #ifndef NDEBUG
            #define NGL_LOGGING_ENABLE_DEBUG 1
        #endif
    #endif

NS_ASSUME_NONNULL_BEGIN

/**
 Constants indicating the message's logging level.
 */
typedef NS_ENUM(NSInteger, NGLLoggingLevel) {
    /**
     None-level won't print any messages.
     */
    NGLLoggingLevelNone = 0,
    /**
     Fault-level messages contain system-level error information.
     */
    NGLLoggingLevelFault,
    /**
     Error-level messages contain information that is intended to aid in process-level
     errors.
    */
    NGLLoggingLevelError,
    /**
     Warning-level messages contain warning information for potential risks.
     */
    NGLLoggingLevelWarning,
    /**
     Info-level messages contain information that may be helpful for flow tracing
     but is not essential.
     */
    NGLLoggingLevelInfo,
    /**
     Debug-level messages contain information that may be helpful for troubleshooting
     specific problems.
     */
#if NGL_LOGGING_ENABLE_DEBUG
    NGLLoggingLevelDebug,
#endif
    /**
     Verbose-level will print all messages.
     */
    NGLLoggingLevelVerbose,
};

/**
 A block to be called once `loggingLevel` is set to a higher value than `NGLLoggingLevelNone`.
 
 @param loggingLevel The message logging level.
 @param filePath The description of the file and method for the calling message.
 @param line The line where the message is logged.
 @param message The logging message.
 */
typedef void (^NGLLoggingBlockHandler)(NGLLoggingLevel loggingLevel, NSString *filePath, NSUInteger line, NSString *message);

/**
 The `NGLLoggingConfiguration` object provides a global way to set this SDK logging levels
 and logging handler.
 */
NGL_EXPORT
@interface NGLLoggingConfiguration : NSObject

/**
 The handler this SDK uses to log messages.
 
 If this property is set to nil or if no custom handler is provided this property
 is set to the default handler.
 
 The default handler uses `os_log` and `NSLog` for iOS 10+ and iOS < 10 respectively.
 */
@property (nonatomic, copy, null_resettable) NGLLoggingBlockHandler handler;

/**
 The logging level.
 
 The default value is `NGLLoggingLevelNone`.
 
 Setting this property includes logging levels less than or equal to the setted value.
 */
@property (assign, nonatomic) NGLLoggingLevel loggingLevel;

/**
 Returns the shared logging object.
 */
@property (class, nonatomic, readonly) NGLLoggingConfiguration *sharedConfiguration;

- (NGLLoggingBlockHandler)handler UNAVAILABLE_ATTRIBUTE;

@end

NS_ASSUME_NONNULL_END
#endif
