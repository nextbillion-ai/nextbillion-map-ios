#import <Foundation/Foundation.h>

#import "NGLFoundation.h"

NS_ASSUME_NONNULL_BEGIN

/**
 The ``NGLActionJournalOptions`` defines action journal properties such as path, log size, etc...
 */
NGL_EXPORT
@interface NGLActionJournalOptions : NSObject

/**
 * Enable/disable journal logging
 */
@property (nonatomic) BOOL enabled;

/**
 * Local file path.
 */
@property (nonatomic, nonnull) NSString* path;

/**
 * Log file size (total journal size is equal to `logFileSize * logFileCount`)
 */
@property (nonatomic) NSInteger logFileSize;

/**
 * Maximum number of log files
 */
@property (nonatomic) NSInteger logFileCount;

@end

NS_ASSUME_NONNULL_END
