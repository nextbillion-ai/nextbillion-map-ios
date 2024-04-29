
#import <Foundation/Foundation.h>
#import "NBLocation.h"

#ifndef NBSnappedPoint_h
#define NBSnappedPoint_h
#import "NGLFoundation.h"

NGL_EXPORT
@interface NBSnappedPoint : NSObject
-(instancetype)intiWithDictionary: (NSDictionary *) dict;
@property(nonatomic) double bearing;
@property(nonatomic) double distance;
@property(nonatomic) int originalIndex;
@property(nonatomic, copy) NSString *name;
@property(nonatomic, copy) NBLocation *location;
@end


#endif /* NBSnappedPoint_h */
