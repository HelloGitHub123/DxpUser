//
//  HJUserIdentityLogoutViewModel.h
//  DxpUserSDK
//
//  Created by 李标 on 2025/11/3.
//

#import <Foundation/Foundation.h>
#import "DxpBaseObject.h"
#import "HJUserIdentityLogoutModel.h"
#import "HJUserLogic.h"

NS_ASSUME_NONNULL_BEGIN

static NSString * _Nullable const UserIdentityLogout = @"UserIdentityLogout";

@interface HJUserIdentityLogoutViewModel : DxpBaseObject

@property (nonatomic, weak) id<HJVMRequestDelegate> delegate;
@property (nonatomic, strong) HJUserIdentityLogoutModel *userIdentityLogoutModel;

// User Identity Logout
- (void)requestUserIdentityLogoutWithDic:(NSDictionary *)dic block:(UserIdentityLogoutBlock)userIdentityLogoutBlock;
@end

NS_ASSUME_NONNULL_END
