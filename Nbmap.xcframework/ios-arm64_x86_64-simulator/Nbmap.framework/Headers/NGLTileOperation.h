#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, NGLTileOperation) {
  NGLTileOperationRequestedFromCache,    ///< A read request from the cache
  NGLTileOperationRequestedFromNetwork,  ///< A read request from the online source
  NGLTileOperationLoadFromNetwork,       ///< Tile data from the network has been retrieved
  NGLTileOperationLoadFromCache,         ///< Tile data from the cache has been retrieved
  NGLTileOperationStartParse,            ///< Background processing of tile data has been initiated
  NGLTileOperationEndParse,              ///< Background processing of tile data has been completed
  NGLTileOperationError,                 ///< An error occurred while loading the tile
  NGLTileOperationCancelled,             ///< Loading of a tile was cancelled
  NGLTileOperationNullOp,                ///< No operation has taken place
};
