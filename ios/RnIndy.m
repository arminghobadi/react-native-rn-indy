// //  Created by react-native-create-bridge

// #import "RnIndy.h"

// #import <React/RCTLog.h>
// #import <LocalAuthentication/LocalAuthentication.h>
// #import <React/RCTUtils.h>
// #import "React/RCTConvert.h"

// #include "vcx/ConnectMeVcx.h"
// #import "vcx/utils/NSError+VcxError.h"
// #import "vcx/utils/VcxCallbacks.h"
// #import "vcx/vcx/vcx.h"
// #include "vcx/vcx/vcx.h"
// // #import "VertiTransferVCX.h"

// // import RCTBridge
// #if __has_include(<React/RCTBridge.h>)
// #import <React/RCTBridge.h>
// #elif __has_include("RCTBridge.h")
// #import "RCTBridge.h"
// #else
// #import "React/RCTBridge.h" // Required when used as a Pod in a Swift project
// #endif

// // import RCTEventDispatcher
// #if __has_include(<React/RCTEventDispatcher.h>)
// #import <React/RCTEventDispatcher.h>
// #elif __has_include("RCTEventDispatcher.h")
// #import "RCTEventDispatcher.h"
// #else
// #import "React/RCTEventDispatcher.h" // Required when used as a Pod in a Swift project
// #endif

// #include "./VertiTransferVCX.m"
// // #import "vcx/vcx/vcx.h"

// @implementation RnIndy
// RCT_EXPORT_MODULE();

// // RCT_EXPORT_METHOD(addEvent:(NSString *)name location:(NSString *)location)
// // {
// //   RCTLogInfo(@"Pretending to create an event %@ at %@", name, location);
// // }

// // @synthesize bridge = _bridge;

// // // Export a native module
// // // https://facebook.github.io/react-native/docs/native-modules-ios.html


// // List all your events here
// // https://facebook.github.io/react-native/releases/next/docs/native-modules-ios.html#sending-events-to-javascript
// - (NSArray<NSString *> *)supportedEvents
// {
//   return @[@"NoEvent"];
// }

// // #pragma mark - Private methods
// // // Implement methods that you want to export to the native module
// // - (void) emitMessageToRN: (NSString *)eventName :(NSDictionary *)params {
// //   // The bridge eventDispatcher is used to send events from native to JS env
// //   // No documentation yet on DeviceEventEmitter: https://github.com/facebook/react-native/issues/2819
// //   [self sendEventWithName: eventName body: params];
// // }

// // #pragma mark - React Native exposed methods

// // // delete connection
// // RCT_EXPORT_METHOD(deleteConnection:(NSInteger) connectionHandle
// //                   resolver: (RCTPromiseResolveBlock) resolve
// //                   rejecter: (RCTPromiseRejectBlock) reject)
// // {
// //   [[[ConnectMeVcx alloc] init] deleteConnection:connectionHandle
// //                                  withCompletion:^(NSError *error)
// //   {
// //      if (error != nil && error.code != 0)
// //      {
// //        NSString *indyErrorCode = [NSString stringWithFormat:@"%ld", (long)error.code];
// //        reject(indyErrorCode, @"Error occurred while deleting connection", error);
// //      } else {
// //        resolve(@true);
// //      }
// //   }];
// // }

// RCT_EXPORT_METHOD(init: (NSString *)config
//                   resolver: (RCTPromiseResolveBlock) resolve
//                   rejecter: (RCTPromiseRejectBlock) reject)
// {
//   [[[ConnectMeVcx alloc] init] initWithConfig:config completion:^(NSError *error) {
//     if (error != nil && error.code != 0 && error.code != 1044)
//     {
//       NSString *indyErrorCode = [NSString stringWithFormat:@"%ld", (long)error.code];
//       reject(indyErrorCode, [NSString stringWithFormat:@"Error occurred while initializing vcx: %@ :: %ld",error.domain, (long)error.code], error);
//     }else{
//       resolve(@true);
//     }
//   }];
// }

// // RCT_EXPORT_METHOD(reset:
// //                   resolver: (RCTPromiseResolveBlock) resolve
// //                   rejecter: (RCTPromiseRejectBlock) reject)
// // {
// //   dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
// //     resolve(@{});
// //   });
// // }

// // RCT_EXPORT_METHOD(getSerializedConnection: (NSInteger)connectionHandle
// //                   resolver: (RCTPromiseResolveBlock) resolve
// //                   rejecter: (RCTPromiseRejectBlock) reject)
// // {
// //   // TODO call vcx_connection_serialize and pass connectionHandle
// //   // it would return a string
// //   [[[VertiTransferVCX alloc] init] connectionSerialize:connectionHandle
// //                                               completion:^(NSError *error, NSString *state) {
// //     if (error != nil && error.code != 0)
// //     {
// //       NSString *indyErrorCode = [NSString stringWithFormat:@"%ld", (long)error.code];
// //       reject(indyErrorCode, @"Error occurred while serializing connection handle", error);
// //     }else{

// //       resolve(state);
// //     }
// //   }];
// // }

// // RCT_EXPORT_METHOD(deserializeConnection: (NSString *)serializedConnection
// //                   resolver: (RCTPromiseResolveBlock) resolve
// //                   rejecter: (RCTPromiseRejectBlock) reject)
// // {
// //   // TODO call vcx_connection_deserialize and pass serializedConnection
// //   // it would return an error code and an integer connection handle in callback
// //   [[[VertiTransferVCX alloc] init] connectionDeserialize:serializedConnection completion:^(NSError *error, NSInteger connectionHandle) {
// //     if (error != nil && error.code != 0)
// //     {
// //       NSString *indyErrorCode = [NSString stringWithFormat:@"%ld", (long)error.code];
// //       reject(indyErrorCode, @"Error occurred while deserializing claim offer", error);
// //     }else{
// //       resolve(@(connectionHandle));
// //     }
// //   }];
// // }

// // RCT_EXPORT_METHOD(decryptWalletFile: (NSString *) config
// //                            resolver: (RCTPromiseResolveBlock) resolve
// //                            rejecter: (RCTPromiseRejectBlock) reject)
// // {
// //   [[[VertiTransferVCX alloc] init] importWallet: config
// //                                completion:^(NSError *error) {
// //     if(error != nil && error.code != 0){
// //       NSString *indyErrorCode = [NSString stringWithFormat:@"%ld", (long)error.code];
// //       reject(indyErrorCode, [NSString stringWithFormat:@"Error occurred while importing wallet: %@ :: %ld",error.domain, (long)error.code], error);
// //     }else {
// //       resolve(@{});
// //     }
// //   }];
// // }


// // RCT_EXPORT_METHOD(shutdownVcx: (BOOL *) deletePool
// //                     resolver: (RCTPromiseResolveBlock) resolve
// //                     rejecter: (RCTPromiseRejectBlock) reject)
// // {
// //   resolve([NSNumber numberWithInt:[[[VertiTransferVCX alloc] init] vcxShutdown: deletePool]]);
// // }


// // RCT_EXPORT_METHOD(credentialCreateWithMsgId: (NSString *) sourceId
// //                   withConnectionHandle: (NSInteger) connectionHandle
// //                   withMessageId: (NSString *) messageId
// //                   resolver: (RCTPromiseResolveBlock) resolve
// //                   rejecter: (RCTPromiseRejectBlock) reject)
// // {
// //     [[[VertiTransferVCX alloc] init] credentialCreateWithMsgid:sourceId
// //                                           connectionHandle:connectionHandle
// //                                                      msgId:messageId
// //                                                 completion:^(NSError *error, NSInteger credentialHandle, NSString* credentialOffer) {
// //       if (error != nil && error.code != 0)
// //       {
// //         NSString *indyErrorCode = [NSString stringWithFormat:@"%ld", (long)error.code];
// //         reject(indyErrorCode, @"Error occurred while creating credential handle", error);
// //       } else {
// //         NSDictionary* vcxCredentialCreateResult = @{
// //                                               @"credential_handle": @(credentialHandle),
// //                                               @"credential_offer": credentialOffer
// //                                               };
// //         resolve(vcxCredentialCreateResult);
// //       }
// //     }];
// // }

// // RCT_EXPORT_METHOD(serializeClaimOffer: (NSInteger)credentialHandle
// //                   resolver: (RCTPromiseResolveBlock) resolve
// //                   rejecter: (RCTPromiseRejectBlock) reject)
// // {
// //   // it would return error code, json string of credential inside callback
// //   [[[VertiTransferVCX alloc] init] credentialSerialize:credentialHandle completion:^(NSError *error, NSString *claimOffer) {
// //     if (error != nil && error.code != 0)
// //     {
// //       NSString *indyErrorCode = [NSString stringWithFormat:@"%ld", (long)error.code];
// //       reject(indyErrorCode, @"Error occurred while serializing claim offer", error);
// //     }else{
// //       resolve(claimOffer);
// //     }
// //   }];
// // }

// // RCT_EXPORT_METHOD(deserializeClaimOffer: (NSString *)serializedCredential
// //                   resolver: (RCTPromiseResolveBlock) resolve
// //                   rejecter: (RCTPromiseRejectBlock) reject)
// // {
// //   // it would return an error code and an integer credential handle in callback
// //   [[[VertiTransferVCX alloc] init] credentialDeserialize:serializedCredential
// //                                           completion:^(NSError *error, NSInteger credentailHandle) {
// //     if (error != nil && error.code != 0) {
// //       NSString *indyErrorCode = [NSString stringWithFormat:@"%ld", (long)error.code];
// //       reject(indyErrorCode, @"Error occurred while deserializing claim offer", error);
// //     }
// //     else {
// //       resolve(@(credentailHandle));
// //     }
// //   }];
// // }

// // RCT_EXPORT_METHOD(sendClaimRequest: (NSInteger) credentialHandle
// //                   withConnectionHandle: (NSInteger) connectionHandle
// //                   withPaymentHandle: (NSInteger) paymentHandle
// //                   resolver: (RCTPromiseResolveBlock) resolve
// //                   rejecter: (RCTPromiseRejectBlock) reject)
// // {
// //   [[[VertiTransferVCX alloc] init] credentialSendRequest:credentialHandle
// //                                     connectionHandle:connectionHandle
// //                                        paymentHandle:paymentHandle
// //                                           completion:^(NSError *error) {
// //     if (error != nil && error.code != 0)
// //     {
// //       NSString *indyErrorCode = [NSString stringWithFormat:@"%ld", (long)error.code];
// //       reject(indyErrorCode, @"Error occurred while sending claim request", error);
// //     }
// //     else {
// //       resolve(@{});
// //     }
// //   }];
// // }

// // RCT_EXPORT_METHOD(initWithConfig: (NSString *)config
// //               resolver: (RCTPromiseResolveBlock) resolve
// //               rejecter: (RCTPromiseRejectBlock) reject)
// // {
// //   NSError *error = nil; // remove this line after integrating libvcx method
// //   if (error != nil && error.code != 0)
// //   {
// //     NSString *indyErrorCode = [NSString stringWithFormat:@"%ld", (long)error.code];
// //     reject(indyErrorCode, @"Init failed with error", error);
// //   } else {
// //     resolve(@{});
// //   }
// // }

// // RCT_EXPORT_METHOD(createOneTimeInfo: (NSString *)config
// //                            resolver: (RCTPromiseResolveBlock) resolve
// //                            rejecter: (RCTPromiseRejectBlock) reject)
// // {
// //   [[[VertiTransferVCX alloc] init] agentProvisionAsync:config completion:^(NSError *error, NSString *oneTimeInfo) {
// //     NSLog(@"createOneTimeInfo callback:%@",oneTimeInfo);
// //     if (error != nil && error.code != 0)
// //     {
// //       NSString *indyErrorCode = [NSString stringWithFormat:@"%ld", (long)error.code];
// //       reject(indyErrorCode, [NSString stringWithFormat:@"Error occurred while creating one time info: %@ :: %ld",error.domain, (long)error.code], error);

// //     }else{
// //       resolve(oneTimeInfo);
// //     }
// //   }];
// // }

// // RCT_EXPORT_METHOD(createConnectionWithInvite: (NSString *)invitationId
// //                                inviteDetails: (NSString *)inviteDetails
// //                                     resolver: (RCTPromiseResolveBlock) resolve
// //                                     rejecter: (RCTPromiseRejectBlock) reject)
// // {
// //   [[[VertiTransferVCX alloc] init] connectionCreateWithInvite:invitationId
// //                                             inviteDetails:inviteDetails
// //                                                completion:^(NSError *error, NSInteger connectionHandle) {
// //      if (error != nil && error.code != 0)
// //      {
// //        NSString *indyErrorCode = [NSString stringWithFormat:@"%ld", (long)error.code];
// //        reject(indyErrorCode, @"Error occurred while creating connection", error);
// //      } else {
// //        resolve(@(connectionHandle));
// //      }
// //   }];
// // }

// // RCT_EXPORT_METHOD(vcxAcceptInvitation: (NSInteger )connectionHandle
// //                     connectionType: (NSString *)connectionType
// //                           resolver: (RCTPromiseResolveBlock) resolve
// //                           rejecter: (RCTPromiseRejectBlock) reject)
// // {
// //    [[[VertiTransferVCX alloc] init] connectionConnect:connectionHandle
// //                                             connectionType:connectionType
// //                                                completion:^(NSError *error, NSString *inviteDetails) {

// //     if (error != nil && error.code != 0)
// //     {
// //       NSString *indyErrorCode = [NSString stringWithFormat:@"%ld", (long)error.code];
// //       reject(indyErrorCode, @"Error occurred while accepitng connection", error);
// //     } else {
// //       resolve(inviteDetails);
// //     }
// //    }];

// // }

// // RCT_EXPORT_METHOD(vcxUpdatePushToken: (NSString *)config
// //                          resolver: (RCTPromiseResolveBlock) resolve
// //                          rejecter: (RCTPromiseRejectBlock) reject)
// // {
// //   [[[VertiTransferVCX alloc] init] agentUpdateInfo:config completion:^(NSError *error) {
// //     if (error != nil && error.code != 0)
// //     {
// //       NSString *indyErrorCode = [NSString stringWithFormat:@"%ld", (long)error.code];
// //       reject(indyErrorCode, @"Error occurred while updating push token", error);
// //     } else {
// //       resolve(@{});
// //     }
// //   }];
// // }

