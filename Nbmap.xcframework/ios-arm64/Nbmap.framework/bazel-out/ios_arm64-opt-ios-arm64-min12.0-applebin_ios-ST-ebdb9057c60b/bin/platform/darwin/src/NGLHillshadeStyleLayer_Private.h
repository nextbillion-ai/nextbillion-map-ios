// This file is generated.
// Edit platform/darwin/scripts/generate-style-code.js, then run `make darwin-style-code`.
#pragma once

#include "NGLStyleLayer_Private.h"

#include <nbgl/layermanager/hillshade_layer_factory.hpp>

namespace nbgl {

class HillshadeStyleLayerPeerFactory : public LayerPeerFactory, public nbgl::HillshadeLayerFactory {
    // LayerPeerFactory overrides.
    LayerFactory* getCoreLayerFactory() final { return this; }
    virtual NGLStyleLayer* createPeer(style::Layer*) final;
};

}  // namespace nbgl
