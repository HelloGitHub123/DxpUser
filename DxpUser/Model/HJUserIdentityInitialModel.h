//
//  HJUserIdentityInitialModel.h
//  DxpUserSDK
//
//  Created by 李标 on 2025/11/2.
//

#import <Foundation/Foundation.h>
#import "DxpBaseObject.h"

NS_ASSUME_NONNULL_BEGIN

@interface HJUserIdentityInitialModel : DxpBaseObject

@property (nonatomic, copy) NSString *token;
@property (nonatomic, copy) NSString *refreshToken;
@property (nonatomic, copy) NSString *tokenExpiryDate;

@property (nonatomic, strong) NSString *resultCode;
@property (nonatomic, strong) NSString *resultMsg;
@end

NS_ASSUME_NONNULL_END