// // RCT_EXPORT_METHOD(getGenesisPathWithConfig: (NSString *)config
// //                         fileName: (NSString *)fileName
// //                        resolver: (RCTPromiseResolveBlock) resolve
// //                        rejecter: (RCTPromiseRejectBlock) reject)
// // {
// //   NSError *error;
// //   NSString *filePath = [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject] stringByAppendingPathComponent:fileName];
// //   NSFileManager *fileManager = [NSFileManager defaultManager];
// //   if (![fileManager fileExistsAtPath: filePath])
// //   {
// //     NSInteger *success=[config writeToFile:filePath atomically:YES encoding:NSUTF8StringEncoding error:&error];
// //     if(!success)
// //     {
// //       resolve(@"error while creating genesis file");
// //     }
// //   }
// //   resolve(filePath);
// // }

// // RCT_EXPORT_METHOD(updateClaimOfferState: (int)credentialHandle
// //                   resolver: (RCTPromiseResolveBlock) resolve
// //                   rejecter: (RCTPromiseRejectBlock) reject)
// // {
// //   [[[VertiTransferVCX alloc] init] credentialUpdateState:credentialHandle
// //                                           completion:^(NSError *error, NSInteger state)
// //   {
// //     if (error != nil && error.code != 0) {
// //       NSString *indyErrorCode = [NSString stringWithFormat:@"%ld", (long)error.code];
// //       reject(indyErrorCode, @"Error occurred while updating claim offer state", error);
// //     }
// //     else {
// //       resolve(@(state));
// //     }
// //   }];
// // }

// // RCT_EXPORT_METHOD(getClaimOfferState: (int)credentialHandle
// //                   resolver: (RCTPromiseResolveBlock) resolve
// //                   rejecter: (RCTPromiseRejectBlock) reject)
// // {
// //   // TODO: Add vcx wrapper method for vcx_credential_get_state
// //   // call vcx_credential_get_state and pass credentialHandle

// //   [[[VertiTransferVCX alloc] init] credentialGetState:credentialHandle completion:^(NSError *error, NSInteger state) {
// //     if (error != nil && error.code != 0) {
// //       NSString *indyErrorCode = [NSString stringWithFormat:@"%ld", (long)error.code];
// //       reject(indyErrorCode, @"Error occurred while getting claim offer state", error);
// //     }
// //     else {
// //       resolve(@(state));
// //     }
// //   }];
// // }

// // RCT_EXPORT_METHOD(getClaimVcx: (int)credentialHandle
// //                   resolver: (RCTPromiseResolveBlock) resolve
// //                   rejecter: (RCTPromiseRejectBlock) reject)
// // {
// //   [[[VertiTransferVCX alloc] init] getCredential:credentialHandle completion:^(NSError *error, NSString *credential) {
// //     if (error != nil && error.code != 0) {
// //       NSString *indyErrorCode = [NSString stringWithFormat:@"%ld", (long)error.code];
// //       reject(indyErrorCode, @"Error occurred while getting claim", error);
// //     }
// //     else {
// //       resolve(credential);
// //     }
// //   }];
// // }

// // RCT_EXPORT_METHOD(exportWallet: (NSString *)exportPath
// //                                encryptWith: (NSString *)encryptionKey
// //                                     resolver: (RCTPromiseResolveBlock) resolve
// //                                     rejecter: (RCTPromiseRejectBlock) reject)
// // {
// //   [[[VertiTransferVCX alloc] init] exportWallet:exportPath
// //                                 encryptWith:encryptionKey
// //                                 completion:^(NSError *error, NSInteger exportHandle) {
// //      if (error != nil && error.code != 0)
// //      {
// //        NSString *indyErrorCode = [NSString stringWithFormat:@"%ld", (long)error.code];
// //        reject(indyErrorCode, @"Error occurred while exporting wallet", error);
// //      } else {
// //        resolve(@(exportHandle));
// //      }
// //   }];
// // }

// // RCT_EXPORT_METHOD(setWalletItem: (NSString *) key
// //                           value: (NSString *) value
// //                        resolver: (RCTPromiseResolveBlock) resolve
// //                        rejecter: (RCTPromiseRejectBlock)reject)
// // {
// //   NSString *recordType = @"record_type";
// //   [[[VertiTransferVCX alloc] init] addRecordWallet:recordType
// //                                       recordId:key
// //                                    recordValue:value
// //                                     completion:^(NSError *error) {
// //     if (error != nil && error.code != 0)
// //     {
// //       NSString *indyErrorCode = [NSString stringWithFormat:@"%ld", (long)error.code];
// //       reject(indyErrorCode, [NSString stringWithFormat:@"Error occurred while adding wallet item: %@ :: %ld",error.domain, (long)error.code], error);
// //     } else {
// //       resolve(@0);
// //     }
// //   }];
// // }

// // RCT_EXPORT_METHOD(getWalletItem: (NSString *) key
// //                        resolver: (RCTPromiseResolveBlock) resolve
// //                        rejecter: (RCTPromiseRejectBlock) reject)
// // {
// //   NSString *recordType = @"record_type";
// //   [[[VertiTransferVCX alloc] init] getRecordWallet:recordType
// //                                       recordId:key
// //                                     completion:^(NSError *error, NSString *result)
// //    {
// //      if (error != nil && error.code != 0)
// //      {
// //        NSString *indyErrorCode = [NSString stringWithFormat:@"%ld", (long)error.code];
// //        reject(indyErrorCode, [NSString stringWithFormat:@"Error occurred while getting wallet item: %@ :: %ld",error.domain, (long)error.code], error);
// //      } else {
// //        resolve(result);
// //      }
// //    }];
// // }

// // RCT_EXPORT_METHOD(deleteWalletItem: (NSString *) key
// //                        resolver: (RCTPromiseResolveBlock) resolve
// //                        rejecter: (RCTPromiseRejectBlock) reject)
// // {
// //   NSString *recordType = @"record_type";
// //   [[[VertiTransferVCX alloc] init] deleteRecordWallet:recordType
// //                                          recordId:key
// //                                        completion:^(NSError *error) {
// //      if (error != nil && error.code != 0)
// //      {
// //        NSString *indyErrorCode = [NSString stringWithFormat:@"%ld", (long)error.code];
// //        reject(indyErrorCode, [NSString stringWithFormat:@"Error occurred while deleting wallet item: %@ :: %ld",error.domain, (long)error.code], error);
// //      } else {
// //        resolve(@0);
// //      }
// //   }];
// // }

// // RCT_EXPORT_METHOD(updateWalletItem: (NSString *) key
// //                              value: (NSString *) value
// //                           resolver: (RCTPromiseResolveBlock) resolve
// //                           rejecter: (RCTPromiseRejectBlock) reject)
// // {
// //   NSString *recordType = @"record_type";

// //   [[[VertiTransferVCX alloc] init] updateRecordWallet:recordType
// //                                      withRecordId:key
// //                                   withRecordValue:value
// //                                    withCompletion:^(NSError *error) {
// //      if (error != nil && error.code != 0)
// //      {
// //        NSString *indyErrorCode = [NSString stringWithFormat:@"%ld", (long)error.code];
// //        reject(indyErrorCode, [NSString stringWithFormat:@"Error occurred while updating wallet item: %@ :: %ld",error.domain, (long)error.code], error);
// //      } else {
// //        resolve(@0);
// //      }
// //   }];
// // }

// // RCT_EXPORT_METHOD(proofCreateWithMsgId: (NSString *)sourceId
// //                   withConnectionHandle: (NSInteger)connectionHandle
// //                   withMsgId: (NSString *)msgId
// //                   resolver: (RCTPromiseResolveBlock) resolve
// //                   rejecter: (RCTPromiseRejectBlock) reject)
// // {
// //   [[[VertiTransferVCX alloc] init] proofCreateWithMsgId:sourceId
// //                                withConnectionHandle:connectionHandle
// //                                           withMsgId:msgId
// //                                      withCompletion:^(NSError *error, vcx_proof_handle_t proofHandle, NSString *proofRequest)
// //   {
// //     if (error != nil && error.code != 0) {
// //       NSString *indyErrorCode = [NSString stringWithFormat:@"%ld", (long)error.code];
// //       reject(indyErrorCode, @"Error occurred while downloading proof request", error);
// //     }
// //     else {
// //       resolve(@{
// //                 @"proofHandle": @(proofHandle),
// //                 @"proofRequest": proofRequest
// //                 });
// //     }
// //   }];
// // }

// // RCT_EXPORT_METHOD(proofRetrieveCredentials:(NSInteger)proofHandle
// //                   resolver: (RCTPromiseResolveBlock) resolve
// //                   rejecter: (RCTPromiseRejectBlock) reject)
// // {
// //   [[[VertiTransferVCX alloc] init] proofRetrieveCredentials:proofHandle
// //                                          withCompletion:^(NSError *error, NSString *matchingCredentials)
// //   {
// //     if (error != nil && error.code != 0) {
// //       NSString *indyErrorCode = [NSString stringWithFormat:@"%ld", (long)error.code];
// //       reject(indyErrorCode, @"Error occurred while retrieving matching credentials", error);
// //     }
// //     else {
// //       resolve(matchingCredentials);
// //     }
// //   }];
// // }

// // RCT_EXPORT_METHOD(proofGenerate:(NSInteger)proofHandle
// //                   withSelectedCredentials:(NSString *)selectedCredentials
// //                   withSelfAttestedAttrs:(NSString *)selfAttestedAttributes
// //                   resolver: (RCTPromiseResolveBlock) resolve
// //                   rejecter: (RCTPromiseRejectBlock) reject)
// // {
// //   [[[VertiTransferVCX alloc] init] proofGenerate:proofHandle
// //                      withSelectedCredentials:selectedCredentials
// //                        withSelfAttestedAttrs:selfAttestedAttributes
// //                               withCompletion:^(NSError *error)
// //   {
// //     if (error != nil && error.code != 0) {
// //       NSString *indyErrorCode = [NSString stringWithFormat:@"%ld", (long)error.code];
// //       reject(indyErrorCode, @"Error occurred while generating proof", error);
// //     }
// //     else {
// //       resolve(@{});
// //     }
// //   }];
// // }

// // RCT_EXPORT_METHOD(proofSend:(NSInteger)proof_handle
// //                   withConnectionHandle:(NSInteger)connection_handle
// //                   resolver: (RCTPromiseResolveBlock) resolve
// //                   rejecter: (RCTPromiseRejectBlock) reject)
// // {
// //   [[[VertiTransferVCX alloc] init] proofSend:proof_handle
// //                     withConnectionHandle:connection_handle
// //                           withCompletion:^(NSError *error)
// //   {
// //     if (error != nil && error.code != 0) {
// //       NSString *indyErrorCode = [NSString stringWithFormat:@"%ld", (long)error.code];
// //       reject(indyErrorCode, @"Error occurred while sending proof", error);
// //     }
// //     else {
// //       resolve(@{});
// //     }
// //   }];
// // }

// // RCT_EXPORT_METHOD(proofCreateWithRequest:(NSString*)sourceId
// //                   withProofRequest:(NSString*)proofRequest
// //                   resolver: (RCTPromiseResolveBlock) resolve
// //                   rejecter: (RCTPromiseRejectBlock) reject)
// // {
// //   [[[VertiTransferVCX alloc] init] proofCreateWithRequest:sourceId
// //                                      withProofRequest:proofRequest
// //                                        withCompletion:^(NSError *error, vcx_proof_handle_t proofHandle)
// //   {
// //     if (error != nil && error.code != 0) {
// //       NSString *indyErrorCode = [NSString stringWithFormat:@"%ld", (long)error.code];
// //       reject(indyErrorCode, @"Error occurred while creating proof request", error);
// //     }
// //     else {
// //       resolve(@(proofHandle));
// //     }
// //   }];
// // }

// // RCT_EXPORT_METHOD(proofSerialize:(NSInteger)proofHandle
// //                   resolver: (RCTPromiseResolveBlock) resolve
// //                   rejecter: (RCTPromiseRejectBlock) reject)
// // {
// //   [[[VertiTransferVCX alloc] init] proofSerialize:proofHandle
// //                                withCompletion:^(NSError *error, NSString *proof_request)
// //   {
// //     if (error != nil && error.code != 0) {
// //       NSString *indyErrorCode = [NSString stringWithFormat:@"%ld", (long)error.code];
// //       reject(indyErrorCode, @"Error occurred while serializing proof request", error);
// //     }
// //     else {
// //       resolve(proof_request);
// //     }
// //   }];
// // }

// // RCT_EXPORT_METHOD(proofDeserialize:(NSString *)serializedProof
// //                   resolver: (RCTPromiseResolveBlock) resolve
// //                   rejecter: (RCTPromiseRejectBlock) reject)
// // {
// //   [[[VertiTransferVCX alloc] init] proofDeserialize:serializedProof
// //                                  withCompletion:^(NSError *error, vcx_proof_handle_t proofHandle)
// //   {
// //     if (error != nil && error.code != 0) {
// //       NSString *indyErrorCode = [NSString stringWithFormat:@"%ld", (long)error.code];
// //       reject(indyErrorCode, @"Error occurred while de-serializing proof request", error);
// //     }
// //     else {
// //       resolve(@(proofHandle));
// //     }
// //   }];
// // }

// // RCT_EXPORT_METHOD(downloadMessages: (NSString *) messageStatus
// //                              uid_s: (NSString *) uid_s
// //                             pwdids: (NSString *) pwdids
// //                           resolver: (RCTPromiseResolveBlock) resolve
// //                           rejecter: (RCTPromiseRejectBlock) reject)
// // {
// //   [[[VertiTransferVCX alloc] init] downloadMessages: messageStatus uid_s:uid_s pwdids:pwdids completion:^(NSError *error, NSString *messages) {
// //     if (error != nil && error.code !=0) {
// //       NSString *indyErrorCode = [NSString stringWithFormat:@"%ld", (long)error.code];
// //       reject(indyErrorCode, @"Error occured while downloading messages", error);
// //     } else{
// //       resolve(messages);
// //     }
// //   }];
// // }
// //  RCT_EXPORT_METHOD(updateMessages: (NSString *)messageStatus
// //                       pwdidsJson: (NSString *)pwdidsJson
// //                         resolver: (RCTPromiseResolveBlock) resolve
// //                         rejecter: (RCTPromiseRejectBlock) reject)
// // {
// //   [[[VertiTransferVCX alloc] init] updateMessages:messageStatus pwdidsJson:pwdidsJson completion:^(NSError *error) {
// //     if (error != nil && error.code !=0) {
// //       NSString *indyErrorCode = [NSString stringWithFormat:@"%ld", (long)error.code];
// //       reject(indyErrorCode, @"Error occured while updating message status", error);
// //     } else {
// //       resolve(@{});
// //     }
// //   }];
// // }

