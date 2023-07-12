#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>
#import "APIConstants.h"
#import "NBRoute.h"
#import "NBRouteResponse.h"
#import "DistanceMatrixResponse.h"
#import "SnapToRoadResponse.h"
#import "NGLFoundation.h"

NGL_EXPORT

@interface NBAPIClient : NSObject

- (void) buildParams: (NSString *) key value: (NSString *) value components:(NSMutableArray*) components;

- (void) getDirections:(const CLLocationCoordinate2D *) coords handler: (void(^)(NBDirectionResponse *)) handler;
- (void) getDirections:(const CLLocationCoordinate2D *) coords waypoints: (NSString*) waypoints handler: (void(^)(NBDirectionResponse *)) handler;
- (void) getDirections:(const CLLocationCoordinate2D *) coords waypoints: (NSString*) waypoints steps:(bool) steps alternatives: (bool)alternatives  altcount:(int) altcount  debug:(bool) debug handler: (void(^)(NBDirectionResponse *)) handler;
- (void) getDirections:(const CLLocationCoordinate2D *) coords waypointCoords: (CLLocationCoordinate2D *) waypoints waypointCount: (int) waypointCount handler: (void(^)(NBDirectionResponse *)) handler;
- (void) getDirections:(const CLLocationCoordinate2D *) coords waypointCoords: (CLLocationCoordinate2D*) waypoints waypointCount: (int) waypointCount steps:(bool) steps alternatives: (bool)alternatives  altcount:(int) altcount  debug:(bool) debug handler: (void(^)(NBDirectionResponse *)) handler;


- (void) getMatrix:(const CLLocationCoordinate2D *) origins originCount:(int) originCount destinations: (const CLLocationCoordinate2D *) destinations destCount:(int) destCount handler: (void(^)(DistanceMatrixResponse *)) handler;


- (void) getMatching:(NSArray *) path handler:(void(^)(SnapToRoadResponse *)) handler;

- (NSString*) getLocationString:(CLLocationCoordinate2D) location;

@property (nonatomic, copy) void (^completionHandler)(NBDirectionResponse *resp);
@property (nonatomic, copy) void (^matrixCompletionHandler)(DistanceMatrixResponse *resp);
@property (nonatomic, copy) void (^matchingCompletionHandler)(SnapToRoadResponse *resp);
@end
