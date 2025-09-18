// This file is generated.
// Edit platform/darwin/scripts/generate-style-code.js, then run `make darwin-style-code`.

#import "NGLSource.h"
#import "NSPredicate+NGLPrivateAdditions.h"
#import "NSDate+NGLAdditions.h"
#import "NGLStyleLayer_Private.h"
#import "NGLStyleValue_Private.h"
#import "NGLSymbolStyleLayer.h"
#import "NGLLoggingConfiguration_Private.h"
#import "NGLSymbolStyleLayer_Private.h"

#include <nbgl/style/layers/symbol_layer.hpp>
#include <nbgl/style/transition_options.hpp>


namespace nbgl {

    MBGL_DEFINE_ENUM(NGLIconAnchor, {
        { NGLIconAnchorCenter, "center" },
        { NGLIconAnchorLeft, "left" },
        { NGLIconAnchorRight, "right" },
        { NGLIconAnchorTop, "top" },
        { NGLIconAnchorBottom, "bottom" },
        { NGLIconAnchorTopLeft, "top-left" },
        { NGLIconAnchorTopRight, "top-right" },
        { NGLIconAnchorBottomLeft, "bottom-left" },
        { NGLIconAnchorBottomRight, "bottom-right" },
    });

    MBGL_DEFINE_ENUM(NGLIconPitchAlignment, {
        { NGLIconPitchAlignmentMap, "map" },
        { NGLIconPitchAlignmentViewport, "viewport" },
        { NGLIconPitchAlignmentAuto, "auto" },
    });

    MBGL_DEFINE_ENUM(NGLIconRotationAlignment, {
        { NGLIconRotationAlignmentMap, "map" },
        { NGLIconRotationAlignmentViewport, "viewport" },
        { NGLIconRotationAlignmentAuto, "auto" },
    });

    MBGL_DEFINE_ENUM(NGLIconTextFit, {
        { NGLIconTextFitNone, "none" },
        { NGLIconTextFitWidth, "width" },
        { NGLIconTextFitHeight, "height" },
        { NGLIconTextFitBoth, "both" },
    });

    MBGL_DEFINE_ENUM(NGLSymbolPlacement, {
        { NGLSymbolPlacementPoint, "point" },
        { NGLSymbolPlacementLine, "line" },
        { NGLSymbolPlacementLineCenter, "line-center" },
    });

    MBGL_DEFINE_ENUM(NGLSymbolZOrder, {
        { NGLSymbolZOrderAuto, "auto" },
        { NGLSymbolZOrderViewportY, "viewport-y" },
        { NGLSymbolZOrderSource, "source" },
    });

    MBGL_DEFINE_ENUM(NGLTextAnchor, {
        { NGLTextAnchorCenter, "center" },
        { NGLTextAnchorLeft, "left" },
        { NGLTextAnchorRight, "right" },
        { NGLTextAnchorTop, "top" },
        { NGLTextAnchorBottom, "bottom" },
        { NGLTextAnchorTopLeft, "top-left" },
        { NGLTextAnchorTopRight, "top-right" },
        { NGLTextAnchorBottomLeft, "bottom-left" },
        { NGLTextAnchorBottomRight, "bottom-right" },
    });

    MBGL_DEFINE_ENUM(NGLTextJustification, {
        { NGLTextJustificationAuto, "auto" },
        { NGLTextJustificationLeft, "left" },
        { NGLTextJustificationCenter, "center" },
        { NGLTextJustificationRight, "right" },
    });

    MBGL_DEFINE_ENUM(NGLTextPitchAlignment, {
        { NGLTextPitchAlignmentMap, "map" },
        { NGLTextPitchAlignmentViewport, "viewport" },
        { NGLTextPitchAlignmentAuto, "auto" },
    });

    MBGL_DEFINE_ENUM(NGLTextRotationAlignment, {
        { NGLTextRotationAlignmentMap, "map" },
        { NGLTextRotationAlignmentViewport, "viewport" },
        { NGLTextRotationAlignmentAuto, "auto" },
    });

    MBGL_DEFINE_ENUM(NGLTextTransform, {
        { NGLTextTransformNone, "none" },
        { NGLTextTransformUppercase, "uppercase" },
        { NGLTextTransformLowercase, "lowercase" },
    });

    MBGL_DEFINE_ENUM(NGLTextWritingMode, {
        { NGLTextWritingModeHorizontal, "horizontal" },
        { NGLTextWritingModeVertical, "vertical" },
    });

    MBGL_DEFINE_ENUM(NGLIconTranslationAnchor, {
        { NGLIconTranslationAnchorMap, "map" },
        { NGLIconTranslationAnchorViewport, "viewport" },
    });

    MBGL_DEFINE_ENUM(NGLTextTranslationAnchor, {
        { NGLTextTranslationAnchorMap, "map" },
        { NGLTextTranslationAnchorViewport, "viewport" },
    });

}

@interface NGLSymbolStyleLayer ()

@property (nonatomic, readonly) nbgl::style::SymbolLayer *rawLayer;

@end

@implementation NGLSymbolStyleLayer

- (instancetype)initWithIdentifier:(NSString *)identifier source:(NGLSource *)source
{
    NGLLogDebug(@"Initializing %@ with identifier: %@ source: %@", NSStringFromClass([self class]), identifier, source);
    auto layer = std::make_unique<nbgl::style::SymbolLayer>(identifier.UTF8String, source.identifier.UTF8String);
    return self = [super initWithPendingLayer:std::move(layer)];
}

- (nbgl::style::SymbolLayer *)rawLayer
{
    return (nbgl::style::SymbolLayer *)super.rawLayer;
}

- (NSString *)sourceIdentifier
{
    NGLAssertStyleLayerIsValid();

    return @(self.rawLayer->getSourceID().c_str());
}

- (NSString *)sourceLayerIdentifier
{
    NGLAssertStyleLayerIsValid();

    auto layerID = self.rawLayer->getSourceLayer();
    return layerID.empty() ? nil : @(layerID.c_str());
}

- (void)setSourceLayerIdentifier:(NSString *)sourceLayerIdentifier
{
    NGLAssertStyleLayerIsValid();
    NGLLogDebug(@"Setting sourceLayerIdentifier: %@", sourceLayerIdentifier);

    self.rawLayer->setSourceLayer(sourceLayerIdentifier.UTF8String ?: "");
}

- (void)setPredicate:(NSPredicate *)predicate
{
    NGLAssertStyleLayerIsValid();
    NGLLogDebug(@"Setting predicate: %@", predicate);

    self.rawLayer->setFilter(predicate ? predicate.ngl_filter : nbgl::style::Filter());
}

- (NSPredicate *)predicate
{
    NGLAssertStyleLayerIsValid();

    return [NSPredicate ngl_predicateWithFilter:self.rawLayer->getFilter()];
}

// MARK: - Accessing the Layout Attributes

- (void)setIconAllowsOverlap:(NSExpression *)iconAllowsOverlap {
    NGLAssertStyleLayerIsValid();
    NGLLogDebug(@"Setting iconAllowsOverlap: %@", iconAllowsOverlap);

    auto nbglValue = NGLStyleValueTransformer<bool, NSNumber *>().toPropertyValue<nbgl::style::PropertyValue<bool>>(iconAllowsOverlap, false);
    self.rawLayer->setIconAllowOverlap(nbglValue);
}

- (NSExpression *)iconAllowsOverlap {
    NGLAssertStyleLayerIsValid();

    auto propertyValue = self.rawLayer->getIconAllowOverlap();
    if (propertyValue.isUndefined()) {
        propertyValue = self.rawLayer->getDefaultIconAllowOverlap();
    }
    return NGLStyleValueTransformer<bool, NSNumber *>().toExpression(propertyValue);
}

- (void)setIconAllowOverlap:(NSExpression *)iconAllowOverlap {
}

- (NSExpression *)iconAllowOverlap {
    return self.iconAllowsOverlap;
}

- (void)setIconAnchor:(NSExpression *)iconAnchor {
    NGLAssertStyleLayerIsValid();
    NGLLogDebug(@"Setting iconAnchor: %@", iconAnchor);

    auto nbglValue = NGLStyleValueTransformer<nbgl::style::SymbolAnchorType, NSValue *, nbgl::style::SymbolAnchorType, NGLIconAnchor>().toPropertyValue<nbgl::style::PropertyValue<nbgl::style::SymbolAnchorType>>(iconAnchor, true);
    self.rawLayer->setIconAnchor(nbglValue);
}

- (NSExpression *)iconAnchor {
    NGLAssertStyleLayerIsValid();

    auto propertyValue = self.rawLayer->getIconAnchor();
    if (propertyValue.isUndefined()) {
        propertyValue = self.rawLayer->getDefaultIconAnchor();
    }
    return NGLStyleValueTransformer<nbgl::style::SymbolAnchorType, NSValue *, nbgl::style::SymbolAnchorType, NGLIconAnchor>().toExpression(propertyValue);
}

- (void)setIconIgnoresPlacement:(NSExpression *)iconIgnoresPlacement {
    NGLAssertStyleLayerIsValid();
    NGLLogDebug(@"Setting iconIgnoresPlacement: %@", iconIgnoresPlacement);

    auto nbglValue = NGLStyleValueTransformer<bool, NSNumber *>().toPropertyValue<nbgl::style::PropertyValue<bool>>(iconIgnoresPlacement, false);
    self.rawLayer->setIconIgnorePlacement(nbglValue);
}