// // RCT_EXPORT_METHOD(getTokenInfo:(NSInteger) paymentHandle
// //                   resolver: (RCTPromiseResolveBlock) resolve
// //                   rejecter: (RCTPromiseRejectBlock) reject)
// // {
// //   [[[VertiTransferVCX alloc] init] getTokenInfo:paymentHandle withCompletion:^(NSError *error, NSString *tokenInfo) {
// //     if (error != nil && error.code != 0)
// //     {
// //       NSString *indyErrorCode = [NSString stringWithFormat:@"%ld", (long)error.code];
// //       reject(indyErrorCode, @"Error occurred while getting token info", error);
// //     } else {
// //       resolve(tokenInfo);
// //     }
// //   }];
// // }

// // RCT_EXPORT_METHOD(sendTokens:(NSInteger) paymentHandle
// //                   withTokens:(NSString *) tokens
// //                   withRecipient:(NSString *) recipient
// //                   resolver: (RCTPromiseResolveBlock) resolve
// //                   rejecter: (RCTPromiseRejectBlock) reject)
// // {
// //   [[[VertiTransferVCX alloc] init] sendTokens:paymentHandle
// //                                withTokens:tokens
// //                             withRecipient:recipient
// //                            withCompletion:^(NSError *error, NSString *recipient)
// //   {
// //     if (error != nil && error.code != 0)
// //     {
// //       NSString *indyErrorCode = [NSString stringWithFormat:@"%ld", (long)error.code];
// //       reject(indyErrorCode, @"Error occurred while sending tokens", error);
// //     } else {
// //       resolve(recipient);
// //     }
// //   }];
// // }

// // RCT_EXPORT_METHOD(createPaymentAddress:(NSString*)seed
// //                   resolver: (RCTPromiseResolveBlock) resolve
// //                   rejecter: (RCTPromiseRejectBlock) reject)
// // {
// //   [[[VertiTransferVCX alloc] init] createPaymentAddress:seed
// //                                      withCompletion:^(NSError *error, NSString *address)
// //   {
// //     if (error != nil && error.code != 0)
// //     {
// //       NSString *indyErrorCode = [NSString stringWithFormat:@"%ld", (long)error.code];
// //       reject(indyErrorCode, @"Error occurred while creating payment address", error);
// //     } else {
// //       resolve(address);
// //     }
// //   }];
// // }

// // RCT_EXPORT_METHOD(createWalletKey: (NSInteger) lengthOfKey
// //                   resolver: (RCTPromiseResolveBlock) resolve
// //                   rejecter: (RCTPromiseRejectBlock) reject)
// // {
// //   // Generate secure random string
// //   NSMutableData *data = [NSMutableData dataWithLength:lengthOfKey];
// //   int result = SecRandomCopyBytes(NULL, lengthOfKey, data.mutableBytes);
// //   if (result == 0) {
// //     NSString* value = [data base64EncodedStringWithOptions:0];
// //     resolve(value);
// //   } else {
// //     reject(@"W-001", @"Error occurred while generating wallet key", nil);
// //   }
// // }

// // RCT_EXPORT_METHOD(getLedgerFees: (RCTPromiseResolveBlock) resolve
// //                   rejecter: (RCTPromiseRejectBlock) reject)
// // {
// //   [[[VertiTransferVCX alloc] init] getLedgerFees:^(NSError *error, NSString *fees) {
// //     if (error != nil && error.code != 0)
// //     {
// //       NSString *indyErrorCode = [NSString stringWithFormat:@"%ld", (long)error.code];
// //       reject(indyErrorCode, @"Error occurred while getting ledger fees", error);
// //     } else {
// //       resolve(fees);
// //     }
// //   }];
// // }

// // RCT_EXPORT_METHOD(getBiometricError: (RCTPromiseResolveBlock) resolve
// //                   rejecter: (RCTPromiseRejectBlock) reject)
// // {
// //     LAContext *context = [[LAContext alloc] init];
// //     NSError *error;

// //     if ([context canEvaluatePolicy:LAPolicyDeviceOwnerAuthenticationWithBiometrics error:&error]) {
// //       resolve(@"");
// //         // Device does not support TouchID
// //     } else {
// //       NSString *errorReason;
// //       switch (error.code) {
// //           case kLAErrorBiometryNotEnrolled:
// //               errorReason = @"BiometricsNotEnrolled";
// //               break;
// //           case kLAErrorBiometryLockout:
// //               errorReason = @"BiometricsLockOut";
// //               break;
// //           default:
// //               errorReason = @"default";
// //               break;
// //         }
// //         reject(errorReason, @"TouchIDBiometricsLockOut", nil);
// //     }
// // }

// @end






// --- START VeriTransfer.m

//
//  init.m
//  vcx
//
//  Created by GuestUser on 4/30/18.
//  Copyright © 2018 GuestUser. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RnIndy.h"

// #import "main.h"

// --- START VcxLogger.m


@interface VcxLogger

@property(strong, readwrite) NSMutableArray *callbacks;

@end

@implementation VcxLogger

+ (void)setDefaultLogger:(NSString *)pattern {
    vcx_set_default_logger([pattern UTF8String]);
}

+ (void)setLogger:(id)logCb {
    [VcxLogger sharedInstance].callbacks[0] = [logCb copy];
    vcx_set_logger(nil, nil, logCallback, nil);
}

+ (VcxLogger *)sharedInstance {
    static VcxLogger *instance = nil;
    static dispatch_once_t dispatch_once_block;

    dispatch_once(&dispatch_once_block, ^{
        instance = [VcxLogger new];
    });

    return instance;
}

- (VcxLogger *)init {
    self = [super init];
    if (self) {
        self.callbacks = [[NSMutableArray alloc] init];
    }
    return self;
}

void logCallback(const void *context,
        uint32_t level,
        const char *target,
        const char *message,
        const char *modulePath,
        const char *file,
        uint32_t line) {
    id block = [VcxLogger sharedInstance].callbacks[0];

    void (^completion)(NSObject *, NSNumber *, NSString *, NSString *, NSString *, NSString *, NSNumber *) =
    (void (^)(NSObject *context, NSNumber *level, NSString *target, NSString *message, NSString *modulePath, NSString *file, NSNumber *line)) block;
    NSObject *sarg0 = (__bridge NSObject *) context;
    NSNumber *sarg1 = @(level);
    NSString *sarg2 = [NSString stringWithUTF8String:target];
    NSString *sarg3 = [NSString stringWithUTF8String:message];
    NSString *sarg4 = [NSString stringWithUTF8String:modulePath];
    NSString *sarg5 = [NSString stringWithUTF8String:file];
    NSNumber *sarg6 = @(line);

    if (completion) {
        completion(sarg0, sarg1, sarg2, sarg3, sarg4, sarg5, sarg6);
    }
}

@end



// --- END VcxLogger.n

// --- START VcxCallbacks.mm


static NSString *commandCallbackKey = @"commandCallback";


@interface VcxCallbacks 

@property(strong, readwrite) NSMutableDictionary *commandCompletions;
@property int32_t commandHandleCounter;
@property(strong, readwrite) NSRecursiveLock *globalLock;

@end

@implementation VcxCallbacks

+ (VcxCallbacks *)sharedInstance {
    static VcxCallbacks *instance = nil;
    static dispatch_once_t dispatch_once_block;

    dispatch_once(&dispatch_once_block, ^{
        instance = [VcxCallbacks new];
    });

    return instance;
}

- (VcxCallbacks *)init {
    self = [super init];
    if (self) {
        self.commandHandleCounter = 0;
        self.commandCompletions = [[NSMutableDictionary alloc] init];
        self.globalLock = [NSRecursiveLock new];
    }
    return self;
}

// MARK: - Create command handle and store callback

- (vcx_command_handle_t)createCommandHandleFor:(id)callback {
    NSNumber *handle = nil;

    @synchronized (self.globalLock) {
        handle = [NSNumber numberWithInt:self.commandHandleCounter];
        self.commandHandleCounter++;

        NSMutableDictionary *dict = [NSMutableDictionary new];
        dict[commandCallbackKey] = [callback copy];

        self.commandCompletions[handle] = dict;
    }
    return (vcx_command_handle_t) [handle integerValue];
}

- (void)deleteCommandHandleFor:(vcx_command_handle_t)handle {
    NSNumber *key = [NSNumber numberWithInt:handle];
    @synchronized (self.globalLock) {
        if ([self.commandCompletions objectForKey:key]) {
            [self.commandCompletions removeObjectForKey:key];
        }
    }
}

- (id)commandCompletionFor:(vcx_command_handle_t)handle {
    NSNumber *key = [NSNumber numberWithInt:handle];
    id val = nil;
    @synchronized (self.globalLock) {
        NSMutableDictionary *dict = (NSMutableDictionary *) [self.commandCompletions objectForKey:key];
        val = [dict objectForKey:@"commandCallback"];
    }
    return val;
}

- (void)complete:(void (^)(NSError *))completion
       forHandle:(vcx_command_handle_t)handle
         ifError:(vcx_error_t)ret {
    if (ret != Success) {
        [self deleteCommandHandleFor:handle];
        dispatch_async(dispatch_get_main_queue(), ^{
            completion([NSError errorFromVcxError:ret]);
        });
    }
}

- (void)completeBool:(void (^)(NSError *, BOOL))completion
           forHandle:(vcx_command_handle_t)handle
             ifError:(vcx_error_t)ret {
    if (ret != Success) {
        [self deleteCommandHandleFor:handle];
        dispatch_async(dispatch_get_main_queue(), ^{
            completion([NSError errorFromVcxError:ret], false);
        });
    }
}

- (void)completeStr:(void (^)(NSError *, NSString *))completion
          forHandle:(vcx_command_handle_t)handle
            ifError:(vcx_error_t)ret {
    if (ret != Success) {
        [self deleteCommandHandleFor:handle];
        dispatch_async(dispatch_get_main_queue(), ^{
            completion([NSError errorFromVcxError:ret], nil);
        });
    }
}

- (void)complete2Str:(void (^)(NSError *, NSString *, NSString *))completion
           forHandle:(vcx_command_handle_t)handle
             ifError:(vcx_error_t)ret {
    if (ret != Success) {
        [self deleteCommandHandleFor:handle];
        dispatch_async(dispatch_get_main_queue(), ^{
            completion([NSError errorFromVcxError:ret], nil, nil);
        });
    }
}

- (void)completeData:(void (^)(NSError *, NSData *))completion
           forHandle:(vcx_command_handle_t)handle
             ifError:(vcx_error_t)ret {
    if (ret != Success) {
        [self deleteCommandHandleFor:handle];
        dispatch_async(dispatch_get_main_queue(), ^{
            completion([NSError errorFromVcxError:ret], nil);
        });
    }
}

- (void)complete2Data:(void (^)(NSError *, NSData *, NSData *))completion
            forHandle:(vcx_command_handle_t)handle
              ifError:(vcx_error_t)ret {
    if (ret != Success) {
        [self deleteCommandHandleFor:handle];
        dispatch_async(dispatch_get_main_queue(), ^{
            completion([NSError errorFromVcxError:ret], nil, nil);
        });
    }
}

- (void)completeStringAndData:(void (^)(NSError *, NSString *, NSData *))completion
                    forHandle:(vcx_command_handle_t)handle
                      ifError:(vcx_error_t)ret {
    if (ret != Success) {
        [self deleteCommandHandleFor:handle];
        dispatch_async(dispatch_get_main_queue(), ^{
            completion([NSError errorFromVcxError:ret], nil, nil);
        });
    }
}

@end

// MARK: - static indy C-callbacks




// --- END VcxCallbacks.mm


// --- START NSError+VcxError.m


static NSString *const VcxErrorDomain = @"VcxErrorDomain";

@implementation NSError (VcxError)

+ (NSError*) errorFromVcxError:(vcx_error_t) error
{
    NSMutableDictionary *userInfo = [NSMutableDictionary new];

    if (error != Success) {
        const char * error_json_p;
            vcx_get_current_error(&error_json_p);

            NSString *errorDetailsJson = [NSString stringWithUTF8String:error_json_p];

            NSError *error;
            NSDictionary *errorDetails = [NSJSONSerialization JSONObjectWithData:[NSData dataWithBytes:[errorDetailsJson UTF8String]
                                                                                                length:[errorDetailsJson length]]
                                                                                            options:kNilOptions
                                                                                            error: &error];

           [userInfo setValue:errorDetails[@"error"] forKey:@"sdk_message"];
            [userInfo setValue:errorDetails[@"message"] forKey:@"sdk_full_message"];
            [userInfo setValue:errorDetails[@"cause"] forKey:@"sdk_cause"];
            [userInfo setValue:errorDetails[@"backtrace"] forKey:@"sdk_backtrace"];
       }

    return [NSError errorWithDomain:VcxErrorDomain code: error userInfo:userInfo];
}

@end


// --- END NSError+VcxError.m

// -- rnindy




#import <React/RCTLog.h>
#import <LocalAuthentication/LocalAuthentication.h>
#import <React/RCTUtils.h>
#import "React/RCTConvert.h"


// import RCTBridge
#if __has_include(<React/RCTBridge.h>)
#import <React/RCTBridge.h>
#elif __has_include("RCTBridge.h")
#import "RCTBridge.h"
#else
#import "React/RCTBridge.h" // Required when used as a Pod in a Swift project
#endif

// import RCTEventDispatcher
#if __has_include(<React/RCTEventDispatcher.h>)
#import <React/RCTEventDispatcher.h>
#elif __has_include("RCTEventDispatcher.h")
#import "RCTEventDispatcher.h"
#else
#import "React/RCTEventDispatcher.h" // Required when used as a Pod in a Swift project
#endif

// #import "vcx/vcx/vcx.h"

// -- end rnindy

void VcxWrapperCommonCallback(vcx_command_handle_t xcommand_handle,
                              vcx_error_t err) {
    id block = [[VcxCallbacks sharedInstance] commandCompletionFor:xcommand_handle];
    [[VcxCallbacks sharedInstance] deleteCommandHandleFor:xcommand_handle];

    void (^completion)(NSError *) = (void (^)(NSError *)) block;

    if (completion) {
        dispatch_async(dispatch_get_main_queue(), ^{
            NSError *error = [NSError errorFromVcxError:err];
            completion(error);
        });
    }
}

