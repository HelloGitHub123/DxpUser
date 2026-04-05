//
//  HJUserIdentityInitialViewModel.h
//  DxpUserSDK
//
//  Created by 李标 on 2025/11/2.
//

#import "DxpBaseObject.h"
#import "HJUserIdentityInitialModel.h"
#import "HJUserLogic.h"

NS_ASSUME_NONNULL_BEGIN

static NSString * _Nullable const UserIdentityInitial = @"UserIdentityInitial";

@interface HJUserIdentityInitialViewModel : DxpBaseObject

@property (nonatomic, weak) id<HJVMRequestDelegate> delegate;
@property (nonatomic, strong) HJUserIdentityInitialModel *userIdentityInitialModel;

// Initial User Identity
- (void)queryUserIdentityInitialWithDic:(NSDictionary *)dic block:(UserIdentityInitialBlock)userIdentityInitialBlock;
@end

NS_ASSUME_NONNULL_END
