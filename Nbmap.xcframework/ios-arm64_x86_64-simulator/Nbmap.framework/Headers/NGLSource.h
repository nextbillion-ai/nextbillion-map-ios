#import <Foundation/Foundation.h>

#import "NGLFoundation.h"
#import "NGLTypes.h"

NS_ASSUME_NONNULL_BEGIN

FOUNDATION_EXTERN NGL_EXPORT NGLExceptionName const NGLInvalidStyleSourceException;

/**
 ``NGLSource`` is an abstract base class for map content sources. A map content
 source supplies content to be shown on the map. A source is added to an
 ``NGLStyle`` object along with an ``NGLStyle`` object. The
 foreground style layer defines the appearance of any content supplied by the
 source.

 Each source defined by the style JSON file is represented at runtime by an
 ``NGLSource`` object that you can use to refine the map’s content. You can also
 add and remove sources dynamically using methods such as
 ``NGLStyle/addSource:`` and ``NGLStyle/sourceWithIdentifier:``.

 Create instances of ``NGLShapeSource``, ``NGLShapeSource``,
 ``NGLImageSource``, and the concrete subclasses of ``NGLImageSource``
 (``NGLVectorTileSource`` and ``NGLRasterTileSource``) in order to use ``NGLRasterTileSource``’s
 properties and methods. Do not create instances of ``NGLSource`` directly, and do
 not create your own subclasses of this class.
 */
NGL_EXPORT
@interface NGLSource : NSObject

// MARK: Initializing a Source

- (instancetype)init __attribute__((unavailable("Use -initWithIdentifier: instead.")));

/**
 Returns a source initialized with an identifier.

 After initializing and configuring the source, add it to a map view’s style
 using the ``NGLStyle/addSource:`` method.

 @param identifier A string that uniquely identifies the source in the style to
    which it is added.
 @return An initialized source.
 */
- (instancetype)initWithIdentifier:(NSString *)identifier;

// MARK: Identifying a Source

/**
 A string that uniquely identifies the source in the style to which it is added.
 */
@property (nonatomic, copy) NSString *identifier;

@end

NS_ASSUME_NONNULL_END