- (NSExpression *)iconIgnoresPlacement {
    NGLAssertStyleLayerIsValid();

    auto propertyValue = self.rawLayer->getIconIgnorePlacement();
    if (propertyValue.isUndefined()) {
        propertyValue = self.rawLayer->getDefaultIconIgnorePlacement();
    }
    return NGLStyleValueTransformer<bool, NSNumber *>().toExpression(propertyValue);
}

- (void)setIconIgnorePlacement:(NSExpression *)iconIgnorePlacement {
}

- (NSExpression *)iconIgnorePlacement {
    return self.iconIgnoresPlacement;
}

- (void)setIconImageName:(NSExpression *)iconImageName {
    NGLAssertStyleLayerIsValid();
    NGLLogDebug(@"Setting iconImageName: %@", iconImageName);

    if (iconImageName && iconImageName.expressionType == NSConstantValueExpressionType) {
        std::string string = ((NSString *)iconImageName.constantValue).UTF8String;
        if (nbgl::style::conversion::hasTokens(string)) {
            self.rawLayer->setIconImage(nbgl::style::PropertyValue<nbgl::style::expression::Image>(
                nbgl::style::conversion::convertTokenStringToImageExpression(string)));
            return;
        }
    }
    auto nbglValue = NGLStyleValueTransformer<nbgl::style::expression::Image, NSString *>().toPropertyValue<nbgl::style::PropertyValue<nbgl::style::expression::Image>>(iconImageName, true);
    self.rawLayer->setIconImage(nbglValue);
}

- (NSExpression *)iconImageName {
    NGLAssertStyleLayerIsValid();

    auto propertyValue = self.rawLayer->getIconImage();
    if (propertyValue.isUndefined()) {
        propertyValue = self.rawLayer->getDefaultIconImage();
    }
    return NGLStyleValueTransformer<nbgl::style::expression::Image, NSString *>().toExpression(propertyValue);
}

- (void)setIconImage:(NSExpression *)iconImage {
}

- (NSExpression *)iconImage {
    return self.iconImageName;
}

- (void)setIconOffset:(NSExpression *)iconOffset {
    NGLAssertStyleLayerIsValid();
    NGLLogDebug(@"Setting iconOffset: %@", iconOffset);

    auto nbglValue = NGLStyleValueTransformer<std::array<float, 2>, NSValue *>().toPropertyValue<nbgl::style::PropertyValue<std::array<float, 2>>>(iconOffset, true);
    self.rawLayer->setIconOffset(nbglValue);
}

- (NSExpression *)iconOffset {
    NGLAssertStyleLayerIsValid();

    auto propertyValue = self.rawLayer->getIconOffset();
    if (propertyValue.isUndefined()) {
        propertyValue = self.rawLayer->getDefaultIconOffset();
    }
    return NGLStyleValueTransformer<std::array<float, 2>, NSValue *>().toExpression(propertyValue);
}

- (void)setIconOptional:(NSExpression *)iconOptional {
    NGLAssertStyleLayerIsValid();
    NGLLogDebug(@"Setting iconOptional: %@", iconOptional);

    auto nbglValue = NGLStyleValueTransformer<bool, NSNumber *>().toPropertyValue<nbgl::style::PropertyValue<bool>>(iconOptional, false);
    self.rawLayer->setIconOptional(nbglValue);
}

- (NSExpression *)isIconOptional {
    NGLAssertStyleLayerIsValid();

    auto propertyValue = self.rawLayer->getIconOptional();
    if (propertyValue.isUndefined()) {
        propertyValue = self.rawLayer->getDefaultIconOptional();
    }
    return NGLStyleValueTransformer<bool, NSNumber *>().toExpression(propertyValue);
}

- (void)setIconPadding:(NSExpression *)iconPadding {
    NGLAssertStyleLayerIsValid();
    NGLLogDebug(@"Setting iconPadding: %@", iconPadding);

    auto nbglValue = NGLStyleValueTransformer<nbgl::Padding, NSValue *>().toPropertyValue<nbgl::style::PropertyValue<nbgl::Padding>>(iconPadding, true);
    self.rawLayer->setIconPadding(nbglValue);
}

- (NSExpression *)iconPadding {
    NGLAssertStyleLayerIsValid();

    auto propertyValue = self.rawLayer->getIconPadding();
    if (propertyValue.isUndefined()) {
        propertyValue = self.rawLayer->getDefaultIconPadding();
    }
    return NGLStyleValueTransformer<nbgl::Padding, NSValue *>().toExpression(propertyValue);
}

- (void)setIconPitchAlignment:(NSExpression *)iconPitchAlignment {
    NGLAssertStyleLayerIsValid();
    NGLLogDebug(@"Setting iconPitchAlignment: %@", iconPitchAlignment);

    auto nbglValue = NGLStyleValueTransformer<nbgl::style::AlignmentType, NSValue *, nbgl::style::AlignmentType, NGLIconPitchAlignment>().toPropertyValue<nbgl::style::PropertyValue<nbgl::style::AlignmentType>>(iconPitchAlignment, false);
    self.rawLayer->setIconPitchAlignment(nbglValue);
}

- (NSExpression *)iconPitchAlignment {
    NGLAssertStyleLayerIsValid();

    auto propertyValue = self.rawLayer->getIconPitchAlignment();
    if (propertyValue.isUndefined()) {
        propertyValue = self.rawLayer->getDefaultIconPitchAlignment();
    }
    return NGLStyleValueTransformer<nbgl::style::AlignmentType, NSValue *, nbgl::style::AlignmentType, NGLIconPitchAlignment>().toExpression(propertyValue);
}

- (void)setIconRotation:(NSExpression *)iconRotation {
    NGLAssertStyleLayerIsValid();
    NGLLogDebug(@"Setting iconRotation: %@", iconRotation);

    auto nbglValue = NGLStyleValueTransformer<float, NSNumber *>().toPropertyValue<nbgl::style::PropertyValue<float>>(iconRotation, true);
    self.rawLayer->setIconRotate(nbglValue);
}

- (NSExpression *)iconRotation {
    NGLAssertStyleLayerIsValid();

    auto propertyValue = self.rawLayer->getIconRotate();
    if (propertyValue.isUndefined()) {
        propertyValue = self.rawLayer->getDefaultIconRotate();
    }
    return NGLStyleValueTransformer<float, NSNumber *>().toExpression(propertyValue);
}

- (void)setIconRotate:(NSExpression *)iconRotate {
}

- (NSExpression *)iconRotate {
    return self.iconRotation;
}

- (void)setIconRotationAlignment:(NSExpression *)iconRotationAlignment {
    NGLAssertStyleLayerIsValid();
    NGLLogDebug(@"Setting iconRotationAlignment: %@", iconRotationAlignment);

    auto nbglValue = NGLStyleValueTransformer<nbgl::style::AlignmentType, NSValue *, nbgl::style::AlignmentType, NGLIconRotationAlignment>().toPropertyValue<nbgl::style::PropertyValue<nbgl::style::AlignmentType>>(iconRotationAlignment, false);
    self.rawLayer->setIconRotationAlignment(nbglValue);
}

- (NSExpression *)iconRotationAlignment {
    NGLAssertStyleLayerIsValid();

    auto propertyValue = self.rawLayer->getIconRotationAlignment();
    if (propertyValue.isUndefined()) {
        propertyValue = self.rawLayer->getDefaultIconRotationAlignment();
    }
    return NGLStyleValueTransformer<nbgl::style::AlignmentType, NSValue *, nbgl::style::AlignmentType, NGLIconRotationAlignment>().toExpression(propertyValue);
}

- (void)setIconScale:(NSExpression *)iconScale {
    NGLAssertStyleLayerIsValid();
    NGLLogDebug(@"Setting iconScale: %@", iconScale);

    auto nbglValue = NGLStyleValueTransformer<float, NSNumber *>().toPropertyValue<nbgl::style::PropertyValue<float>>(iconScale, true);
    self.rawLayer->setIconSize(nbglValue);
}

- (NSExpression *)iconScale {
    NGLAssertStyleLayerIsValid();

    auto propertyValue = self.rawLayer->getIconSize();
    if (propertyValue.isUndefined()) {
        propertyValue = self.rawLayer->getDefaultIconSize();
    }
    return NGLStyleValueTransformer<float, NSNumber *>().toExpression(propertyValue);
}

- (void)setIconSize:(NSExpression *)iconSize {
}

- (NSExpression *)iconSize {
    return self.iconScale;
}

- (void)setIconTextFit:(NSExpression *)iconTextFit {
    NGLAssertStyleLayerIsValid();
    NGLLogDebug(@"Setting iconTextFit: %@", iconTextFit);

    auto nbglValue = NGLStyleValueTransformer<nbgl::style::IconTextFitType, NSValue *, nbgl::style::IconTextFitType, NGLIconTextFit>().toPropertyValue<nbgl::style::PropertyValue<nbgl::style::IconTextFitType>>(iconTextFit, false);
    self.rawLayer->setIconTextFit(nbglValue);
}

- (NSExpression *)iconTextFit {
    NGLAssertStyleLayerIsValid();

    auto propertyValue = self.rawLayer->getIconTextFit();
    if (propertyValue.isUndefined()) {
        propertyValue = self.rawLayer->getDefaultIconTextFit();
    }
    return NGLStyleValueTransformer<nbgl::style::IconTextFitType, NSValue *, nbgl::style::IconTextFitType, NGLIconTextFit>().toExpression(propertyValue);
}