void VcxWrapperCommonHandleCallback(vcx_command_handle_t xcommand_handle,
                                    vcx_error_t err,
                                    vcx_command_handle_t pool_handle) {
    id block = [[VcxCallbacks sharedInstance] commandCompletionFor:xcommand_handle];
    [[VcxCallbacks sharedInstance] deleteCommandHandleFor:xcommand_handle];

    void (^completion)(NSError *, VcxHandle) = (void (^)(NSError *, VcxHandle)) block;

    if (completion) {
        dispatch_async(dispatch_get_main_queue(), ^{
            NSError *error = [NSError errorFromVcxError:err];
            completion(error, (VcxHandle) pool_handle);
        });
    }
}

void VcxWrapperCommonNumberCallback(vcx_command_handle_t xcommand_handle,
                                    vcx_error_t err,
                                    vcx_command_handle_t handle) {
    id block = [[VcxCallbacks sharedInstance] commandCompletionFor:xcommand_handle];
    [[VcxCallbacks sharedInstance] deleteCommandHandleFor:xcommand_handle];

    void (^completion)(NSError *, vcx_command_handle_t) = (void (^)(NSError *, vcx_command_handle_t)) block;

    if (completion) {
        dispatch_async(dispatch_get_main_queue(), ^{
            NSError *error = [NSError errorFromVcxError:err];
            completion(error, handle);
        });
    }
}

void VcxWrapperCommonStringCallback(vcx_command_handle_t xcommand_handle,
                                    vcx_error_t err,
                                    const char *const arg1) {
    id block = [[VcxCallbacks sharedInstance] commandCompletionFor:xcommand_handle];
    [[VcxCallbacks sharedInstance] deleteCommandHandleFor:xcommand_handle];

    void (^completion)(NSError *, NSString *) = (void (^)(NSError *, NSString *arg1)) block;
    NSString *sarg1 = nil;
    if (arg1) {
        sarg1 = [NSString stringWithUTF8String:arg1];
    }

    if (completion) {
        dispatch_async(dispatch_get_main_queue(), ^{
            NSError *error = [NSError errorFromVcxError:err];
            completion(error, sarg1);
        });
    }
}

void VcxWrapperCommonBoolCallback(vcx_command_handle_t xcommand_handle,
                                  vcx_error_t err,
                                  unsigned int arg1) {
    id block = [[VcxCallbacks sharedInstance] commandCompletionFor:xcommand_handle];
    [[VcxCallbacks sharedInstance] deleteCommandHandleFor:xcommand_handle];

    void (^completion)(NSError *, BOOL) = (void (^)(NSError *, BOOL arg1)) block;

    if (completion) {
        dispatch_async(dispatch_get_main_queue(), ^{
            NSError *error = [NSError errorFromVcxError:err];
            completion(error, (BOOL) arg1);
        });
    }
}

void VcxWrapperCommonStringStringCallback(vcx_command_handle_t xcommand_handle,
                                          vcx_error_t err,
                                          const char *const arg1,
                                          const char *const arg2) {
    id block = [[VcxCallbacks sharedInstance] commandCompletionFor:xcommand_handle];
    [[VcxCallbacks sharedInstance] deleteCommandHandleFor:xcommand_handle];

    void (^completion)(NSError *, NSString *arg1, NSString *arg2) = (void (^)(NSError *, NSString *arg1, NSString *arg2)) block;

    NSString *sarg1 = nil;
    if (arg1) {
        sarg1 = [NSString stringWithUTF8String:arg1];
    }
    NSString *sarg2 = nil;
    if (arg2) {
        sarg2 = [NSString stringWithUTF8String:arg2];
    }

    if (completion) {
        dispatch_async(dispatch_get_main_queue(), ^{
            NSError *error = [NSError errorFromVcxError:err];
            completion(error, sarg1, sarg2);
        });
    }
}

void VcxWrapperCommonStringOptStringCallback(vcx_command_handle_t xcommand_handle,
                                             vcx_error_t err,
                                             const char *const arg1,
                                             const char *const arg2) {
    id block = [[VcxCallbacks sharedInstance] commandCompletionFor:xcommand_handle];
    [[VcxCallbacks sharedInstance] deleteCommandHandleFor:xcommand_handle];

    void (^completion)(NSError *, NSString *arg1, NSString *arg2) = (void (^)(NSError *, NSString *arg1, NSString *arg2)) block;

    NSString *sarg1 = nil;
    if (arg1) {
        sarg1 = [NSString stringWithUTF8String:arg1];
    }
    NSString *sarg2 = nil;
    if (arg2) {
        sarg2 = [NSString stringWithUTF8String:arg2];
    }

    if (completion) {
        dispatch_async(dispatch_get_main_queue(), ^{
            NSError *error = [NSError errorFromVcxError:err];
            completion(error, sarg1, sarg2);
        });
    }
}

void VcxWrapperCommonStringOptStringOptStringCallback(vcx_command_handle_t xcommand_handle,
                                                      vcx_error_t err,
                                                      const char *const arg1,
                                                      const char *const arg2,
                                                      const char *const arg3) {
    id block = [[VcxCallbacks sharedInstance] commandCompletionFor:xcommand_handle];
    [[VcxCallbacks sharedInstance] deleteCommandHandleFor:xcommand_handle];

    void (^completion)(NSError *, NSString *arg1, NSString *arg2, NSString *arg3) = (void (^)(NSError *, NSString *arg1, NSString *arg2, NSString *arg3)) block;

    NSString *sarg1 = nil;
    if (arg1) {
        sarg1 = [NSString stringWithUTF8String:arg1];
    }
    NSString *sarg2 = nil;
    if (arg2) {
        sarg2 = [NSString stringWithUTF8String:arg2];
    }
    NSString *sarg3 = nil;
    if (arg3) {
        sarg3 = [NSString stringWithUTF8String:arg3];
    }

    if (completion) {
        dispatch_async(dispatch_get_main_queue(), ^{
            NSError *error = [NSError errorFromVcxError:err];
            completion(error, sarg1, sarg2, sarg3);
        });
    }
}

void VcxWrapperCommonStringStringStringCallback(vcx_command_handle_t xcommand_handle,
                                                vcx_error_t err,
                                                const char *const arg1,
                                                const char *const arg2,
                                                const char *const arg3) {
    id block = [[VcxCallbacks sharedInstance] commandCompletionFor:xcommand_handle];
    [[VcxCallbacks sharedInstance] deleteCommandHandleFor:xcommand_handle];

    void (^completion)(NSError *, NSString *arg1, NSString *arg2, NSString *arg3) = (void (^)(NSError *, NSString *arg1, NSString *arg2, NSString *arg3)) block;

    NSString *sarg1 = nil;
    if (arg1) {
        sarg1 = [NSString stringWithUTF8String:arg1];
    }
    NSString *sarg2 = nil;
    if (arg2) {
        sarg2 = [NSString stringWithUTF8String:arg2];
    }
    NSString *sarg3 = nil;
    if (arg3) {
        sarg3 = [NSString stringWithUTF8String:arg3];
    }

    if (completion) {
        dispatch_async(dispatch_get_main_queue(), ^{
            NSError *error = [NSError errorFromVcxError:err];
            completion(error, sarg1, sarg2, sarg3);
        });
    }
}

/// Arguments arg1 and arg2 will be converted to nsdata
void VcxWrapperCommonDataCallback(vcx_command_handle_t xcommand_handle,
                                  vcx_error_t err,
                                  const uint8_t *const arg1,
                                  uint32_t arg2) {
    id block = [[VcxCallbacks sharedInstance] commandCompletionFor:xcommand_handle];
    [[VcxCallbacks sharedInstance] deleteCommandHandleFor:xcommand_handle];

    void (^completion)(NSError *, NSData *arg) = (void (^)(NSError *, NSData *arg)) block;

    NSData *sarg = [NSData dataWithBytes:arg1 length:arg2];

    if (completion) {
        dispatch_async(dispatch_get_main_queue(), ^{
            NSError *error = [NSError errorFromVcxError:err];
            completion(error, sarg);
        });
    }
}

void VcxWrapperCommonStringDataCallback(vcx_command_handle_t xcommand_handle,
                                        vcx_error_t err,
                                        const char *const arg1,
                                        const uint8_t *const arg2,
                                        uint32_t arg3) {
    id block = [[VcxCallbacks sharedInstance] commandCompletionFor:xcommand_handle];
    [[VcxCallbacks sharedInstance] deleteCommandHandleFor:xcommand_handle];

    void (^completion)(NSError *, NSString *, NSData *) = (void (^)(NSError *, NSString *, NSData *)) block;

    NSString *sarg1 = nil;
    if (arg1) {
        sarg1 = [NSString stringWithUTF8String:arg1];
    }
    NSData *sarg2 = nil;
    if (arg2) {
        sarg2 = [NSData dataWithBytes:arg2 length:arg3];
    }

    if (completion) {
        dispatch_async(dispatch_get_main_queue(), ^{
            NSError *error = [NSError errorFromVcxError:err];
            completion(error, sarg1, sarg2);
        });
    }
}

void VcxWrapperCommonStringStringLongCallback(vcx_command_handle_t xcommand_handle,
                                              vcx_error_t err,
                                              const char *arg1,
                                              const char *arg2,
                                              unsigned long long arg3) {
    id block = [[VcxCallbacks sharedInstance] commandCompletionFor:xcommand_handle];
    [[VcxCallbacks sharedInstance] deleteCommandHandleFor:xcommand_handle];

    void (^completion)(NSError *, NSString *, NSString *, NSNumber *) = (void (^)(NSError *, NSString *arg1, NSString *arg2, NSNumber *arg3)) block;
    NSString *sarg1 = nil;
    if (arg1) {
        sarg1 = [NSString stringWithUTF8String:arg1];
    }
    NSString *sarg2 = nil;
    if (arg2) {
        sarg2 = [NSString stringWithUTF8String:arg2];
    }
    NSNumber *sarg3 = [NSNumber numberWithInt:arg3];


    if (completion) {
        dispatch_async(dispatch_get_main_queue(), ^{
            NSError *error = [NSError errorFromVcxError:err];
            completion(error, (NSString *) sarg1, (NSString *) sarg2, (NSNumber *) sarg3);
        });
    }
}

void VcxWrapperCommonNumberStringCallback(vcx_command_handle_t xcommand_handle,
                                          vcx_error_t err,
                                          vcx_command_handle_t handle,
                                          const char *const arg2
                                          ) {
    id block = [[VcxCallbacks sharedInstance] commandCompletionFor:xcommand_handle];
    [[VcxCallbacks sharedInstance] deleteCommandHandleFor:xcommand_handle];

    void (^completion)(NSError *, vcx_command_handle_t arg1, NSString *arg2) = (void (^)(NSError *, vcx_command_handle_t arg1, NSString *arg2)) block;

    NSString *sarg2 = nil;
    if (arg2) {
        sarg2 = [NSString stringWithUTF8String:arg2];
    }

    if (completion) {
        dispatch_async(dispatch_get_main_queue(), ^{
            NSError *error = [NSError errorFromVcxError:err];
            completion(error, handle, (NSString *) sarg2);
        });
    }
}


@interface ConnectMeVcx 

@end

@implementation ConnectMeVcx

- (void)initWithConfig:(NSString *)config
            completion:(void (^)(NSError *error))completion
{
    const char *config_char = [config cString];
    vcx_command_handle_t handle= [[VcxCallbacks sharedInstance] createCommandHandleFor:completion] ;
    vcx_error_t ret = vcx_init_with_config(handle, config_char, VcxWrapperCommonCallback);
    if( ret != 0 )
    {
        [[VcxCallbacks sharedInstance] deleteCommandHandleFor: handle];

        dispatch_async(dispatch_get_main_queue(), ^{
            NSLog(@"ERROR: initWithConfig: calling completion");
            completion([NSError errorFromVcxError: ret]);
        });
    }

}

- (void)agentProvisionAsync:(NSString *)config
               completion:(void (^)(NSError *error, NSString *config))completion
{
    const char *config_char = [config cString];
    vcx_command_handle_t handle= [[VcxCallbacks sharedInstance] createCommandHandleFor:completion] ;
    vcx_error_t ret = vcx_agent_provision_async(handle, config_char, VcxWrapperCommonStringCallback);
    if( ret != 0 )
    {
        [[VcxCallbacks sharedInstance] deleteCommandHandleFor: handle];

        dispatch_async(dispatch_get_main_queue(), ^{
            NSLog(@"ERROR: agentProvision: calling completion");
            completion([NSError errorFromVcxError: ret], false);
        });
    }

}

- (void)connectionCreateWithInvite:(NSString *)invitationId
                inviteDetails:(NSString *)inviteDetails
             completion:(void (^)(NSError *error, NSInteger connectionHandle)) completion
{
   vcx_error_t ret;

   vcx_command_handle_t handle = [[VcxCallbacks sharedInstance] createCommandHandleFor:completion];
   const char *invitationId_char = [invitationId cString];
   const char *inviteDetails_char = [inviteDetails cString];
   ret = vcx_connection_create_with_invite(handle, invitationId_char, inviteDetails_char, VcxWrapperCommonHandleCallback);
   if( ret != 0 )
   {
       [[VcxCallbacks sharedInstance] deleteCommandHandleFor: handle];

       dispatch_async(dispatch_get_main_queue(), ^{
           completion([NSError errorFromVcxError: ret], 0);
       });
   }
}

- (void)connectionConnect: (NSInteger) connectionHandle
        connectionType: (NSString *) connectionType
            completion: (void (^)(NSError *error, NSString *inviteDetails)) completion
{
   vcx_error_t ret;

   vcx_command_handle_t handle = [[VcxCallbacks sharedInstance] createCommandHandleFor:completion];
   const char *connectionType_char = [connectionType cString];
    ret = vcx_connection_connect(handle, connectionHandle, connectionType_char, VcxWrapperCommonStringCallback);
   if( ret != 0 )
   {
       [[VcxCallbacks sharedInstance] deleteCommandHandleFor: handle];

       dispatch_async(dispatch_get_main_queue(), ^{
           completion([NSError errorFromVcxError: ret], nil);
       });
   }
}

