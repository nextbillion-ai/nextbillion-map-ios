// This file is generated.
// Edit platform/darwin/scripts/generate-style-code.js, then run `make darwin-style-code`.
#pragma once

#include "NGLStyleLayer_Private.h"

#include <nbgl/layermanager/raster_layer_factory.hpp>

namespace nbgl {

class RasterStyleLayerPeerFactory : public LayerPeerFactory, public nbgl::RasterLayerFactory {
    // LayerPeerFactory overrides.
    LayerFactory* getCoreLayerFactory() final { return this; }
    virtual NGLStyleLayer* createPeer(style::Layer*) final;
};

}  // namespace nbgl