- (void)setIconTextFitPadding:(NSExpression *)iconTextFitPadding {
    NGLAssertStyleLayerIsValid();
    NGLLogDebug(@"Setting iconTextFitPadding: %@", iconTextFitPadding);

    auto nbglValue = NGLStyleValueTransformer<std::array<float, 4>, NSValue *>().toPropertyValue<nbgl::style::PropertyValue<std::array<float, 4>>>(iconTextFitPadding, false);
    self.rawLayer->setIconTextFitPadding(nbglValue);
}

- (NSExpression *)iconTextFitPadding {
    NGLAssertStyleLayerIsValid();

    auto propertyValue = self.rawLayer->getIconTextFitPadding();
    if (propertyValue.isUndefined()) {
        propertyValue = self.rawLayer->getDefaultIconTextFitPadding();
    }
    return NGLStyleValueTransformer<std::array<float, 4>, NSValue *>().toExpression(propertyValue);
}

- (void)setKeepsIconUpright:(NSExpression *)keepsIconUpright {
    NGLAssertStyleLayerIsValid();
    NGLLogDebug(@"Setting keepsIconUpright: %@", keepsIconUpright);

    auto nbglValue = NGLStyleValueTransformer<bool, NSNumber *>().toPropertyValue<nbgl::style::PropertyValue<bool>>(keepsIconUpright, false);
    self.rawLayer->setIconKeepUpright(nbglValue);
}

- (NSExpression *)keepsIconUpright {
    NGLAssertStyleLayerIsValid();

    auto propertyValue = self.rawLayer->getIconKeepUpright();
    if (propertyValue.isUndefined()) {
        propertyValue = self.rawLayer->getDefaultIconKeepUpright();
    }
    return NGLStyleValueTransformer<bool, NSNumber *>().toExpression(propertyValue);
}

- (void)setIconKeepUpright:(NSExpression *)iconKeepUpright {
}

- (NSExpression *)iconKeepUpright {
    return self.keepsIconUpright;
}

- (void)setKeepsTextUpright:(NSExpression *)keepsTextUpright {
    NGLAssertStyleLayerIsValid();
    NGLLogDebug(@"Setting keepsTextUpright: %@", keepsTextUpright);

    auto nbglValue = NGLStyleValueTransformer<bool, NSNumber *>().toPropertyValue<nbgl::style::PropertyValue<bool>>(keepsTextUpright, false);
    self.rawLayer->setTextKeepUpright(nbglValue);
}

- (NSExpression *)keepsTextUpright {
    NGLAssertStyleLayerIsValid();

    auto propertyValue = self.rawLayer->getTextKeepUpright();
    if (propertyValue.isUndefined()) {
        propertyValue = self.rawLayer->getDefaultTextKeepUpright();
    }
    return NGLStyleValueTransformer<bool, NSNumber *>().toExpression(propertyValue);
}

- (void)setTextKeepUpright:(NSExpression *)textKeepUpright {
}

- (NSExpression *)textKeepUpright {
    return self.keepsTextUpright;
}

- (void)setMaximumTextAngle:(NSExpression *)maximumTextAngle {
    NGLAssertStyleLayerIsValid();
    NGLLogDebug(@"Setting maximumTextAngle: %@", maximumTextAngle);

    auto nbglValue = NGLStyleValueTransformer<float, NSNumber *>().toPropertyValue<nbgl::style::PropertyValue<float>>(maximumTextAngle, false);
    self.rawLayer->setTextMaxAngle(nbglValue);
}

- (NSExpression *)maximumTextAngle {
    NGLAssertStyleLayerIsValid();

    auto propertyValue = self.rawLayer->getTextMaxAngle();
    if (propertyValue.isUndefined()) {
        propertyValue = self.rawLayer->getDefaultTextMaxAngle();
    }
    return NGLStyleValueTransformer<float, NSNumber *>().toExpression(propertyValue);
}

- (void)setTextMaxAngle:(NSExpression *)textMaxAngle {
}

- (NSExpression *)textMaxAngle {
    return self.maximumTextAngle;
}

- (void)setMaximumTextWidth:(NSExpression *)maximumTextWidth {
    NGLAssertStyleLayerIsValid();
    NGLLogDebug(@"Setting maximumTextWidth: %@", maximumTextWidth);

    auto nbglValue = NGLStyleValueTransformer<float, NSNumber *>().toPropertyValue<nbgl::style::PropertyValue<float>>(maximumTextWidth, true);
    self.rawLayer->setTextMaxWidth(nbglValue);
}

- (NSExpression *)maximumTextWidth {
    NGLAssertStyleLayerIsValid();

    auto propertyValue = self.rawLayer->getTextMaxWidth();
    if (propertyValue.isUndefined()) {
        propertyValue = self.rawLayer->getDefaultTextMaxWidth();
    }
    return NGLStyleValueTransformer<float, NSNumber *>().toExpression(propertyValue);
}

- (void)setTextMaxWidth:(NSExpression *)textMaxWidth {
}

- (NSExpression *)textMaxWidth {
    return self.maximumTextWidth;
}

- (void)setSymbolAvoidsEdges:(NSExpression *)symbolAvoidsEdges {
    NGLAssertStyleLayerIsValid();
    NGLLogDebug(@"Setting symbolAvoidsEdges: %@", symbolAvoidsEdges);

    auto nbglValue = NGLStyleValueTransformer<bool, NSNumber *>().toPropertyValue<nbgl::style::PropertyValue<bool>>(symbolAvoidsEdges, false);
    self.rawLayer->setSymbolAvoidEdges(nbglValue);
}

- (NSExpression *)symbolAvoidsEdges {
    NGLAssertStyleLayerIsValid();

    auto propertyValue = self.rawLayer->getSymbolAvoidEdges();
    if (propertyValue.isUndefined()) {
        propertyValue = self.rawLayer->getDefaultSymbolAvoidEdges();
    }
    return NGLStyleValueTransformer<bool, NSNumber *>().toExpression(propertyValue);
}

- (void)setSymbolAvoidEdges:(NSExpression *)symbolAvoidEdges {
}

- (NSExpression *)symbolAvoidEdges {
    return self.symbolAvoidsEdges;
}

- (void)setSymbolPlacement:(NSExpression *)symbolPlacement {
    NGLAssertStyleLayerIsValid();
    NGLLogDebug(@"Setting symbolPlacement: %@", symbolPlacement);

    auto nbglValue = NGLStyleValueTransformer<nbgl::style::SymbolPlacementType, NSValue *, nbgl::style::SymbolPlacementType, NGLSymbolPlacement>().toPropertyValue<nbgl::style::PropertyValue<nbgl::style::SymbolPlacementType>>(symbolPlacement, false);
    self.rawLayer->setSymbolPlacement(nbglValue);
}

- (NSExpression *)symbolPlacement {
    NGLAssertStyleLayerIsValid();

    auto propertyValue = self.rawLayer->getSymbolPlacement();
    if (propertyValue.isUndefined()) {
        propertyValue = self.rawLayer->getDefaultSymbolPlacement();
    }
    return NGLStyleValueTransformer<nbgl::style::SymbolPlacementType, NSValue *, nbgl::style::SymbolPlacementType, NGLSymbolPlacement>().toExpression(propertyValue);
}

- (void)setSymbolScreenSpace:(NSExpression *)symbolScreenSpace {
    NGLAssertStyleLayerIsValid();
    NGLLogDebug(@"Setting symbolScreenSpace: %@", symbolScreenSpace);

    auto nbglValue = NGLStyleValueTransformer<bool, NSNumber *>().toPropertyValue<nbgl::style::PropertyValue<bool>>(symbolScreenSpace, false);
    self.rawLayer->setSymbolScreenSpace(nbglValue);
}

- (NSExpression *)symbolScreenSpace {
    NGLAssertStyleLayerIsValid();

    auto propertyValue = self.rawLayer->getSymbolScreenSpace();
    if (propertyValue.isUndefined()) {
        propertyValue = self.rawLayer->getDefaultSymbolScreenSpace();
    }
    return NGLStyleValueTransformer<bool, NSNumber *>().toExpression(propertyValue);
}

- (void)setSymbolSortKey:(NSExpression *)symbolSortKey {
    NGLAssertStyleLayerIsValid();
    NGLLogDebug(@"Setting symbolSortKey: %@", symbolSortKey);

    auto nbglValue = NGLStyleValueTransformer<float, NSNumber *>().toPropertyValue<nbgl::style::PropertyValue<float>>(symbolSortKey, true);
    self.rawLayer->setSymbolSortKey(nbglValue);
}

- (NSExpression *)symbolSortKey {
    NGLAssertStyleLayerIsValid();

    auto propertyValue = self.rawLayer->getSymbolSortKey();
    if (propertyValue.isUndefined()) {
        propertyValue = self.rawLayer->getDefaultSymbolSortKey();
    }
    return NGLStyleValueTransformer<float, NSNumber *>().toExpression(propertyValue);
}

- (void)setSymbolSpacing:(NSExpression *)symbolSpacing {
    NGLAssertStyleLayerIsValid();
    NGLLogDebug(@"Setting symbolSpacing: %@", symbolSpacing);

    auto nbglValue = NGLStyleValueTransformer<float, NSNumber *>().toPropertyValue<nbgl::style::PropertyValue<float>>(symbolSpacing, false);
    self.rawLayer->setSymbolSpacing(nbglValue);
}

- (NSExpression *)symbolSpacing {
    NGLAssertStyleLayerIsValid();

    auto propertyValue = self.rawLayer->getSymbolSpacing();
    if (propertyValue.isUndefined()) {
        propertyValue = self.rawLayer->getDefaultSymbolSpacing();
    }
    return NGLStyleValueTransformer<float, NSNumber *>().toExpression(propertyValue);
}