- (void)connectionSerialize:(NSInteger)connectionHandle
                  completion:(void (^)(NSError *error, NSString *serializedConnection))completion{
    vcx_error_t ret;
   vcx_command_handle_t handle = [[VcxCallbacks sharedInstance] createCommandHandleFor:completion];

    ret = vcx_connection_serialize(handle, connectionHandle, VcxWrapperCommonStringCallback);

   if( ret != 0 )
   {
       [[VcxCallbacks sharedInstance] deleteCommandHandleFor: handle];

       dispatch_async(dispatch_get_main_queue(), ^{
           completion([NSError errorFromVcxError: ret],nil);
       });
   }
}

- (void)connectionDeserialize:(NSString *)serializedConnection
                    completion:(void (^)(NSError *error, NSInteger connectionHandle))completion{
   vcx_error_t ret;
   vcx_command_handle_t handle = [[VcxCallbacks sharedInstance] createCommandHandleFor:completion];
    const char *serialized_connection=[serializedConnection cString];
    ret = vcx_connection_deserialize(handle, serialized_connection, VcxWrapperCommonHandleCallback);

   if( ret != 0 )
   {
       [[VcxCallbacks sharedInstance] deleteCommandHandleFor: handle];

       dispatch_async(dispatch_get_main_queue(), ^{
           completion([NSError errorFromVcxError: ret],0);
       });
   }
}

- (void)deleteConnection:(VcxHandle)connectionHandle
          withCompletion:(void (^)(NSError *error))completion
{
    vcx_command_handle_t handle= [[VcxCallbacks sharedInstance] createCommandHandleFor:completion] ;
    vcx_error_t ret = vcx_connection_delete_connection(handle, connectionHandle, VcxWrapperCommonCallback);
    if( ret != 0 )
    {
        [[VcxCallbacks sharedInstance] deleteCommandHandleFor: handle];

        dispatch_async(dispatch_get_main_queue(), ^{
            NSLog(@"deleteConnection: calling completion");
            completion([NSError errorFromVcxError: ret]);
        });
    }
}

- (void)connectionSignData:(VcxHandle)connectionHandle
                   data:(NSData *)data
                completion:(void (^)(NSError *, NSData *signature))completion
{
    vcx_error_t ret;
    
    vcx_command_handle_t handle = [[VcxCallbacks sharedInstance] createCommandHandleFor:completion];
    uint8_t *data_raw = (uint8_t *) [data bytes];
    uint32_t data_length = (uint32_t) [data length];
    
    ret = vcx_connection_sign_data(handle, connectionHandle, data_raw, data_length, VcxWrapperCommonDataCallback);
    if( ret != 0 )
    {
        [[VcxCallbacks sharedInstance] deleteCommandHandleFor: handle];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            completion([NSError errorFromVcxError: ret], 0);
        });
    }
}

- (void)connectionVerifySignature:(VcxHandle)connectionHandle
                             data:(NSData *)data
                        signature:(NSData *)signature
                       completion:(void (^)(NSError *, BOOL *valid))completion
{
    vcx_error_t ret;
    
    vcx_command_handle_t handle = [[VcxCallbacks sharedInstance] createCommandHandleFor:completion];
    uint8_t *data_raw = (uint8_t *) [data bytes];
    uint32_t data_length = (uint32_t) [data length];
    uint8_t *signature_raw = (uint8_t *) [signature bytes];
    uint32_t signature_length = (uint32_t) [signature length];
    
    ret = vcx_connection_verify_signature(handle, connectionHandle, data_raw, data_length, signature_raw, signature_length, VcxWrapperCommonBoolCallback);
    if( ret != 0 )
    {
        [[VcxCallbacks sharedInstance] deleteCommandHandleFor: handle];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            completion([NSError errorFromVcxError: ret], 0);
        });
    }
}


- (void)agentUpdateInfo: (NSString *) config
            completion: (void (^)(NSError *error)) completion
{
   vcx_error_t ret;

   vcx_command_handle_t handle = [[VcxCallbacks sharedInstance] createCommandHandleFor:completion];
   const char *config_char = [config cString];
    ret = vcx_agent_update_info(handle, config_char, VcxWrapperCommonCallback);
   if( ret != 0 )
   {
       [[VcxCallbacks sharedInstance] deleteCommandHandleFor: handle];

       dispatch_async(dispatch_get_main_queue(), ^{
           completion([NSError errorFromVcxError: ret]);
       });
   }
}

- (void)getCredential:(NSInteger)credentialHandle
           completion:(void (^)(NSError *error, NSString *credential))completion {
    vcx_error_t ret;
    vcx_command_handle_t handle = [[VcxCallbacks sharedInstance] createCommandHandleFor:completion];
    ret = vcx_get_credential(handle, credentialHandle, VcxWrapperCommonStringCallback);

    if( ret != 0 )
    {
       [[VcxCallbacks sharedInstance] deleteCommandHandleFor: handle];

       dispatch_async(dispatch_get_main_queue(), ^{
           completion([NSError errorFromVcxError: ret], nil);
       });
    }
}

- (void)credentialCreateWithOffer:(NSString *)sourceId
            offer:(NSString *)credentialOffer
           completion:(void (^)(NSError *error, NSInteger credentialHandle))completion{
   vcx_error_t ret;
   vcx_command_handle_t handle = [[VcxCallbacks sharedInstance] createCommandHandleFor:completion];
   const char * credential_offer=[credentialOffer cString];
   const char * source_id = [sourceId cString];
    ret = vcx_credential_create_with_offer(handle, source_id,credential_offer, VcxWrapperCommonNumberCallback);

   if( ret != 0 )
   {
       [[VcxCallbacks sharedInstance] deleteCommandHandleFor: handle];

       dispatch_async(dispatch_get_main_queue(), ^{
           completion([NSError errorFromVcxError: ret], 0);
       });
   }
}

- (void)credentialCreateWithMsgid:(NSString *)sourceId
                 connectionHandle:(VcxHandle)connectionHandle
                            msgId:(NSString *)msgId
                       completion:(void (^)(NSError *error, NSInteger credentialHandle, NSString *credentialOffer))completion {
    vcx_error_t ret;
    vcx_command_handle_t handle = [[VcxCallbacks sharedInstance] createCommandHandleFor:completion];
    const char * source_id = [sourceId cString];
    const char * msg_id=[msgId cString];
    ret = vcx_credential_create_with_msgid(handle, source_id, connectionHandle, msg_id, VcxWrapperCommonNumberStringCallback);

    if( ret != 0 )
    {
       [[VcxCallbacks sharedInstance] deleteCommandHandleFor: handle];

       dispatch_async(dispatch_get_main_queue(), ^{
           completion([NSError errorFromVcxError: ret], 0, nil);
       });
    }
}

- (void)credentialSendRequest:(NSInteger)credentialHandle
             connectionHandle:(VcxHandle)connectionHandle
                paymentHandle:(vcx_payment_handle_t)paymentHandle
                   completion:(void (^)(NSError *))completion {
    vcx_error_t ret;
    vcx_command_handle_t handle = [[VcxCallbacks sharedInstance] createCommandHandleFor:completion];
    ret = vcx_credential_send_request(handle, credentialHandle, connectionHandle, paymentHandle, VcxWrapperCommonCallback);

    if( ret != 0 )
    {
       [[VcxCallbacks sharedInstance] deleteCommandHandleFor: handle];

       dispatch_async(dispatch_get_main_queue(), ^{
           completion([NSError errorFromVcxError: ret]);
       });
    }
}
- (void)credentialGetState:(NSInteger)credentialHandle
                completion:(void (^)(NSError *error, NSInteger state))completion{
    vcx_error_t ret;
    vcx_command_handle_t handle = [[VcxCallbacks sharedInstance] createCommandHandleFor:completion];
    ret = vcx_credential_get_state(handle, credentialHandle, VcxWrapperCommonNumberCallback);

    if( ret != 0 )
    {
       [[VcxCallbacks sharedInstance] deleteCommandHandleFor: handle];

       dispatch_async(dispatch_get_main_queue(), ^{
           completion([NSError errorFromVcxError: ret], 0);
       });
    }
}

- (void)credentialUpdateState:(NSInteger)credentialHandle
                   completion:(void (^)(NSError *error, NSInteger state))completion {
    vcx_error_t ret;
    vcx_command_handle_t handle = [[VcxCallbacks sharedInstance] createCommandHandleFor:completion];
    ret = vcx_credential_update_state(handle, credentialHandle, VcxWrapperCommonNumberCallback);

    if( ret != 0 )
    {
       [[VcxCallbacks sharedInstance] deleteCommandHandleFor: handle];

       dispatch_async(dispatch_get_main_queue(), ^{
           completion([NSError errorFromVcxError: ret], 0);
       });
    }
}

- (void)credentialGetOffers:(VcxHandle)connectionHandle
                   completion:(void (^)(NSError *error, NSString *offers))completion{
   vcx_error_t ret;
   vcx_command_handle_t handle = [[VcxCallbacks sharedInstance] createCommandHandleFor:completion];

    ret = vcx_credential_get_offers(handle,connectionHandle, VcxWrapperCommonStringCallback);

   if( ret != 0 )
   {
       [[VcxCallbacks sharedInstance] deleteCommandHandleFor: handle];

       dispatch_async(dispatch_get_main_queue(), ^{
           completion([NSError errorFromVcxError: ret],nil);
       });
   }
}
- (void)generateProof:(NSString *)proofRequestId
       requestedAttrs:(NSString *)requestedAttrs
  requestedPredicates:(NSString *)requestedPredicates
            proofName:(NSString *)proofName
           completion:(void (^)(NSError *error, NSString *proofHandle))completion;
{
    vcx_error_t ret;

    vcx_command_handle_t handle = [[VcxCallbacks sharedInstance] createCommandHandleFor:completion];
    const char *proofRequestId_char = [proofRequestId cString];
    const char *requestedAttrs_char = [requestedAttrs cString];
    const char *requestedPredicates_char = [requestedPredicates cString];
    const char *proofName_char = [proofName cString];
    ret = vcx_proof_create(handle, proofRequestId_char, requestedAttrs_char, requestedPredicates_char, proofName_char, VcxWrapperCommonStringCallback);

    if ( ret != 0 )
    {
       [[VcxCallbacks sharedInstance] deleteCommandHandleFor: handle];

       dispatch_async(dispatch_get_main_queue(), ^{
           completion([NSError errorFromVcxError: ret], nil);
       });
    }
}

- (void)credentialSerialize:(NSInteger)credentialHandle
                  completion:(void (^)(NSError *error, NSString *state))completion {
    vcx_error_t ret;
    vcx_command_handle_t handle = [[VcxCallbacks sharedInstance] createCommandHandleFor:completion];

    ret = vcx_credential_serialize(handle, credentialHandle, VcxWrapperCommonStringCallback);

    if ( ret != 0 )
    {
       [[VcxCallbacks sharedInstance] deleteCommandHandleFor: handle];

       dispatch_async(dispatch_get_main_queue(), ^{
           completion([NSError errorFromVcxError: ret], nil);
       });
    }
}

- (void)credentialDeserialize:(NSString *)serializedCredential
                    completion:(void (^)(NSError *error, NSInteger credentialHandle))completion{
    vcx_error_t ret;
    vcx_command_handle_t handle = [[VcxCallbacks sharedInstance] createCommandHandleFor:completion];
    const char *serialized_credential = [serializedCredential cString];
    ret = vcx_credential_deserialize(handle, serialized_credential, VcxWrapperCommonNumberCallback);

    if ( ret != 0 )
    {
       [[VcxCallbacks sharedInstance] deleteCommandHandleFor: handle];

       dispatch_async(dispatch_get_main_queue(), ^{
           completion([NSError errorFromVcxError: ret], 0);
       });
    }
}

- (void)exportWallet:(NSString *)exportPath
            encryptWith:(NSString *)encryptionKey
           completion:(void (^)(NSError *error, NSInteger exportHandle))completion {
   vcx_error_t ret;
   vcx_command_handle_t handle = [[VcxCallbacks sharedInstance] createCommandHandleFor:completion];
   const char * export_path=[exportPath cString];
   const char * encryption_key = [encryptionKey cString];
    ret = vcx_wallet_export(handle, export_path, encryption_key, VcxWrapperCommonCallback);

   if( ret != 0 )
   {
       [[VcxCallbacks sharedInstance] deleteCommandHandleFor: handle];

       dispatch_async(dispatch_get_main_queue(), ^{
           completion([NSError errorFromVcxError: ret], 0);
       });
   }
}

- (void)importWallet:(NSString *)config
           completion:(void (^)(NSError *error))completion {
   vcx_error_t ret;
   vcx_command_handle_t handle = [[VcxCallbacks sharedInstance] createCommandHandleFor:completion];
    ret = vcx_wallet_import(handle, [config cString], VcxWrapperCommonCallback);

   if( ret != 0 )
   {
       [[VcxCallbacks sharedInstance] deleteCommandHandleFor: handle];

       dispatch_async(dispatch_get_main_queue(), ^{
           completion([NSError errorFromVcxError: ret]);
       });
   }
}

- (void)addRecordWallet:(NSString *)recordType
               recordId:(NSString *)recordId
            recordValue:(NSString *) recordValue
             completion:(void (^)(NSError *error))completion {
   vcx_error_t ret;
   vcx_command_handle_t handle = [[VcxCallbacks sharedInstance] createCommandHandleFor:completion];
   const char * record_type =[recordType cString];
   const char * record_id = [recordId cString];
   const char * record_value =[recordValue cString];
   const char * record_tag = "{}";
    ret = vcx_wallet_add_record(handle, record_type, record_id, record_value, record_tag, VcxWrapperCommonCallback);

   if( ret != 0 )
   {
       [[VcxCallbacks sharedInstance] deleteCommandHandleFor: handle];

       dispatch_async(dispatch_get_main_queue(), ^{
           completion([NSError errorFromVcxError: ret]);
       });
   }
}

- (void)getRecordWallet:(NSString *)recordType
            recordId:(NSString *)recordId
             completion:(void (^)(NSError *error, NSString* walletValue))completion {
   vcx_error_t ret;
   vcx_command_handle_t handle = [[VcxCallbacks sharedInstance] createCommandHandleFor:completion];
   const char * record_type =[recordType cString];
   const char * record_id = [recordId cString];
   const char * record_tag = "{}";
    ret = vcx_wallet_get_record(handle, record_type, record_id, record_tag, VcxWrapperCommonStringCallback);

   if( ret != 0 )
   {
       [[VcxCallbacks sharedInstance] deleteCommandHandleFor: handle];

       dispatch_async(dispatch_get_main_queue(), ^{
           completion([NSError errorFromVcxError: ret], nil);
       });
   }
}

