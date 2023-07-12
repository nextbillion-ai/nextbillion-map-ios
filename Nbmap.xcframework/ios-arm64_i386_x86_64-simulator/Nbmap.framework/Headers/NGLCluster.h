#import "NGLFoundation.h"

@protocol NGLFeature;

NS_ASSUME_NONNULL_BEGIN

/**
 An `NSUInteger` constant used to indicate an invalid cluster identifier.
 This indicates a missing cluster feature.
 */
FOUNDATION_EXTERN NGL_EXPORT const NSUInteger NGLClusterIdentifierInvalid;

/**
 A protocol that feature subclasses (i.e. those already conforming to
 the `NGLFeature` protocol) conform to if they represent clusters.
 
 Currently the only class that conforms to `NGLCluster` is
 `NGLPointFeatureCluster` (a subclass of `NGLPointFeature`).
 
 To check if a feature is a cluster, check conformity to `NGLCluster`, for
 example:
 
 ```swift
 let shape = try! NGLShape(data: clusterShapeData, encoding: String.Encoding.utf8.rawValue)
 
 guard let pointFeature = shape as? NGLPointFeature else {
     throw ExampleError.unexpectedFeatureType
 }
 
 // Check for cluster conformance
 guard let cluster = pointFeature as? NGLCluster else {
     throw ExampleError.featureIsNotACluster
 }
 
 // Currently the only supported class that conforms to `NGLCluster` is
 // `NGLPointFeatureCluster`
 guard cluster is NGLPointFeatureCluster else {
     throw ExampleError.unexpectedFeatureType
 }
 ```
 */
NGL_EXPORT
@protocol NGLCluster <NGLFeature>

/** The identifier for the cluster. */
@property (nonatomic, readonly) NSUInteger clusterIdentifier;

/** The number of points within this cluster */
@property (nonatomic, readonly) NSUInteger clusterPointCount;

@end

NS_ASSUME_NONNULL_END