- (void)setSymbolZOrder:(NSExpression *)symbolZOrder {
    NGLAssertStyleLayerIsValid();
    NGLLogDebug(@"Setting symbolZOrder: %@", symbolZOrder);

    auto nbglValue = NGLStyleValueTransformer<nbgl::style::SymbolZOrderType, NSValue *, nbgl::style::SymbolZOrderType, NGLSymbolZOrder>().toPropertyValue<nbgl::style::PropertyValue<nbgl::style::SymbolZOrderType>>(symbolZOrder, false);
    self.rawLayer->setSymbolZOrder(nbglValue);
}

- (NSExpression *)symbolZOrder {
    NGLAssertStyleLayerIsValid();

    auto propertyValue = self.rawLayer->getSymbolZOrder();
    if (propertyValue.isUndefined()) {
        propertyValue = self.rawLayer->getDefaultSymbolZOrder();
    }
    return NGLStyleValueTransformer<nbgl::style::SymbolZOrderType, NSValue *, nbgl::style::SymbolZOrderType, NGLSymbolZOrder>().toExpression(propertyValue);
}

- (void)setText:(NSExpression *)text {
    NGLAssertStyleLayerIsValid();
    NGLLogDebug(@"Setting text: %@", text);

    if (text && text.expressionType == NSConstantValueExpressionType) {
        std::string string = ((NSString *)text.constantValue).UTF8String;
        if (nbgl::style::conversion::hasTokens(string)) {
            self.rawLayer->setTextField(nbgl::style::PropertyValue<nbgl::style::expression::Formatted>(
                nbgl::style::conversion::convertTokenStringToFormatExpression(string)));
            return;
        }
    }
    auto nbglValue = NGLStyleValueTransformer<nbgl::style::expression::Formatted, NSString *>().toPropertyValue<nbgl::style::PropertyValue<nbgl::style::expression::Formatted>>(text, true);
    self.rawLayer->setTextField(nbglValue);
}

- (NSExpression *)text {
    NGLAssertStyleLayerIsValid();

    auto propertyValue = self.rawLayer->getTextField();
    if (propertyValue.isUndefined()) {
        propertyValue = self.rawLayer->getDefaultTextField();
    }
    return NGLStyleValueTransformer<nbgl::style::expression::Formatted, NSString *>().toExpression(propertyValue);
}

- (void)setTextField:(NSExpression *)textField {
}

- (NSExpression *)textField {
    return self.text;
}

- (void)setTextAllowsOverlap:(NSExpression *)textAllowsOverlap {
    NGLAssertStyleLayerIsValid();
    NGLLogDebug(@"Setting textAllowsOverlap: %@", textAllowsOverlap);

    auto nbglValue = NGLStyleValueTransformer<bool, NSNumber *>().toPropertyValue<nbgl::style::PropertyValue<bool>>(textAllowsOverlap, false);
    self.rawLayer->setTextAllowOverlap(nbglValue);
}

- (NSExpression *)textAllowsOverlap {
    NGLAssertStyleLayerIsValid();

    auto propertyValue = self.rawLayer->getTextAllowOverlap();
    if (propertyValue.isUndefined()) {
        propertyValue = self.rawLayer->getDefaultTextAllowOverlap();
    }
    return NGLStyleValueTransformer<bool, NSNumber *>().toExpression(propertyValue);
}

- (void)setTextAllowOverlap:(NSExpression *)textAllowOverlap {
}

- (NSExpression *)textAllowOverlap {
    return self.textAllowsOverlap;
}

- (void)setTextAnchor:(NSExpression *)textAnchor {
    NGLAssertStyleLayerIsValid();
    NGLLogDebug(@"Setting textAnchor: %@", textAnchor);

    auto nbglValue = NGLStyleValueTransformer<nbgl::style::SymbolAnchorType, NSValue *, nbgl::style::SymbolAnchorType, NGLTextAnchor>().toPropertyValue<nbgl::style::PropertyValue<nbgl::style::SymbolAnchorType>>(textAnchor, true);
    self.rawLayer->setTextAnchor(nbglValue);
}

- (NSExpression *)textAnchor {
    NGLAssertStyleLayerIsValid();

    auto propertyValue = self.rawLayer->getTextAnchor();
    if (propertyValue.isUndefined()) {
        propertyValue = self.rawLayer->getDefaultTextAnchor();
    }
    return NGLStyleValueTransformer<nbgl::style::SymbolAnchorType, NSValue *, nbgl::style::SymbolAnchorType, NGLTextAnchor>().toExpression(propertyValue);
}

- (void)setTextFontNames:(NSExpression *)textFontNames {
    NGLAssertStyleLayerIsValid();
    NGLLogDebug(@"Setting textFontNames: %@", textFontNames);

    auto nbglValue = NGLStyleValueTransformer<std::vector<std::string>, NSArray<NSString *> *, std::string>().toPropertyValue<nbgl::style::PropertyValue<std::vector<std::string>>>(textFontNames, true);
    self.rawLayer->setTextFont(nbglValue);
}

- (NSExpression *)textFontNames {
    NGLAssertStyleLayerIsValid();

    auto propertyValue = self.rawLayer->getTextFont();
    if (propertyValue.isUndefined()) {
        propertyValue = self.rawLayer->getDefaultTextFont();
    }
    return NGLStyleValueTransformer<std::vector<std::string>, NSArray<NSString *> *, std::string>().toExpression(propertyValue);
}

- (void)setTextFont:(NSExpression *)textFont {
}

- (NSExpression *)textFont {
    return self.textFontNames;
}

- (void)setTextFontSize:(NSExpression *)textFontSize {
    NGLAssertStyleLayerIsValid();
    NGLLogDebug(@"Setting textFontSize: %@", textFontSize);

    auto nbglValue = NGLStyleValueTransformer<float, NSNumber *>().toPropertyValue<nbgl::style::PropertyValue<float>>(textFontSize, true);
    self.rawLayer->setTextSize(nbglValue);
}

- (NSExpression *)textFontSize {
    NGLAssertStyleLayerIsValid();

    auto propertyValue = self.rawLayer->getTextSize();
    if (propertyValue.isUndefined()) {
        propertyValue = self.rawLayer->getDefaultTextSize();
    }
    return NGLStyleValueTransformer<float, NSNumber *>().toExpression(propertyValue);
}

- (void)setTextSize:(NSExpression *)textSize {
}

- (NSExpression *)textSize {
    return self.textFontSize;
}

- (void)setTextIgnoresPlacement:(NSExpression *)textIgnoresPlacement {
    NGLAssertStyleLayerIsValid();
    NGLLogDebug(@"Setting textIgnoresPlacement: %@", textIgnoresPlacement);

    auto nbglValue = NGLStyleValueTransformer<bool, NSNumber *>().toPropertyValue<nbgl::style::PropertyValue<bool>>(textIgnoresPlacement, false);
    self.rawLayer->setTextIgnorePlacement(nbglValue);
}

- (NSExpression *)textIgnoresPlacement {
    NGLAssertStyleLayerIsValid();

    auto propertyValue = self.rawLayer->getTextIgnorePlacement();
    if (propertyValue.isUndefined()) {
        propertyValue = self.rawLayer->getDefaultTextIgnorePlacement();
    }
    return NGLStyleValueTransformer<bool, NSNumber *>().toExpression(propertyValue);
}

- (void)setTextIgnorePlacement:(NSExpression *)textIgnorePlacement {
}

- (NSExpression *)textIgnorePlacement {
    return self.textIgnoresPlacement;
}

- (void)setTextJustification:(NSExpression *)textJustification {
    NGLAssertStyleLayerIsValid();
    NGLLogDebug(@"Setting textJustification: %@", textJustification);

    auto nbglValue = NGLStyleValueTransformer<nbgl::style::TextJustifyType, NSValue *, nbgl::style::TextJustifyType, NGLTextJustification>().toPropertyValue<nbgl::style::PropertyValue<nbgl::style::TextJustifyType>>(textJustification, true);
    self.rawLayer->setTextJustify(nbglValue);
}

- (NSExpression *)textJustification {
    NGLAssertStyleLayerIsValid();

    auto propertyValue = self.rawLayer->getTextJustify();
    if (propertyValue.isUndefined()) {
        propertyValue = self.rawLayer->getDefaultTextJustify();
    }
    return NGLStyleValueTransformer<nbgl::style::TextJustifyType, NSValue *, nbgl::style::TextJustifyType, NGLTextJustification>().toExpression(propertyValue);
}

- (void)setTextJustify:(NSExpression *)textJustify {
}

- (NSExpression *)textJustify {
    return self.textJustification;
}

- (void)setTextLetterSpacing:(NSExpression *)textLetterSpacing {
    NGLAssertStyleLayerIsValid();
    NGLLogDebug(@"Setting textLetterSpacing: %@", textLetterSpacing);

    auto nbglValue = NGLStyleValueTransformer<float, NSNumber *>().toPropertyValue<nbgl::style::PropertyValue<float>>(textLetterSpacing, true);
    self.rawLayer->setTextLetterSpacing(nbglValue);
}

- (NSExpression *)textLetterSpacing {
    NGLAssertStyleLayerIsValid();

    auto propertyValue = self.rawLayer->getTextLetterSpacing();
    if (propertyValue.isUndefined()) {
        propertyValue = self.rawLayer->getDefaultTextLetterSpacing();
    }
    return NGLStyleValueTransformer<float, NSNumber *>().toExpression(propertyValue);
}