- (int)vcxShutdown:(BOOL *) deleteWallet {
    int delete_wallet = deleteWallet;
    return vcx_shutdown(delete_wallet);
}

- (void)deleteRecordWallet:(NSString *)recordType
            recordId:(NSString *)recordId
           completion:(void (^)(NSError *error))completion {
   vcx_error_t ret;
   vcx_command_handle_t handle = [[VcxCallbacks sharedInstance] createCommandHandleFor:completion];
   const char * record_type =[recordType cString];
   const char * record_id = [recordId cString];
   ret = vcx_wallet_delete_record(handle, record_type, record_id, VcxWrapperCommonCallback);

   if( ret != 0 )
   {
       [[VcxCallbacks sharedInstance] deleteCommandHandleFor: handle];

       dispatch_async(dispatch_get_main_queue(), ^{
           completion([NSError errorFromVcxError: ret]);
       });
   }
}

- (void)updateRecordWallet:(NSString *)recordType
              withRecordId:(NSString *)recordId
           withRecordValue:(NSString *) recordValue
            withCompletion:(void (^)(NSError *error))completion {

    vcx_error_t ret;
    vcx_command_handle_t handle = [[VcxCallbacks sharedInstance] createCommandHandleFor:completion];
    const char * record_type =[recordType cString];
    const char * record_id = [recordId cString];
    const char * record_value =[recordValue cString];

    ret = vcx_wallet_update_record_value(handle, record_type, record_id, record_value, VcxWrapperCommonCallback);

    if( ret != 0 )
    {
        [[VcxCallbacks sharedInstance] deleteCommandHandleFor: handle];

        dispatch_async(dispatch_get_main_queue(), ^{
            completion([NSError errorFromVcxError: ret]);
        });
    }
}

- (void) proofCreateWithMsgId:(NSString *)sourceId
         withConnectionHandle:(vcx_connection_handle_t)connectionHandle
                    withMsgId:(NSString *)msgId
               withCompletion:(void (^)(NSError *error, vcx_proof_handle_t proofHandle, NSString *proofRequest))completion {
    vcx_error_t ret;
    vcx_command_handle_t handle = [[VcxCallbacks sharedInstance] createCommandHandleFor:completion];
    const char *source_id = [sourceId cStringUsingEncoding:NSUTF8StringEncoding];
    const char *msg_id = [msgId cStringUsingEncoding:NSUTF8StringEncoding];

    ret = vcx_disclosed_proof_create_with_msgid(handle, source_id, connectionHandle, msg_id, VcxWrapperCommonNumberStringCallback);

    if ( ret != 0 )
    {
        [[VcxCallbacks sharedInstance] deleteCommandHandleFor: handle];

        dispatch_async(dispatch_get_main_queue(), ^{
            completion([NSError errorFromVcxError: ret], 0, nil);
        });
    }
}

- (void) proofRetrieveCredentials:(vcx_proof_handle_t)proofHandle
                   withCompletion:(void (^)(NSError *error, NSString *matchingCredentials))completion {
    vcx_error_t ret;
    vcx_command_handle_t handle = [[VcxCallbacks sharedInstance] createCommandHandleFor:completion];

    ret = vcx_disclosed_proof_retrieve_credentials(handle, proofHandle, VcxWrapperCommonStringCallback);

    if ( ret != 0 )
    {
        [[VcxCallbacks sharedInstance] deleteCommandHandleFor: handle];

        dispatch_async(dispatch_get_main_queue(), ^{
            completion([NSError errorFromVcxError: ret], nil);
        });
    }
}

- (void) proofGenerate:(vcx_proof_handle_t)proofHandle
withSelectedCredentials:(NSString *)selectedCredentials
 withSelfAttestedAttrs:(NSString *)selfAttestedAttributes
        withCompletion:(void (^)(NSError *error))completion {
    vcx_error_t ret;
    vcx_command_handle_t handle = [[VcxCallbacks sharedInstance] createCommandHandleFor:completion];
    const char *selected_credentials = [selectedCredentials cStringUsingEncoding:NSUTF8StringEncoding];
    const char *self_attested_attributes = [selfAttestedAttributes cStringUsingEncoding:NSUTF8StringEncoding];

    ret = vcx_disclosed_proof_generate_proof(handle, proofHandle, selected_credentials, self_attested_attributes, VcxWrapperCommonCallback);

    if ( ret != 0 )
    {
        [[VcxCallbacks sharedInstance] deleteCommandHandleFor: handle];

        dispatch_async(dispatch_get_main_queue(), ^{
            completion([NSError errorFromVcxError: ret]);
        });
    }
}

- (void) proofSend:(vcx_proof_handle_t)proof_handle
withConnectionHandle:(vcx_connection_handle_t)connection_handle
    withCompletion:(void (^)(NSError *error))completion {
    vcx_error_t ret;
    vcx_command_handle_t handle = [[VcxCallbacks sharedInstance] createCommandHandleFor:completion];

    ret = vcx_disclosed_proof_send_proof(handle, proof_handle, connection_handle, VcxWrapperCommonCallback);

    if ( ret != 0 )
    {
        [[VcxCallbacks sharedInstance] deleteCommandHandleFor: handle];

        dispatch_async(dispatch_get_main_queue(), ^{
            completion([NSError errorFromVcxError: ret]);
        });
    }
}

- (void) proofCreateWithRequest:(NSString *) source_id
               withProofRequest:(NSString *) proofRequest
                 withCompletion:(void (^)(NSError *error, vcx_proof_handle_t proofHandle))completion {
    vcx_error_t ret;
    vcx_command_handle_t handle = [[VcxCallbacks sharedInstance] createCommandHandleFor:completion];
    const char *sourceId = [source_id cStringUsingEncoding:NSUTF8StringEncoding];
    const char *proof_request = [proofRequest cStringUsingEncoding:NSUTF8StringEncoding];
    ret = vcx_disclosed_proof_create_with_request(handle, sourceId, proof_request, VcxWrapperCommonNumberCallback);

    if ( ret != 0 )
    {
        [[VcxCallbacks sharedInstance] deleteCommandHandleFor: handle];

        dispatch_async(dispatch_get_main_queue(), ^{
            completion([NSError errorFromVcxError: ret], 0);
        });
    }
}

- (void) proofSerialize:(vcx_proof_handle_t) proofHandle
         withCompletion:(void (^)(NSError *error, NSString *proof_request))completion {
    vcx_error_t ret;
    vcx_command_handle_t handle = [[VcxCallbacks sharedInstance] createCommandHandleFor:completion];

    ret = vcx_disclosed_proof_serialize(handle, proofHandle, VcxWrapperCommonStringCallback);

    if( ret != 0 )
    {
        [[VcxCallbacks sharedInstance] deleteCommandHandleFor: handle];

        dispatch_async(dispatch_get_main_queue(), ^{
            completion([NSError errorFromVcxError: ret], nil);
        });
    }
}

- (void) proofDeserialize:(NSString *) serializedProof
           withCompletion:(void (^)(NSError *error, vcx_proof_handle_t proofHandle)) completion {
    vcx_error_t ret;
    vcx_command_handle_t handle = [[VcxCallbacks sharedInstance] createCommandHandleFor:completion];
    const char *serialized_proof = [serializedProof cStringUsingEncoding:NSUTF8StringEncoding];

    ret = vcx_disclosed_proof_deserialize(handle, serialized_proof, VcxWrapperCommonNumberCallback);

    if ( ret != 0 )
    {
        [[VcxCallbacks sharedInstance] deleteCommandHandleFor: handle];

        dispatch_async(dispatch_get_main_queue(), ^{
            completion([NSError errorFromVcxError: ret], 0);
        });
    }
}


- (void)createPaymentAddress:(NSString *)seed
              withCompletion:(void (^)(NSError *error, NSString *address))completion {
    vcx_error_t ret;
    vcx_command_handle_t handle = [[VcxCallbacks sharedInstance] createCommandHandleFor:completion];

    const char *c_seed = [seed cStringUsingEncoding:NSUTF8StringEncoding];

    ret = vcx_wallet_create_payment_address(handle, c_seed, VcxWrapperCommonStringCallback);

    if ( ret != 0 )
    {
        [[VcxCallbacks sharedInstance] deleteCommandHandleFor: handle];

        dispatch_async(dispatch_get_main_queue(), ^{
            completion([NSError errorFromVcxError: ret], nil);
        });
    }
}

- (void)getTokenInfo:(vcx_payment_handle_t)payment_handle
      withCompletion:(void (^)(NSError *error, NSString *tokenInfo))completion
{
    vcx_error_t ret;
    vcx_command_handle_t handle = [[VcxCallbacks sharedInstance] createCommandHandleFor:completion];

    ret = vcx_wallet_get_token_info(handle, payment_handle, VcxWrapperCommonStringCallback);

    if ( ret != 0 )
    {
        [[VcxCallbacks sharedInstance] deleteCommandHandleFor: handle];

        dispatch_async(dispatch_get_main_queue(), ^{
            completion([NSError errorFromVcxError: ret], nil);
        });
    }
}

- (void)sendTokens:(vcx_payment_handle_t)payment_handle
        withTokens:(NSString *)tokens
     withRecipient:(NSString *)recipient
    withCompletion:(void (^)(NSError *error, NSString *recipient))completion
{
    vcx_error_t ret;
    vcx_command_handle_t handle = [[VcxCallbacks sharedInstance] createCommandHandleFor:completion];

    const char* c_recipient = [recipient cStringUsingEncoding:NSUTF8StringEncoding];
    const char* c_tokens = [tokens cStringUsingEncoding:NSUTF8StringEncoding];

    ret = vcx_wallet_send_tokens(handle, payment_handle, c_tokens, c_recipient, VcxWrapperCommonStringCallback);

    if ( ret != 0 )
    {
        [[VcxCallbacks sharedInstance] deleteCommandHandleFor: handle];

        dispatch_async(dispatch_get_main_queue(), ^{
            completion([NSError errorFromVcxError: ret], nil);
        });
    }
}

- (void)downloadMessages:(NSString *)messageStatus
                    uid_s:(NSString *)uid_s
                  pwdids:(NSString *)pwdids
              completion:(void (^)(NSError *error, NSString* messages))completion{
    vcx_error_t ret;
    vcx_command_handle_t handle = [[VcxCallbacks sharedInstance] createCommandHandleFor:completion];
    const char * message_status = [messageStatus cString];
    const char * uids = [uid_s cString];
    const char * pw_dids = [pwdids cString];
    ret = vcx_messages_download(handle, message_status, uids, pw_dids, VcxWrapperCommonStringCallback);

    if( ret != 0 )
    {
        [[VcxCallbacks sharedInstance] deleteCommandHandleFor: handle];

        dispatch_async(dispatch_get_main_queue(), ^{
            completion([NSError errorFromVcxError: ret], nil);
        });
    }
}

- (void)updateMessages:(NSString *)messageStatus
                 pwdidsJson:(NSString *)pwdidsJson
              completion:(void (^)(NSError *error))completion{
    vcx_error_t ret;
    vcx_command_handle_t handle = [[VcxCallbacks sharedInstance] createCommandHandleFor:completion];
    const char * message_status = [messageStatus cString];
    const char * msg_json = [pwdidsJson cString];
    ret = vcx_messages_update_status(handle, message_status, msg_json, VcxWrapperCommonCallback);

    if( ret != 0 )
    {
        [[VcxCallbacks sharedInstance] deleteCommandHandleFor: handle];

        dispatch_async(dispatch_get_main_queue(), ^{
            completion([NSError errorFromVcxError: ret]);
        });
    }
}

- (void) getLedgerFees:(void(^)(NSError *error, NSString *fees)) completion
{
    vcx_error_t ret;
    vcx_command_handle_t handle = [[VcxCallbacks sharedInstance] createCommandHandleFor:completion];
    ret = vcx_ledger_get_fees(handle, VcxWrapperCommonStringCallback);
    
    if (ret != 0)
    {
        [[VcxCallbacks sharedInstance] deleteCommandHandleFor: handle];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            completion([NSError errorFromVcxError: ret], nil);
        });
    }
}

@end

// --- END VeriTransfer.m











// --- START RnIndy.m

//  Created by react-native-create-bridge


@implementation RnIndy
RCT_EXPORT_MODULE();

// RCT_EXPORT_METHOD(addEvent:(NSString *)name location:(NSString *)location)
// {
//   RCTLogInfo(@"Pretending to create an event %@ at %@", name, location);
// }

// @synthesize bridge = _bridge;

// // Export a native module
// // https://facebook.github.io/react-native/docs/native-modules-ios.html


// List all your events here
// https://facebook.github.io/react-native/releases/next/docs/native-modules-ios.html#sending-events-to-javascript
- (NSArray<NSString *> *)supportedEvents
{
  return @[@"NoEvent"];
}

// #pragma mark - Private methods
// // Implement methods that you want to export to the native module
// - (void) emitMessageToRN: (NSString *)eventName :(NSDictionary *)params {
//   // The bridge eventDispatcher is used to send events from native to JS env
//   // No documentation yet on DeviceEventEmitter: https://github.com/facebook/react-native/issues/2819
//   [self sendEventWithName: eventName body: params];
// }

// #pragma mark - React Native exposed methods

// // delete connection
// RCT_EXPORT_METHOD(deleteConnection:(NSInteger) connectionHandle
//                   resolver: (RCTPromiseResolveBlock) resolve
//                   rejecter: (RCTPromiseRejectBlock) reject)
// {
//   [[[ConnectMeVcx alloc] init] deleteConnection:connectionHandle
//                                  withCompletion:^(NSError *error)
//   {
//      if (error != nil && error.code != 0)
//      {
//        NSString *indyErrorCode = [NSString stringWithFormat:@"%ld", (long)error.code];
//        reject(indyErrorCode, @"Error occurred while deleting connection", error);
//      } else {
//        resolve(@true);
//      }
//   }];
// }

