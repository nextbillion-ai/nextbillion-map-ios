// This file is generated.
// Edit platform/darwin/scripts/generate-style-code.js, then run `make darwin-style-code`.
#pragma once

#include "NGLStyleLayer_Private.h"

#include <nbgl/layermanager/line_layer_factory.hpp>

namespace nbgl {

class LineStyleLayerPeerFactory : public LayerPeerFactory, public nbgl::LineLayerFactory {
    // LayerPeerFactory overrides.
    LayerFactory* getCoreLayerFactory() final { return this; }
    virtual NGLStyleLayer* createPeer(style::Layer*) final;
};

}  // namespace nbgl