- (void)setTextLineHeight:(NSExpression *)textLineHeight {
    NGLAssertStyleLayerIsValid();
    NGLLogDebug(@"Setting textLineHeight: %@", textLineHeight);

    auto nbglValue = NGLStyleValueTransformer<float, NSNumber *>().toPropertyValue<nbgl::style::PropertyValue<float>>(textLineHeight, false);
    self.rawLayer->setTextLineHeight(nbglValue);
}

- (NSExpression *)textLineHeight {
    NGLAssertStyleLayerIsValid();

    auto propertyValue = self.rawLayer->getTextLineHeight();
    if (propertyValue.isUndefined()) {
        propertyValue = self.rawLayer->getDefaultTextLineHeight();
    }
    return NGLStyleValueTransformer<float, NSNumber *>().toExpression(propertyValue);
}

- (void)setTextOffset:(NSExpression *)textOffset {
    NGLAssertStyleLayerIsValid();
    NGLLogDebug(@"Setting textOffset: %@", textOffset);

    auto nbglValue = NGLStyleValueTransformer<std::array<float, 2>, NSValue *>().toPropertyValue<nbgl::style::PropertyValue<std::array<float, 2>>>(textOffset, true);
    self.rawLayer->setTextOffset(nbglValue);
}

- (NSExpression *)textOffset {
    NGLAssertStyleLayerIsValid();

    auto propertyValue = self.rawLayer->getTextOffset();
    if (propertyValue.isUndefined()) {
        propertyValue = self.rawLayer->getDefaultTextOffset();
    }
    return NGLStyleValueTransformer<std::array<float, 2>, NSValue *>().toExpression(propertyValue);
}

- (void)setTextOptional:(NSExpression *)textOptional {
    NGLAssertStyleLayerIsValid();
    NGLLogDebug(@"Setting textOptional: %@", textOptional);

    auto nbglValue = NGLStyleValueTransformer<bool, NSNumber *>().toPropertyValue<nbgl::style::PropertyValue<bool>>(textOptional, false);
    self.rawLayer->setTextOptional(nbglValue);
}

- (NSExpression *)isTextOptional {
    NGLAssertStyleLayerIsValid();

    auto propertyValue = self.rawLayer->getTextOptional();
    if (propertyValue.isUndefined()) {
        propertyValue = self.rawLayer->getDefaultTextOptional();
    }
    return NGLStyleValueTransformer<bool, NSNumber *>().toExpression(propertyValue);
}

- (void)setTextPadding:(NSExpression *)textPadding {
    NGLAssertStyleLayerIsValid();
    NGLLogDebug(@"Setting textPadding: %@", textPadding);

    auto nbglValue = NGLStyleValueTransformer<float, NSNumber *>().toPropertyValue<nbgl::style::PropertyValue<float>>(textPadding, false);
    self.rawLayer->setTextPadding(nbglValue);
}

- (NSExpression *)textPadding {
    NGLAssertStyleLayerIsValid();

    auto propertyValue = self.rawLayer->getTextPadding();
    if (propertyValue.isUndefined()) {
        propertyValue = self.rawLayer->getDefaultTextPadding();
    }
    return NGLStyleValueTransformer<float, NSNumber *>().toExpression(propertyValue);
}

- (void)setTextPitchAlignment:(NSExpression *)textPitchAlignment {
    NGLAssertStyleLayerIsValid();
    NGLLogDebug(@"Setting textPitchAlignment: %@", textPitchAlignment);

    auto nbglValue = NGLStyleValueTransformer<nbgl::style::AlignmentType, NSValue *, nbgl::style::AlignmentType, NGLTextPitchAlignment>().toPropertyValue<nbgl::style::PropertyValue<nbgl::style::AlignmentType>>(textPitchAlignment, false);
    self.rawLayer->setTextPitchAlignment(nbglValue);
}

- (NSExpression *)textPitchAlignment {
    NGLAssertStyleLayerIsValid();

    auto propertyValue = self.rawLayer->getTextPitchAlignment();
    if (propertyValue.isUndefined()) {
        propertyValue = self.rawLayer->getDefaultTextPitchAlignment();
    }
    return NGLStyleValueTransformer<nbgl::style::AlignmentType, NSValue *, nbgl::style::AlignmentType, NGLTextPitchAlignment>().toExpression(propertyValue);
}

- (void)setTextRadialOffset:(NSExpression *)textRadialOffset {
    NGLAssertStyleLayerIsValid();
    NGLLogDebug(@"Setting textRadialOffset: %@", textRadialOffset);

    auto nbglValue = NGLStyleValueTransformer<float, NSNumber *>().toPropertyValue<nbgl::style::PropertyValue<float>>(textRadialOffset, true);
    self.rawLayer->setTextRadialOffset(nbglValue);
}

- (NSExpression *)textRadialOffset {
    NGLAssertStyleLayerIsValid();

    auto propertyValue = self.rawLayer->getTextRadialOffset();
    if (propertyValue.isUndefined()) {
        propertyValue = self.rawLayer->getDefaultTextRadialOffset();
    }
    return NGLStyleValueTransformer<float, NSNumber *>().toExpression(propertyValue);
}

- (void)setTextRotation:(NSExpression *)textRotation {
    NGLAssertStyleLayerIsValid();
    NGLLogDebug(@"Setting textRotation: %@", textRotation);

    auto nbglValue = NGLStyleValueTransformer<float, NSNumber *>().toPropertyValue<nbgl::style::PropertyValue<float>>(textRotation, true);
    self.rawLayer->setTextRotate(nbglValue);
}

- (NSExpression *)textRotation {
    NGLAssertStyleLayerIsValid();

    auto propertyValue = self.rawLayer->getTextRotate();
    if (propertyValue.isUndefined()) {
        propertyValue = self.rawLayer->getDefaultTextRotate();
    }
    return NGLStyleValueTransformer<float, NSNumber *>().toExpression(propertyValue);
}

- (void)setTextRotate:(NSExpression *)textRotate {
}

- (NSExpression *)textRotate {
    return self.textRotation;
}

- (void)setTextRotationAlignment:(NSExpression *)textRotationAlignment {
    NGLAssertStyleLayerIsValid();
    NGLLogDebug(@"Setting textRotationAlignment: %@", textRotationAlignment);

    auto nbglValue = NGLStyleValueTransformer<nbgl::style::AlignmentType, NSValue *, nbgl::style::AlignmentType, NGLTextRotationAlignment>().toPropertyValue<nbgl::style::PropertyValue<nbgl::style::AlignmentType>>(textRotationAlignment, false);
    self.rawLayer->setTextRotationAlignment(nbglValue);
}

- (NSExpression *)textRotationAlignment {
    NGLAssertStyleLayerIsValid();

    auto propertyValue = self.rawLayer->getTextRotationAlignment();
    if (propertyValue.isUndefined()) {
        propertyValue = self.rawLayer->getDefaultTextRotationAlignment();
    }
    return NGLStyleValueTransformer<nbgl::style::AlignmentType, NSValue *, nbgl::style::AlignmentType, NGLTextRotationAlignment>().toExpression(propertyValue);
}

- (void)setTextTransform:(NSExpression *)textTransform {
    NGLAssertStyleLayerIsValid();
    NGLLogDebug(@"Setting textTransform: %@", textTransform);

    auto nbglValue = NGLStyleValueTransformer<nbgl::style::TextTransformType, NSValue *, nbgl::style::TextTransformType, NGLTextTransform>().toPropertyValue<nbgl::style::PropertyValue<nbgl::style::TextTransformType>>(textTransform, true);
    self.rawLayer->setTextTransform(nbglValue);
}

- (NSExpression *)textTransform {
    NGLAssertStyleLayerIsValid();

    auto propertyValue = self.rawLayer->getTextTransform();
    if (propertyValue.isUndefined()) {
        propertyValue = self.rawLayer->getDefaultTextTransform();
    }
    return NGLStyleValueTransformer<nbgl::style::TextTransformType, NSValue *, nbgl::style::TextTransformType, NGLTextTransform>().toExpression(propertyValue);
}

- (void)setTextVariableAnchor:(NSExpression *)textVariableAnchor {
    NGLAssertStyleLayerIsValid();
    NGLLogDebug(@"Setting textVariableAnchor: %@", textVariableAnchor);

    auto nbglValue = NGLStyleValueTransformer<std::vector<nbgl::style::SymbolAnchorType>, NSArray<NSValue *> *, nbgl::style::SymbolAnchorType, NGLTextAnchor>().toPropertyValue<nbgl::style::PropertyValue<std::vector<nbgl::style::SymbolAnchorType>>>(textVariableAnchor, false);
    self.rawLayer->setTextVariableAnchor(nbglValue);
}

- (NSExpression *)textVariableAnchor {
    NGLAssertStyleLayerIsValid();

    auto propertyValue = self.rawLayer->getTextVariableAnchor();
    if (propertyValue.isUndefined()) {
        propertyValue = self.rawLayer->getDefaultTextVariableAnchor();
    }
    return NGLStyleValueTransformer<std::vector<nbgl::style::SymbolAnchorType>, NSArray<NSValue *> *, nbgl::style::SymbolAnchorType, NGLTextAnchor>().toExpression(propertyValue);
}