RCT_EXPORT_METHOD(init: (NSString *)config
                  resolver: (RCTPromiseResolveBlock) resolve
                  rejecter: (RCTPromiseRejectBlock) reject)
{
  [[[ConnectMeVcx alloc] init] initWithConfig:config completion:^(NSError *error) {
    if (error != nil && error.code != 0 && error.code != 1044)
    {
      NSString *indyErrorCode = [NSString stringWithFormat:@"%ld", (long)error.code];
      reject(indyErrorCode, [NSString stringWithFormat:@"Error occurred while initializing vcx: %@ :: %ld",error.domain, (long)error.code], error);
    }else{
      resolve(@true);
    }
  }];
}

// RCT_EXPORT_METHOD(reset:
//                   resolver: (RCTPromiseResolveBlock) resolve
//                   rejecter: (RCTPromiseRejectBlock) reject)
// {
//   dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//     resolve(@{});
//   });
// }

// RCT_EXPORT_METHOD(getSerializedConnection: (NSInteger)connectionHandle
//                   resolver: (RCTPromiseResolveBlock) resolve
//                   rejecter: (RCTPromiseRejectBlock) reject)
// {
//   // TODO call vcx_connection_serialize and pass connectionHandle
//   // it would return a string
//   [[[VertiTransferVCX alloc] init] connectionSerialize:connectionHandle
//                                               completion:^(NSError *error, NSString *state) {
//     if (error != nil && error.code != 0)
//     {
//       NSString *indyErrorCode = [NSString stringWithFormat:@"%ld", (long)error.code];
//       reject(indyErrorCode, @"Error occurred while serializing connection handle", error);
//     }else{

//       resolve(state);
//     }
//   }];
// }

// RCT_EXPORT_METHOD(deserializeConnection: (NSString *)serializedConnection
//                   resolver: (RCTPromiseResolveBlock) resolve
//                   rejecter: (RCTPromiseRejectBlock) reject)
// {
//   // TODO call vcx_connection_deserialize and pass serializedConnection
//   // it would return an error code and an integer connection handle in callback
//   [[[VertiTransferVCX alloc] init] connectionDeserialize:serializedConnection completion:^(NSError *error, NSInteger connectionHandle) {
//     if (error != nil && error.code != 0)
//     {
//       NSString *indyErrorCode = [NSString stringWithFormat:@"%ld", (long)error.code];
//       reject(indyErrorCode, @"Error occurred while deserializing claim offer", error);
//     }else{
//       resolve(@(connectionHandle));
//     }
//   }];
// }

// RCT_EXPORT_METHOD(decryptWalletFile: (NSString *) config
//                            resolver: (RCTPromiseResolveBlock) resolve
//                            rejecter: (RCTPromiseRejectBlock) reject)
// {
//   [[[VertiTransferVCX alloc] init] importWallet: config
//                                completion:^(NSError *error) {
//     if(error != nil && error.code != 0){
//       NSString *indyErrorCode = [NSString stringWithFormat:@"%ld", (long)error.code];
//       reject(indyErrorCode, [NSString stringWithFormat:@"Error occurred while importing wallet: %@ :: %ld",error.domain, (long)error.code], error);
//     }else {
//       resolve(@{});
//     }
//   }];
// }


// RCT_EXPORT_METHOD(shutdownVcx: (BOOL *) deletePool
//                     resolver: (RCTPromiseResolveBlock) resolve
//                     rejecter: (RCTPromiseRejectBlock) reject)
// {
//   resolve([NSNumber numberWithInt:[[[VertiTransferVCX alloc] init] vcxShutdown: deletePool]]);
// }


// RCT_EXPORT_METHOD(credentialCreateWithMsgId: (NSString *) sourceId
//                   withConnectionHandle: (NSInteger) connectionHandle
//                   withMessageId: (NSString *) messageId
//                   resolver: (RCTPromiseResolveBlock) resolve
//                   rejecter: (RCTPromiseRejectBlock) reject)
// {
//     [[[VertiTransferVCX alloc] init] credentialCreateWithMsgid:sourceId
//                                           connectionHandle:connectionHandle
//                                                      msgId:messageId
//                                                 completion:^(NSError *error, NSInteger credentialHandle, NSString* credentialOffer) {
//       if (error != nil && error.code != 0)
//       {
//         NSString *indyErrorCode = [NSString stringWithFormat:@"%ld", (long)error.code];
//         reject(indyErrorCode, @"Error occurred while creating credential handle", error);
//       } else {
//         NSDictionary* vcxCredentialCreateResult = @{
//                                               @"credential_handle": @(credentialHandle),
//                                               @"credential_offer": credentialOffer
//                                               };
//         resolve(vcxCredentialCreateResult);
//       }
//     }];
// }

// RCT_EXPORT_METHOD(serializeClaimOffer: (NSInteger)credentialHandle
//                   resolver: (RCTPromiseResolveBlock) resolve
//                   rejecter: (RCTPromiseRejectBlock) reject)
// {
//   // it would return error code, json string of credential inside callback
//   [[[VertiTransferVCX alloc] init] credentialSerialize:credentialHandle completion:^(NSError *error, NSString *claimOffer) {
//     if (error != nil && error.code != 0)
//     {
//       NSString *indyErrorCode = [NSString stringWithFormat:@"%ld", (long)error.code];
//       reject(indyErrorCode, @"Error occurred while serializing claim offer", error);
//     }else{
//       resolve(claimOffer);
//     }
//   }];
// }

// RCT_EXPORT_METHOD(deserializeClaimOffer: (NSString *)serializedCredential
//                   resolver: (RCTPromiseResolveBlock) resolve
//                   rejecter: (RCTPromiseRejectBlock) reject)
// {
//   // it would return an error code and an integer credential handle in callback
//   [[[VertiTransferVCX alloc] init] credentialDeserialize:serializedCredential
//                                           completion:^(NSError *error, NSInteger credentailHandle) {
//     if (error != nil && error.code != 0) {
//       NSString *indyErrorCode = [NSString stringWithFormat:@"%ld", (long)error.code];
//       reject(indyErrorCode, @"Error occurred while deserializing claim offer", error);
//     }
//     else {
//       resolve(@(credentailHandle));
//     }
//   }];
// }

// RCT_EXPORT_METHOD(sendClaimRequest: (NSInteger) credentialHandle
//                   withConnectionHandle: (NSInteger) connectionHandle
//                   withPaymentHandle: (NSInteger) paymentHandle
//                   resolver: (RCTPromiseResolveBlock) resolve
//                   rejecter: (RCTPromiseRejectBlock) reject)
// {
//   [[[VertiTransferVCX alloc] init] credentialSendRequest:credentialHandle
//                                     connectionHandle:connectionHandle
//                                        paymentHandle:paymentHandle
//                                           completion:^(NSError *error) {
//     if (error != nil && error.code != 0)
//     {
//       NSString *indyErrorCode = [NSString stringWithFormat:@"%ld", (long)error.code];
//       reject(indyErrorCode, @"Error occurred while sending claim request", error);
//     }
//     else {
//       resolve(@{});
//     }
//   }];
// }

// RCT_EXPORT_METHOD(initWithConfig: (NSString *)config
//               resolver: (RCTPromiseResolveBlock) resolve
//               rejecter: (RCTPromiseRejectBlock) reject)
// {
//   NSError *error = nil; // remove this line after integrating libvcx method
//   if (error != nil && error.code != 0)
//   {
//     NSString *indyErrorCode = [NSString stringWithFormat:@"%ld", (long)error.code];
//     reject(indyErrorCode, @"Init failed with error", error);
//   } else {
//     resolve(@{});
//   }
// }

// RCT_EXPORT_METHOD(createOneTimeInfo: (NSString *)config
//                            resolver: (RCTPromiseResolveBlock) resolve
//                            rejecter: (RCTPromiseRejectBlock) reject)
// {
//   [[[VertiTransferVCX alloc] init] agentProvisionAsync:config completion:^(NSError *error, NSString *oneTimeInfo) {
//     NSLog(@"createOneTimeInfo callback:%@",oneTimeInfo);
//     if (error != nil && error.code != 0)
//     {
//       NSString *indyErrorCode = [NSString stringWithFormat:@"%ld", (long)error.code];
//       reject(indyErrorCode, [NSString stringWithFormat:@"Error occurred while creating one time info: %@ :: %ld",error.domain, (long)error.code], error);

//     }else{
//       resolve(oneTimeInfo);
//     }
//   }];
// }

// RCT_EXPORT_METHOD(createConnectionWithInvite: (NSString *)invitationId
//                                inviteDetails: (NSString *)inviteDetails
//                                     resolver: (RCTPromiseResolveBlock) resolve
//                                     rejecter: (RCTPromiseRejectBlock) reject)
// {
//   [[[VertiTransferVCX alloc] init] connectionCreateWithInvite:invitationId
//                                             inviteDetails:inviteDetails
//                                                completion:^(NSError *error, NSInteger connectionHandle) {
//      if (error != nil && error.code != 0)
//      {
//        NSString *indyErrorCode = [NSString stringWithFormat:@"%ld", (long)error.code];
//        reject(indyErrorCode, @"Error occurred while creating connection", error);
//      } else {
//        resolve(@(connectionHandle));
//      }
//   }];
// }

// RCT_EXPORT_METHOD(vcxAcceptInvitation: (NSInteger )connectionHandle
//                     connectionType: (NSString *)connectionType
//                           resolver: (RCTPromiseResolveBlock) resolve
//                           rejecter: (RCTPromiseRejectBlock) reject)
// {
//    [[[VertiTransferVCX alloc] init] connectionConnect:connectionHandle
//                                             connectionType:connectionType
//                                                completion:^(NSError *error, NSString *inviteDetails) {

//     if (error != nil && error.code != 0)
//     {
//       NSString *indyErrorCode = [NSString stringWithFormat:@"%ld", (long)error.code];
//       reject(indyErrorCode, @"Error occurred while accepitng connection", error);
//     } else {
//       resolve(inviteDetails);
//     }
//    }];

// }

// RCT_EXPORT_METHOD(vcxUpdatePushToken: (NSString *)config
//                          resolver: (RCTPromiseResolveBlock) resolve
//                          rejecter: (RCTPromiseRejectBlock) reject)
// {
//   [[[VertiTransferVCX alloc] init] agentUpdateInfo:config completion:^(NSError *error) {
//     if (error != nil && error.code != 0)
//     {
//       NSString *indyErrorCode = [NSString stringWithFormat:@"%ld", (long)error.code];
//       reject(indyErrorCode, @"Error occurred while updating push token", error);
//     } else {
//       resolve(@{});
//     }
//   }];
// }

// RCT_EXPORT_METHOD(getGenesisPathWithConfig: (NSString *)config
//                         fileName: (NSString *)fileName
//                        resolver: (RCTPromiseResolveBlock) resolve
//                        rejecter: (RCTPromiseRejectBlock) reject)
// {
//   NSError *error;
//   NSString *filePath = [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject] stringByAppendingPathComponent:fileName];
//   NSFileManager *fileManager = [NSFileManager defaultManager];
//   if (![fileManager fileExistsAtPath: filePath])
//   {
//     NSInteger *success=[config writeToFile:filePath atomically:YES encoding:NSUTF8StringEncoding error:&error];
//     if(!success)
//     {
//       resolve(@"error while creating genesis file");
//     }
//   }
//   resolve(filePath);
// }

// RCT_EXPORT_METHOD(updateClaimOfferState: (int)credentialHandle
//                   resolver: (RCTPromiseResolveBlock) resolve
//                   rejecter: (RCTPromiseRejectBlock) reject)
// {
//   [[[VertiTransferVCX alloc] init] credentialUpdateState:credentialHandle
//                                           completion:^(NSError *error, NSInteger state)
//   {
//     if (error != nil && error.code != 0) {
//       NSString *indyErrorCode = [NSString stringWithFormat:@"%ld", (long)error.code];
//       reject(indyErrorCode, @"Error occurred while updating claim offer state", error);
//     }
//     else {
//       resolve(@(state));
//     }
//   }];
// }

// RCT_EXPORT_METHOD(getClaimOfferState: (int)credentialHandle
//                   resolver: (RCTPromiseResolveBlock) resolve
//                   rejecter: (RCTPromiseRejectBlock) reject)
// {
//   // TODO: Add vcx wrapper method for vcx_credential_get_state
//   // call vcx_credential_get_state and pass credentialHandle

//   [[[VertiTransferVCX alloc] init] credentialGetState:credentialHandle completion:^(NSError *error, NSInteger state) {
//     if (error != nil && error.code != 0) {
//       NSString *indyErrorCode = [NSString stringWithFormat:@"%ld", (long)error.code];
//       reject(indyErrorCode, @"Error occurred while getting claim offer state", error);
//     }
//     else {
//       resolve(@(state));
//     }
//   }];
// }

// RCT_EXPORT_METHOD(getClaimVcx: (int)credentialHandle
//                   resolver: (RCTPromiseResolveBlock) resolve
//                   rejecter: (RCTPromiseRejectBlock) reject)
// {
//   [[[VertiTransferVCX alloc] init] getCredential:credentialHandle completion:^(NSError *error, NSString *credential) {
//     if (error != nil && error.code != 0) {
//       NSString *indyErrorCode = [NSString stringWithFormat:@"%ld", (long)error.code];
//       reject(indyErrorCode, @"Error occurred while getting claim", error);
//     }
//     else {
//       resolve(credential);
//     }
//   }];
// }

// RCT_EXPORT_METHOD(exportWallet: (NSString *)exportPath
//                                encryptWith: (NSString *)encryptionKey
//                                     resolver: (RCTPromiseResolveBlock) resolve
//                                     rejecter: (RCTPromiseRejectBlock) reject)
// {
//   [[[VertiTransferVCX alloc] init] exportWallet:exportPath
//                                 encryptWith:encryptionKey
//                                 completion:^(NSError *error, NSInteger exportHandle) {
//      if (error != nil && error.code != 0)
//      {
//        NSString *indyErrorCode = [NSString stringWithFormat:@"%ld", (long)error.code];
//        reject(indyErrorCode, @"Error occurred while exporting wallet", error);
//      } else {
//        resolve(@(exportHandle));
//      }
//   }];
// }

