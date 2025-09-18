#if NGL_RENDER_BACKEND_METAL

#import <MetalKit/MetalKit.h>

@interface NGLBackendResource : NSObject

@property (nonatomic, strong) MTKView *mtkView;
@property (nonatomic, strong) id<MTLDevice> device;
@property (nonatomic, strong) MTLRenderPassDescriptor *renderPassDescriptor;
@property (nonatomic, strong) id<MTLCommandBuffer> commandBuffer;

- (instancetype)initWithMTKView:(MTKView *)mtkView
                         device:(id<MTLDevice>)device
           renderPassDescriptor:(MTLRenderPassDescriptor *)renderPassDescriptor
                  commandBuffer:(id<MTLCommandBuffer>)commandBuffer;

@end

#else

#import <Foundation/Foundation.h>
#import "NGLFoundation.h"

NGL_EXPORT
@interface NGLBackendResource : NSObject

@end

#endif