- (void)setTextVariableAnchorOffset:(NSExpression *)textVariableAnchorOffset {
    NGLAssertStyleLayerIsValid();
    NGLLogDebug(@"Setting textVariableAnchorOffset: %@", textVariableAnchorOffset);

    auto nbglValue = NGLStyleValueTransformer<nbgl::VariableAnchorOffsetCollection, NSArray<NSValue *> *>().toPropertyValue<nbgl::style::PropertyValue<nbgl::VariableAnchorOffsetCollection>>(textVariableAnchorOffset, true);
    self.rawLayer->setTextVariableAnchorOffset(nbglValue);
}

- (NSExpression *)textVariableAnchorOffset {
    NGLAssertStyleLayerIsValid();

    auto propertyValue = self.rawLayer->getTextVariableAnchorOffset();
    if (propertyValue.isUndefined()) {
        propertyValue = self.rawLayer->getDefaultTextVariableAnchorOffset();
    }
    return NGLStyleValueTransformer<nbgl::VariableAnchorOffsetCollection, NSArray<NSValue *> *>().toExpression(propertyValue);
}

- (void)setTextWritingModes:(NSExpression *)textWritingModes {
    NGLAssertStyleLayerIsValid();
    NGLLogDebug(@"Setting textWritingModes: %@", textWritingModes);

    auto nbglValue = NGLStyleValueTransformer<std::vector<nbgl::style::TextWritingModeType>, NSArray<NSValue *> *, nbgl::style::TextWritingModeType, NGLTextWritingMode>().toPropertyValue<nbgl::style::PropertyValue<std::vector<nbgl::style::TextWritingModeType>>>(textWritingModes, false);
    self.rawLayer->setTextWritingMode(nbglValue);
}

- (NSExpression *)textWritingModes {
    NGLAssertStyleLayerIsValid();

    auto propertyValue = self.rawLayer->getTextWritingMode();
    if (propertyValue.isUndefined()) {
        propertyValue = self.rawLayer->getDefaultTextWritingMode();
    }
    return NGLStyleValueTransformer<std::vector<nbgl::style::TextWritingModeType>, NSArray<NSValue *> *, nbgl::style::TextWritingModeType, NGLTextWritingMode>().toExpression(propertyValue);
}

- (void)setTextWritingMode:(NSExpression *)textWritingMode {
}

- (NSExpression *)textWritingMode {
    return self.textWritingModes;
}

// MARK: - Accessing the Paint Attributes

- (void)setIconColor:(NSExpression *)iconColor {
    NGLAssertStyleLayerIsValid();
    NGLLogDebug(@"Setting iconColor: %@", iconColor);

    auto nbglValue = NGLStyleValueTransformer<nbgl::Color, NGLColor *>().toPropertyValue<nbgl::style::PropertyValue<nbgl::Color>>(iconColor, true);
    self.rawLayer->setIconColor(nbglValue);
}

- (NSExpression *)iconColor {
    NGLAssertStyleLayerIsValid();

    auto propertyValue = self.rawLayer->getIconColor();
    if (propertyValue.isUndefined()) {
        propertyValue = self.rawLayer->getDefaultIconColor();
    }
    return NGLStyleValueTransformer<nbgl::Color, NGLColor *>().toExpression(propertyValue);
}

- (void)setIconColorTransition:(NGLTransition )transition {
    NGLAssertStyleLayerIsValid();
    NGLLogDebug(@"Setting iconColorTransition: %@", NGLStringFromNGLTransition(transition));

    self.rawLayer->setIconColorTransition(NGLOptionsFromTransition(transition));
}

- (NGLTransition)iconColorTransition {
    NGLAssertStyleLayerIsValid();

    nbgl::style::TransitionOptions transitionOptions = self.rawLayer->getIconColorTransition();

    return NGLTransitionFromOptions(transitionOptions);
}

- (void)setIconHaloBlur:(NSExpression *)iconHaloBlur {
    NGLAssertStyleLayerIsValid();
    NGLLogDebug(@"Setting iconHaloBlur: %@", iconHaloBlur);

    auto nbglValue = NGLStyleValueTransformer<float, NSNumber *>().toPropertyValue<nbgl::style::PropertyValue<float>>(iconHaloBlur, true);
    self.rawLayer->setIconHaloBlur(nbglValue);
}

- (NSExpression *)iconHaloBlur {
    NGLAssertStyleLayerIsValid();

    auto propertyValue = self.rawLayer->getIconHaloBlur();
    if (propertyValue.isUndefined()) {
        propertyValue = self.rawLayer->getDefaultIconHaloBlur();
    }
    return NGLStyleValueTransformer<float, NSNumber *>().toExpression(propertyValue);
}

- (void)setIconHaloBlurTransition:(NGLTransition )transition {
    NGLAssertStyleLayerIsValid();
    NGLLogDebug(@"Setting iconHaloBlurTransition: %@", NGLStringFromNGLTransition(transition));

    self.rawLayer->setIconHaloBlurTransition(NGLOptionsFromTransition(transition));
}

- (NGLTransition)iconHaloBlurTransition {
    NGLAssertStyleLayerIsValid();

    nbgl::style::TransitionOptions transitionOptions = self.rawLayer->getIconHaloBlurTransition();

    return NGLTransitionFromOptions(transitionOptions);
}

- (void)setIconHaloColor:(NSExpression *)iconHaloColor {
    NGLAssertStyleLayerIsValid();
    NGLLogDebug(@"Setting iconHaloColor: %@", iconHaloColor);

    auto nbglValue = NGLStyleValueTransformer<nbgl::Color, NGLColor *>().toPropertyValue<nbgl::style::PropertyValue<nbgl::Color>>(iconHaloColor, true);
    self.rawLayer->setIconHaloColor(nbglValue);
}

- (NSExpression *)iconHaloColor {
    NGLAssertStyleLayerIsValid();

    auto propertyValue = self.rawLayer->getIconHaloColor();
    if (propertyValue.isUndefined()) {
        propertyValue = self.rawLayer->getDefaultIconHaloColor();
    }
    return NGLStyleValueTransformer<nbgl::Color, NGLColor *>().toExpression(propertyValue);
}

- (void)setIconHaloColorTransition:(NGLTransition )transition {
    NGLAssertStyleLayerIsValid();
    NGLLogDebug(@"Setting iconHaloColorTransition: %@", NGLStringFromNGLTransition(transition));

    self.rawLayer->setIconHaloColorTransition(NGLOptionsFromTransition(transition));
}

- (NGLTransition)iconHaloColorTransition {
    NGLAssertStyleLayerIsValid();

    nbgl::style::TransitionOptions transitionOptions = self.rawLayer->getIconHaloColorTransition();

    return NGLTransitionFromOptions(transitionOptions);
}

- (void)setIconHaloWidth:(NSExpression *)iconHaloWidth {
    NGLAssertStyleLayerIsValid();
    NGLLogDebug(@"Setting iconHaloWidth: %@", iconHaloWidth);

    auto nbglValue = NGLStyleValueTransformer<float, NSNumber *>().toPropertyValue<nbgl::style::PropertyValue<float>>(iconHaloWidth, true);
    self.rawLayer->setIconHaloWidth(nbglValue);
}

- (NSExpression *)iconHaloWidth {
    NGLAssertStyleLayerIsValid();

    auto propertyValue = self.rawLayer->getIconHaloWidth();
    if (propertyValue.isUndefined()) {
        propertyValue = self.rawLayer->getDefaultIconHaloWidth();
    }
    return NGLStyleValueTransformer<float, NSNumber *>().toExpression(propertyValue);
}

- (void)setIconHaloWidthTransition:(NGLTransition )transition {
    NGLAssertStyleLayerIsValid();
    NGLLogDebug(@"Setting iconHaloWidthTransition: %@", NGLStringFromNGLTransition(transition));

    self.rawLayer->setIconHaloWidthTransition(NGLOptionsFromTransition(transition));
}

- (NGLTransition)iconHaloWidthTransition {
    NGLAssertStyleLayerIsValid();

    nbgl::style::TransitionOptions transitionOptions = self.rawLayer->getIconHaloWidthTransition();

    return NGLTransitionFromOptions(transitionOptions);
}

- (void)setIconOpacity:(NSExpression *)iconOpacity {
    NGLAssertStyleLayerIsValid();
    NGLLogDebug(@"Setting iconOpacity: %@", iconOpacity);

    auto nbglValue = NGLStyleValueTransformer<float, NSNumber *>().toPropertyValue<nbgl::style::PropertyValue<float>>(iconOpacity, true);
    self.rawLayer->setIconOpacity(nbglValue);
}

- (NSExpression *)iconOpacity {
    NGLAssertStyleLayerIsValid();

    auto propertyValue = self.rawLayer->getIconOpacity();
    if (propertyValue.isUndefined()) {
        propertyValue = self.rawLayer->getDefaultIconOpacity();
    }
    return NGLStyleValueTransformer<float, NSNumber *>().toExpression(propertyValue);
}

- (void)setIconOpacityTransition:(NGLTransition )transition {
    NGLAssertStyleLayerIsValid();
    NGLLogDebug(@"Setting iconOpacityTransition: %@", NGLStringFromNGLTransition(transition));

    self.rawLayer->setIconOpacityTransition(NGLOptionsFromTransition(transition));
}

- (NGLTransition)iconOpacityTransition {
    NGLAssertStyleLayerIsValid();

    nbgl::style::TransitionOptions transitionOptions = self.rawLayer->getIconOpacityTransition();

    return NGLTransitionFromOptions(transitionOptions);
}