// RCT_EXPORT_METHOD(setWalletItem: (NSString *) key
//                           value: (NSString *) value
//                        resolver: (RCTPromiseResolveBlock) resolve
//                        rejecter: (RCTPromiseRejectBlock)reject)
// {
//   NSString *recordType = @"record_type";
//   [[[VertiTransferVCX alloc] init] addRecordWallet:recordType
//                                       recordId:key
//                                    recordValue:value
//                                     completion:^(NSError *error) {
//     if (error != nil && error.code != 0)
//     {
//       NSString *indyErrorCode = [NSString stringWithFormat:@"%ld", (long)error.code];
//       reject(indyErrorCode, [NSString stringWithFormat:@"Error occurred while adding wallet item: %@ :: %ld",error.domain, (long)error.code], error);
//     } else {
//       resolve(@0);
//     }
//   }];
// }

// RCT_EXPORT_METHOD(getWalletItem: (NSString *) key
//                        resolver: (RCTPromiseResolveBlock) resolve
//                        rejecter: (RCTPromiseRejectBlock) reject)
// {
//   NSString *recordType = @"record_type";
//   [[[VertiTransferVCX alloc] init] getRecordWallet:recordType
//                                       recordId:key
//                                     completion:^(NSError *error, NSString *result)
//    {
//      if (error != nil && error.code != 0)
//      {
//        NSString *indyErrorCode = [NSString stringWithFormat:@"%ld", (long)error.code];
//        reject(indyErrorCode, [NSString stringWithFormat:@"Error occurred while getting wallet item: %@ :: %ld",error.domain, (long)error.code], error);
//      } else {
//        resolve(result);
//      }
//    }];
// }

// RCT_EXPORT_METHOD(deleteWalletItem: (NSString *) key
//                        resolver: (RCTPromiseResolveBlock) resolve
//                        rejecter: (RCTPromiseRejectBlock) reject)
// {
//   NSString *recordType = @"record_type";
//   [[[VertiTransferVCX alloc] init] deleteRecordWallet:recordType
//                                          recordId:key
//                                        completion:^(NSError *error) {
//      if (error != nil && error.code != 0)
//      {
//        NSString *indyErrorCode = [NSString stringWithFormat:@"%ld", (long)error.code];
//        reject(indyErrorCode, [NSString stringWithFormat:@"Error occurred while deleting wallet item: %@ :: %ld",error.domain, (long)error.code], error);
//      } else {
//        resolve(@0);
//      }
//   }];
// }

// RCT_EXPORT_METHOD(updateWalletItem: (NSString *) key
//                              value: (NSString *) value
//                           resolver: (RCTPromiseResolveBlock) resolve
//                           rejecter: (RCTPromiseRejectBlock) reject)
// {
//   NSString *recordType = @"record_type";

//   [[[VertiTransferVCX alloc] init] updateRecordWallet:recordType
//                                      withRecordId:key
//                                   withRecordValue:value
//                                    withCompletion:^(NSError *error) {
//      if (error != nil && error.code != 0)
//      {
//        NSString *indyErrorCode = [NSString stringWithFormat:@"%ld", (long)error.code];
//        reject(indyErrorCode, [NSString stringWithFormat:@"Error occurred while updating wallet item: %@ :: %ld",error.domain, (long)error.code], error);
//      } else {
//        resolve(@0);
//      }
//   }];
// }

// RCT_EXPORT_METHOD(proofCreateWithMsgId: (NSString *)sourceId
//                   withConnectionHandle: (NSInteger)connectionHandle
//                   withMsgId: (NSString *)msgId
//                   resolver: (RCTPromiseResolveBlock) resolve
//                   rejecter: (RCTPromiseRejectBlock) reject)
// {
//   [[[VertiTransferVCX alloc] init] proofCreateWithMsgId:sourceId
//                                withConnectionHandle:connectionHandle
//                                           withMsgId:msgId
//                                      withCompletion:^(NSError *error, vcx_proof_handle_t proofHandle, NSString *proofRequest)
//   {
//     if (error != nil && error.code != 0) {
//       NSString *indyErrorCode = [NSString stringWithFormat:@"%ld", (long)error.code];
//       reject(indyErrorCode, @"Error occurred while downloading proof request", error);
//     }
//     else {
//       resolve(@{
//                 @"proofHandle": @(proofHandle),
//                 @"proofRequest": proofRequest
//                 });
//     }
//   }];
// }

// RCT_EXPORT_METHOD(proofRetrieveCredentials:(NSInteger)proofHandle
//                   resolver: (RCTPromiseResolveBlock) resolve
//                   rejecter: (RCTPromiseRejectBlock) reject)
// {
//   [[[VertiTransferVCX alloc] init] proofRetrieveCredentials:proofHandle
//                                          withCompletion:^(NSError *error, NSString *matchingCredentials)
//   {
//     if (error != nil && error.code != 0) {
//       NSString *indyErrorCode = [NSString stringWithFormat:@"%ld", (long)error.code];
//       reject(indyErrorCode, @"Error occurred while retrieving matching credentials", error);
//     }
//     else {
//       resolve(matchingCredentials);
//     }
//   }];
// }

// RCT_EXPORT_METHOD(proofGenerate:(NSInteger)proofHandle
//                   withSelectedCredentials:(NSString *)selectedCredentials
//                   withSelfAttestedAttrs:(NSString *)selfAttestedAttributes
//                   resolver: (RCTPromiseResolveBlock) resolve
//                   rejecter: (RCTPromiseRejectBlock) reject)
// {
//   [[[VertiTransferVCX alloc] init] proofGenerate:proofHandle
//                      withSelectedCredentials:selectedCredentials
//                        withSelfAttestedAttrs:selfAttestedAttributes
//                               withCompletion:^(NSError *error)
//   {
//     if (error != nil && error.code != 0) {
//       NSString *indyErrorCode = [NSString stringWithFormat:@"%ld", (long)error.code];
//       reject(indyErrorCode, @"Error occurred while generating proof", error);
//     }
//     else {
//       resolve(@{});
//     }
//   }];
// }

// RCT_EXPORT_METHOD(proofSend:(NSInteger)proof_handle
//                   withConnectionHandle:(NSInteger)connection_handle
//                   resolver: (RCTPromiseResolveBlock) resolve
//                   rejecter: (RCTPromiseRejectBlock) reject)
// {
//   [[[VertiTransferVCX alloc] init] proofSend:proof_handle
//                     withConnectionHandle:connection_handle
//                           withCompletion:^(NSError *error)
//   {
//     if (error != nil && error.code != 0) {
//       NSString *indyErrorCode = [NSString stringWithFormat:@"%ld", (long)error.code];
//       reject(indyErrorCode, @"Error occurred while sending proof", error);
//     }
//     else {
//       resolve(@{});
//     }
//   }];
// }

// RCT_EXPORT_METHOD(proofCreateWithRequest:(NSString*)sourceId
//                   withProofRequest:(NSString*)proofRequest
//                   resolver: (RCTPromiseResolveBlock) resolve
//                   rejecter: (RCTPromiseRejectBlock) reject)
// {
//   [[[VertiTransferVCX alloc] init] proofCreateWithRequest:sourceId
//                                      withProofRequest:proofRequest
//                                        withCompletion:^(NSError *error, vcx_proof_handle_t proofHandle)
//   {
//     if (error != nil && error.code != 0) {
//       NSString *indyErrorCode = [NSString stringWithFormat:@"%ld", (long)error.code];
//       reject(indyErrorCode, @"Error occurred while creating proof request", error);
//     }
//     else {
//       resolve(@(proofHandle));
//     }
//   }];
// }

// RCT_EXPORT_METHOD(proofSerialize:(NSInteger)proofHandle
//                   resolver: (RCTPromiseResolveBlock) resolve
//                   rejecter: (RCTPromiseRejectBlock) reject)
// {
//   [[[VertiTransferVCX alloc] init] proofSerialize:proofHandle
//                                withCompletion:^(NSError *error, NSString *proof_request)
//   {
//     if (error != nil && error.code != 0) {
//       NSString *indyErrorCode = [NSString stringWithFormat:@"%ld", (long)error.code];
//       reject(indyErrorCode, @"Error occurred while serializing proof request", error);
//     }
//     else {
//       resolve(proof_request);
//     }
//   }];
// }

// RCT_EXPORT_METHOD(proofDeserialize:(NSString *)serializedProof
//                   resolver: (RCTPromiseResolveBlock) resolve
//                   rejecter: (RCTPromiseRejectBlock) reject)
// {
//   [[[VertiTransferVCX alloc] init] proofDeserialize:serializedProof
//                                  withCompletion:^(NSError *error, vcx_proof_handle_t proofHandle)
//   {
//     if (error != nil && error.code != 0) {
//       NSString *indyErrorCode = [NSString stringWithFormat:@"%ld", (long)error.code];
//       reject(indyErrorCode, @"Error occurred while de-serializing proof request", error);
//     }
//     else {
//       resolve(@(proofHandle));
//     }
//   }];
// }

// RCT_EXPORT_METHOD(downloadMessages: (NSString *) messageStatus
//                              uid_s: (NSString *) uid_s
//                             pwdids: (NSString *) pwdids
//                           resolver: (RCTPromiseResolveBlock) resolve
//                           rejecter: (RCTPromiseRejectBlock) reject)
// {
//   [[[VertiTransferVCX alloc] init] downloadMessages: messageStatus uid_s:uid_s pwdids:pwdids completion:^(NSError *error, NSString *messages) {
//     if (error != nil && error.code !=0) {
//       NSString *indyErrorCode = [NSString stringWithFormat:@"%ld", (long)error.code];
//       reject(indyErrorCode, @"Error occured while downloading messages", error);
//     } else{
//       resolve(messages);
//     }
//   }];
// }
//  RCT_EXPORT_METHOD(updateMessages: (NSString *)messageStatus
//                       pwdidsJson: (NSString *)pwdidsJson
//                         resolver: (RCTPromiseResolveBlock) resolve
//                         rejecter: (RCTPromiseRejectBlock) reject)
// {
//   [[[VertiTransferVCX alloc] init] updateMessages:messageStatus pwdidsJson:pwdidsJson completion:^(NSError *error) {
//     if (error != nil && error.code !=0) {
//       NSString *indyErrorCode = [NSString stringWithFormat:@"%ld", (long)error.code];
//       reject(indyErrorCode, @"Error occured while updating message status", error);
//     } else {
//       resolve(@{});
//     }
//   }];
// }

// RCT_EXPORT_METHOD(getTokenInfo:(NSInteger) paymentHandle
//                   resolver: (RCTPromiseResolveBlock) resolve
//                   rejecter: (RCTPromiseRejectBlock) reject)
// {
//   [[[VertiTransferVCX alloc] init] getTokenInfo:paymentHandle withCompletion:^(NSError *error, NSString *tokenInfo) {
//     if (error != nil && error.code != 0)
//     {
//       NSString *indyErrorCode = [NSString stringWithFormat:@"%ld", (long)error.code];
//       reject(indyErrorCode, @"Error occurred while getting token info", error);
//     } else {
//       resolve(tokenInfo);
//     }
//   }];
// }

// RCT_EXPORT_METHOD(sendTokens:(NSInteger) paymentHandle
//                   withTokens:(NSString *) tokens
//                   withRecipient:(NSString *) recipient
//                   resolver: (RCTPromiseResolveBlock) resolve
//                   rejecter: (RCTPromiseRejectBlock) reject)
// {
//   [[[VertiTransferVCX alloc] init] sendTokens:paymentHandle
//                                withTokens:tokens
//                             withRecipient:recipient
//                            withCompletion:^(NSError *error, NSString *recipient)
//   {
//     if (error != nil && error.code != 0)
//     {
//       NSString *indyErrorCode = [NSString stringWithFormat:@"%ld", (long)error.code];
//       reject(indyErrorCode, @"Error occurred while sending tokens", error);
//     } else {
//       resolve(recipient);
//     }
//   }];
// }

// RCT_EXPORT_METHOD(createPaymentAddress:(NSString*)seed
//                   resolver: (RCTPromiseResolveBlock) resolve
//                   rejecter: (RCTPromiseRejectBlock) reject)
// {
//   [[[VertiTransferVCX alloc] init] createPaymentAddress:seed
//                                      withCompletion:^(NSError *error, NSString *address)
//   {
//     if (error != nil && error.code != 0)
//     {
//       NSString *indyErrorCode = [NSString stringWithFormat:@"%ld", (long)error.code];
//       reject(indyErrorCode, @"Error occurred while creating payment address", error);
//     } else {
//       resolve(address);
//     }
//   }];
// }

// RCT_EXPORT_METHOD(createWalletKey: (NSInteger) lengthOfKey
//                   resolver: (RCTPromiseResolveBlock) resolve
//                   rejecter: (RCTPromiseRejectBlock) reject)
// {
//   // Generate secure random string
//   NSMutableData *data = [NSMutableData dataWithLength:lengthOfKey];
//   int result = SecRandomCopyBytes(NULL, lengthOfKey, data.mutableBytes);
//   if (result == 0) {
//     NSString* value = [data base64EncodedStringWithOptions:0];
//     resolve(value);
//   } else {
//     reject(@"W-001", @"Error occurred while generating wallet key", nil);
//   }
// }

// RCT_EXPORT_METHOD(getLedgerFees: (RCTPromiseResolveBlock) resolve
//                   rejecter: (RCTPromiseRejectBlock) reject)
// {
//   [[[VertiTransferVCX alloc] init] getLedgerFees:^(NSError *error, NSString *fees) {
//     if (error != nil && error.code != 0)
//     {
//       NSString *indyErrorCode = [NSString stringWithFormat:@"%ld", (long)error.code];
//       reject(indyErrorCode, @"Error occurred while getting ledger fees", error);
//     } else {
//       resolve(fees);
//     }
//   }];
// }

// RCT_EXPORT_METHOD(getBiometricError: (RCTPromiseResolveBlock) resolve
//                   rejecter: (RCTPromiseRejectBlock) reject)
// {
//     LAContext *context = [[LAContext alloc] init];
//     NSError *error;

//     if ([context canEvaluatePolicy:LAPolicyDeviceOwnerAuthenticationWithBiometrics error:&error]) {
//       resolve(@"");
//         // Device does not support TouchID
//     } else {
//       NSString *errorReason;
//       switch (error.code) {
//           case kLAErrorBiometryNotEnrolled:
//               errorReason = @"BiometricsNotEnrolled";
//               break;
//           case kLAErrorBiometryLockout:
//               errorReason = @"BiometricsLockOut";
//               break;
//           default:
//               errorReason = @"default";
//               break;
//         }
//         reject(errorReason, @"TouchIDBiometricsLockOut", nil);
//     }
// }

@end


// --- END RnIndy.m