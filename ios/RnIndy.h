//  Created by react-native-create-bridge

// import RCTBridgeModule
// #if __has_include(<React/RCTBridgeModule.h>)

// #elif __has_include(“RCTBridgeModule.h”)
// #import “RCTBridgeModule.h”
// #else
// #import “React/RCTBridgeModule.h” // Required when used as a Pod in a Swift project
// #endif


#import <React/RCTBridgeModule.h>
// // import RCTEventEmitter
// #if __has_include(<React/RCTEventEmitter.h>)
// #import <React/RCTEventEmitter.h>
// #elif __has_include(“RCTEventEmitter.h”)
// #import “RCTEventEmitter.h”
// #else
// #import “React/RCTEventEmitter.h” // Required when used as a Pod in a Swift project
// #endif

#import "React/RCTEventEmitter.h" // Required when used as a Pod in a Swift project

@interface RNIndy : RCTEventEmitter <RCTBridgeModule>

@end
// RCT_EXPORT_MODULE(RNIndy);