- (void)setIconTranslation:(NSExpression *)iconTranslation {
    NGLAssertStyleLayerIsValid();
    NGLLogDebug(@"Setting iconTranslation: %@", iconTranslation);

    auto nbglValue = NGLStyleValueTransformer<std::array<float, 2>, NSValue *>().toPropertyValue<nbgl::style::PropertyValue<std::array<float, 2>>>(iconTranslation, false);
    self.rawLayer->setIconTranslate(nbglValue);
}

- (NSExpression *)iconTranslation {
    NGLAssertStyleLayerIsValid();

    auto propertyValue = self.rawLayer->getIconTranslate();
    if (propertyValue.isUndefined()) {
        propertyValue = self.rawLayer->getDefaultIconTranslate();
    }
    return NGLStyleValueTransformer<std::array<float, 2>, NSValue *>().toExpression(propertyValue);
}

- (void)setIconTranslationTransition:(NGLTransition )transition {
    NGLAssertStyleLayerIsValid();
    NGLLogDebug(@"Setting iconTranslationTransition: %@", NGLStringFromNGLTransition(transition));

    self.rawLayer->setIconTranslateTransition(NGLOptionsFromTransition(transition));
}

- (NGLTransition)iconTranslationTransition {
    NGLAssertStyleLayerIsValid();

    nbgl::style::TransitionOptions transitionOptions = self.rawLayer->getIconTranslateTransition();

    return NGLTransitionFromOptions(transitionOptions);
}

- (void)setIconTranslate:(NSExpression *)iconTranslate {
}

- (NSExpression *)iconTranslate {
    return self.iconTranslation;
}

- (void)setIconTranslationAnchor:(NSExpression *)iconTranslationAnchor {
    NGLAssertStyleLayerIsValid();
    NGLLogDebug(@"Setting iconTranslationAnchor: %@", iconTranslationAnchor);

    auto nbglValue = NGLStyleValueTransformer<nbgl::style::TranslateAnchorType, NSValue *, nbgl::style::TranslateAnchorType, NGLIconTranslationAnchor>().toPropertyValue<nbgl::style::PropertyValue<nbgl::style::TranslateAnchorType>>(iconTranslationAnchor, false);
    self.rawLayer->setIconTranslateAnchor(nbglValue);
}

- (NSExpression *)iconTranslationAnchor {
    NGLAssertStyleLayerIsValid();

    auto propertyValue = self.rawLayer->getIconTranslateAnchor();
    if (propertyValue.isUndefined()) {
        propertyValue = self.rawLayer->getDefaultIconTranslateAnchor();
    }
    return NGLStyleValueTransformer<nbgl::style::TranslateAnchorType, NSValue *, nbgl::style::TranslateAnchorType, NGLIconTranslationAnchor>().toExpression(propertyValue);
}

- (void)setIconTranslateAnchor:(NSExpression *)iconTranslateAnchor {
}

- (NSExpression *)iconTranslateAnchor {
    return self.iconTranslationAnchor;
}

- (void)setTextColor:(NSExpression *)textColor {
    NGLAssertStyleLayerIsValid();
    NGLLogDebug(@"Setting textColor: %@", textColor);

    auto nbglValue = NGLStyleValueTransformer<nbgl::Color, NGLColor *>().toPropertyValue<nbgl::style::PropertyValue<nbgl::Color>>(textColor, true);
    self.rawLayer->setTextColor(nbglValue);
}

- (NSExpression *)textColor {
    NGLAssertStyleLayerIsValid();

    auto propertyValue = self.rawLayer->getTextColor();
    if (propertyValue.isUndefined()) {
        propertyValue = self.rawLayer->getDefaultTextColor();
    }
    return NGLStyleValueTransformer<nbgl::Color, NGLColor *>().toExpression(propertyValue);
}

- (void)setTextColorTransition:(NGLTransition )transition {
    NGLAssertStyleLayerIsValid();
    NGLLogDebug(@"Setting textColorTransition: %@", NGLStringFromNGLTransition(transition));

    self.rawLayer->setTextColorTransition(NGLOptionsFromTransition(transition));
}

- (NGLTransition)textColorTransition {
    NGLAssertStyleLayerIsValid();

    nbgl::style::TransitionOptions transitionOptions = self.rawLayer->getTextColorTransition();

    return NGLTransitionFromOptions(transitionOptions);
}

- (void)setTextHaloBlur:(NSExpression *)textHaloBlur {
    NGLAssertStyleLayerIsValid();
    NGLLogDebug(@"Setting textHaloBlur: %@", textHaloBlur);

    auto nbglValue = NGLStyleValueTransformer<float, NSNumber *>().toPropertyValue<nbgl::style::PropertyValue<float>>(textHaloBlur, true);
    self.rawLayer->setTextHaloBlur(nbglValue);
}

- (NSExpression *)textHaloBlur {
    NGLAssertStyleLayerIsValid();

    auto propertyValue = self.rawLayer->getTextHaloBlur();
    if (propertyValue.isUndefined()) {
        propertyValue = self.rawLayer->getDefaultTextHaloBlur();
    }
    return NGLStyleValueTransformer<float, NSNumber *>().toExpression(propertyValue);
}

- (void)setTextHaloBlurTransition:(NGLTransition )transition {
    NGLAssertStyleLayerIsValid();
    NGLLogDebug(@"Setting textHaloBlurTransition: %@", NGLStringFromNGLTransition(transition));

    self.rawLayer->setTextHaloBlurTransition(NGLOptionsFromTransition(transition));
}

- (NGLTransition)textHaloBlurTransition {
    NGLAssertStyleLayerIsValid();

    nbgl::style::TransitionOptions transitionOptions = self.rawLayer->getTextHaloBlurTransition();

    return NGLTransitionFromOptions(transitionOptions);
}

- (void)setTextHaloColor:(NSExpression *)textHaloColor {
    NGLAssertStyleLayerIsValid();
    NGLLogDebug(@"Setting textHaloColor: %@", textHaloColor);

    auto nbglValue = NGLStyleValueTransformer<nbgl::Color, NGLColor *>().toPropertyValue<nbgl::style::PropertyValue<nbgl::Color>>(textHaloColor, true);
    self.rawLayer->setTextHaloColor(nbglValue);
}

- (NSExpression *)textHaloColor {
    NGLAssertStyleLayerIsValid();

    auto propertyValue = self.rawLayer->getTextHaloColor();
    if (propertyValue.isUndefined()) {
        propertyValue = self.rawLayer->getDefaultTextHaloColor();
    }
    return NGLStyleValueTransformer<nbgl::Color, NGLColor *>().toExpression(propertyValue);
}

- (void)setTextHaloColorTransition:(NGLTransition )transition {
    NGLAssertStyleLayerIsValid();
    NGLLogDebug(@"Setting textHaloColorTransition: %@", NGLStringFromNGLTransition(transition));

    self.rawLayer->setTextHaloColorTransition(NGLOptionsFromTransition(transition));
}

- (NGLTransition)textHaloColorTransition {
    NGLAssertStyleLayerIsValid();

    nbgl::style::TransitionOptions transitionOptions = self.rawLayer->getTextHaloColorTransition();

    return NGLTransitionFromOptions(transitionOptions);
}

- (void)setTextHaloWidth:(NSExpression *)textHaloWidth {
    NGLAssertStyleLayerIsValid();
    NGLLogDebug(@"Setting textHaloWidth: %@", textHaloWidth);

    auto nbglValue = NGLStyleValueTransformer<float, NSNumber *>().toPropertyValue<nbgl::style::PropertyValue<float>>(textHaloWidth, true);
    self.rawLayer->setTextHaloWidth(nbglValue);
}

- (NSExpression *)textHaloWidth {
    NGLAssertStyleLayerIsValid();

    auto propertyValue = self.rawLayer->getTextHaloWidth();
    if (propertyValue.isUndefined()) {
        propertyValue = self.rawLayer->getDefaultTextHaloWidth();
    }
    return NGLStyleValueTransformer<float, NSNumber *>().toExpression(propertyValue);
}

- (void)setTextHaloWidthTransition:(NGLTransition )transition {
    NGLAssertStyleLayerIsValid();
    NGLLogDebug(@"Setting textHaloWidthTransition: %@", NGLStringFromNGLTransition(transition));

    self.rawLayer->setTextHaloWidthTransition(NGLOptionsFromTransition(transition));
}

- (NGLTransition)textHaloWidthTransition {
    NGLAssertStyleLayerIsValid();

    nbgl::style::TransitionOptions transitionOptions = self.rawLayer->getTextHaloWidthTransition();

    return NGLTransitionFromOptions(transitionOptions);
}

- (void)setTextOpacity:(NSExpression *)textOpacity {
    NGLAssertStyleLayerIsValid();
    NGLLogDebug(@"Setting textOpacity: %@", textOpacity);

    auto nbglValue = NGLStyleValueTransformer<float, NSNumber *>().toPropertyValue<nbgl::style::PropertyValue<float>>(textOpacity, true);
    self.rawLayer->setTextOpacity(nbglValue);
}

- (NSExpression *)textOpacity {
    NGLAssertStyleLayerIsValid();

    auto propertyValue = self.rawLayer->getTextOpacity();
    if (propertyValue.isUndefined()) {
        propertyValue = self.rawLayer->getDefaultTextOpacity();
    }
    return NGLStyleValueTransformer<float, NSNumber *>().toExpression(propertyValue);
}

- (void)setTextOpacityTransition:(NGLTransition )transition {
    NGLAssertStyleLayerIsValid();
    NGLLogDebug(@"Setting textOpacityTransition: %@", NGLStringFromNGLTransition(transition));

    self.rawLayer->setTextOpacityTransition(NGLOptionsFromTransition(transition));
}

- (NGLTransition)textOpacityTransition {
    NGLAssertStyleLayerIsValid();

    nbgl::style::TransitionOptions transitionOptions = self.rawLayer->getTextOpacityTransition();

    return NGLTransitionFromOptions(transitionOptions);
}

- (void)setTextTranslation:(NSExpression *)textTranslation {
    NGLAssertStyleLayerIsValid();
    NGLLogDebug(@"Setting textTranslation: %@", textTranslation);

    auto nbglValue = NGLStyleValueTransformer<std::array<float, 2>, NSValue *>().toPropertyValue<nbgl::style::PropertyValue<std::array<float, 2>>>(textTranslation, false);
    self.rawLayer->setTextTranslate(nbglValue);
}

- (NSExpression *)textTranslation {
    NGLAssertStyleLayerIsValid();

    auto propertyValue = self.rawLayer->getTextTranslate();
    if (propertyValue.isUndefined()) {
        propertyValue = self.rawLayer->getDefaultTextTranslate();
    }
    return NGLStyleValueTransformer<std::array<float, 2>, NSValue *>().toExpression(propertyValue);
}

- (void)setTextTranslationTransition:(NGLTransition )transition {
    NGLAssertStyleLayerIsValid();
    NGLLogDebug(@"Setting textTranslationTransition: %@", NGLStringFromNGLTransition(transition));

    self.rawLayer->setTextTranslateTransition(NGLOptionsFromTransition(transition));
}

- (NGLTransition)textTranslationTransition {
    NGLAssertStyleLayerIsValid();

    nbgl::style::TransitionOptions transitionOptions = self.rawLayer->getTextTranslateTransition();

    return NGLTransitionFromOptions(transitionOptions);
}

- (void)setTextTranslate:(NSExpression *)textTranslate {
}

- (NSExpression *)textTranslate {
    return self.textTranslation;
}

- (void)setTextTranslationAnchor:(NSExpression *)textTranslationAnchor {
    NGLAssertStyleLayerIsValid();
    NGLLogDebug(@"Setting textTranslationAnchor: %@", textTranslationAnchor);

    auto nbglValue = NGLStyleValueTransformer<nbgl::style::TranslateAnchorType, NSValue *, nbgl::style::TranslateAnchorType, NGLTextTranslationAnchor>().toPropertyValue<nbgl::style::PropertyValue<nbgl::style::TranslateAnchorType>>(textTranslationAnchor, false);
    self.rawLayer->setTextTranslateAnchor(nbglValue);
}

- (NSExpression *)textTranslationAnchor {
    NGLAssertStyleLayerIsValid();

    auto propertyValue = self.rawLayer->getTextTranslateAnchor();
    if (propertyValue.isUndefined()) {
        propertyValue = self.rawLayer->getDefaultTextTranslateAnchor();
    }
    return NGLStyleValueTransformer<nbgl::style::TranslateAnchorType, NSValue *, nbgl::style::TranslateAnchorType, NGLTextTranslationAnchor>().toExpression(propertyValue);
}

- (void)setTextTranslateAnchor:(NSExpression *)textTranslateAnchor {
}

- (NSExpression *)textTranslateAnchor {
    return self.textTranslationAnchor;
}

@end

@implementation NSValue (NGLSymbolStyleLayerAdditions)

+ (NSValue *)valueWithNGLIconAnchor:(NGLIconAnchor)iconAnchor {
    return [NSValue value:&iconAnchor withObjCType:@encode(NGLIconAnchor)];
}

- (NGLIconAnchor)NGLIconAnchorValue {
    NGLIconAnchor iconAnchor;
    [self getValue:&iconAnchor];
    return iconAnchor;
}

+ (NSValue *)valueWithNGLIconPitchAlignment:(NGLIconPitchAlignment)iconPitchAlignment {
    return [NSValue value:&iconPitchAlignment withObjCType:@encode(NGLIconPitchAlignment)];
}

- (NGLIconPitchAlignment)NGLIconPitchAlignmentValue {
    NGLIconPitchAlignment iconPitchAlignment;
    [self getValue:&iconPitchAlignment];
    return iconPitchAlignment;
}

+ (NSValue *)valueWithNGLIconRotationAlignment:(NGLIconRotationAlignment)iconRotationAlignment {
    return [NSValue value:&iconRotationAlignment withObjCType:@encode(NGLIconRotationAlignment)];
}

- (NGLIconRotationAlignment)NGLIconRotationAlignmentValue {
    NGLIconRotationAlignment iconRotationAlignment;
    [self getValue:&iconRotationAlignment];
    return iconRotationAlignment;
}

+ (NSValue *)valueWithNGLIconTextFit:(NGLIconTextFit)iconTextFit {
    return [NSValue value:&iconTextFit withObjCType:@encode(NGLIconTextFit)];
}

- (NGLIconTextFit)NGLIconTextFitValue {
    NGLIconTextFit iconTextFit;
    [self getValue:&iconTextFit];
    return iconTextFit;
}

+ (NSValue *)valueWithNGLSymbolPlacement:(NGLSymbolPlacement)symbolPlacement {
    return [NSValue value:&symbolPlacement withObjCType:@encode(NGLSymbolPlacement)];
}

- (NGLSymbolPlacement)NGLSymbolPlacementValue {
    NGLSymbolPlacement symbolPlacement;
    [self getValue:&symbolPlacement];
    return symbolPlacement;
}

+ (NSValue *)valueWithNGLSymbolZOrder:(NGLSymbolZOrder)symbolZOrder {
    return [NSValue value:&symbolZOrder withObjCType:@encode(NGLSymbolZOrder)];
}

- (NGLSymbolZOrder)NGLSymbolZOrderValue {
    NGLSymbolZOrder symbolZOrder;
    [self getValue:&symbolZOrder];
    return symbolZOrder;
}

+ (NSValue *)valueWithNGLTextAnchor:(NGLTextAnchor)textAnchor {
    return [NSValue value:&textAnchor withObjCType:@encode(NGLTextAnchor)];
}

- (NGLTextAnchor)NGLTextAnchorValue {
    NGLTextAnchor textAnchor;
    [self getValue:&textAnchor];
    return textAnchor;
}

+ (NSValue *)valueWithNGLTextJustification:(NGLTextJustification)textJustification {
    return [NSValue value:&textJustification withObjCType:@encode(NGLTextJustification)];
}

- (NGLTextJustification)NGLTextJustificationValue {
    NGLTextJustification textJustification;
    [self getValue:&textJustification];
    return textJustification;
}

+ (NSValue *)valueWithNGLTextPitchAlignment:(NGLTextPitchAlignment)textPitchAlignment {
    return [NSValue value:&textPitchAlignment withObjCType:@encode(NGLTextPitchAlignment)];
}

- (NGLTextPitchAlignment)NGLTextPitchAlignmentValue {
    NGLTextPitchAlignment textPitchAlignment;
    [self getValue:&textPitchAlignment];
    return textPitchAlignment;
}

+ (NSValue *)valueWithNGLTextRotationAlignment:(NGLTextRotationAlignment)textRotationAlignment {
    return [NSValue value:&textRotationAlignment withObjCType:@encode(NGLTextRotationAlignment)];
}

- (NGLTextRotationAlignment)NGLTextRotationAlignmentValue {
    NGLTextRotationAlignment textRotationAlignment;
    [self getValue:&textRotationAlignment];
    return textRotationAlignment;
}

+ (NSValue *)valueWithNGLTextTransform:(NGLTextTransform)textTransform {
    return [NSValue value:&textTransform withObjCType:@encode(NGLTextTransform)];
}

- (NGLTextTransform)NGLTextTransformValue {
    NGLTextTransform textTransform;
    [self getValue:&textTransform];
    return textTransform;
}

+ (NSValue *)valueWithNGLTextWritingMode:(NGLTextWritingMode)textWritingModes {
    return [NSValue value:&textWritingModes withObjCType:@encode(NGLTextWritingMode)];
}

- (NGLTextWritingMode)NGLTextWritingModeValue {
    NGLTextWritingMode textWritingModes;
    [self getValue:&textWritingModes];
    return textWritingModes;
}

+ (NSValue *)valueWithNGLIconTranslationAnchor:(NGLIconTranslationAnchor)iconTranslationAnchor {
    return [NSValue value:&iconTranslationAnchor withObjCType:@encode(NGLIconTranslationAnchor)];
}

- (NGLIconTranslationAnchor)NGLIconTranslationAnchorValue {
    NGLIconTranslationAnchor iconTranslationAnchor;
    [self getValue:&iconTranslationAnchor];
    return iconTranslationAnchor;
}

+ (NSValue *)valueWithNGLTextTranslationAnchor:(NGLTextTranslationAnchor)textTranslationAnchor {
    return [NSValue value:&textTranslationAnchor withObjCType:@encode(NGLTextTranslationAnchor)];
}

- (NGLTextTranslationAnchor)NGLTextTranslationAnchorValue {
    NGLTextTranslationAnchor textTranslationAnchor;
    [self getValue:&textTranslationAnchor];
    return textTranslationAnchor;
}

@end

namespace nbgl {

NGLStyleLayer* SymbolStyleLayerPeerFactory::createPeer(style::Layer* rawLayer) {
    return [[NGLSymbolStyleLayer alloc] initWithRawLayer:rawLayer];
}

}  // namespace nbgl
