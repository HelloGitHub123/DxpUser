//
//  HJUserIdentityLogoutViewModel.m
//  DxpUserSDK
//
//  Created by 李标 on 2025/11/3.
//

#import "HJUserIdentityLogoutViewModel.h"
#import "DCNetAPIClient.h"
#import "HJUserIdentityLogoutModel.h"
#import <YYModel/YYModel.h>

@implementation HJUserIdentityLogoutViewModel

- (id)init {
	self = [super init];
	if (self) {
	}
	return self;
}

// User Identity Logout
- (void)requestUserIdentityLogoutWithDic:(NSDictionary *)dic block:(UserIdentityLogoutBlock)userIdentityLogoutBlock {
	[[DCNetAPIClient sharedClient] POST:@"/dxp/user-management/legacy/v1/user/identity-logout" paramaters:dic CompleteBlock:^(id res, NSError *error) {
		__weak __typeof(&*self)weakSelf = self;
		if (!error) {
			NSDictionary *dict = (NSDictionary *)res;
			if (![[dict objectForKey:@"resultCode"] isEqualToString:@"0"]) {
				weakSelf.errorMsg = [res objectForKey:@"resultMsg"];
				weakSelf.userIdentityLogoutModel.resultMsg = [res objectForKey:@"resultMsg"];
				userIdentityLogoutBlock(nil, weakSelf.userIdentityLogoutModel.resultMsg);
			} else {
				// 解析数据
				weakSelf.userIdentityLogoutModel = [HJUserIdentityLogoutModel yy_modelWithDictionary:dict];
				userIdentityLogoutBlock(weakSelf.userIdentityLogoutModel, @"");
			}
		} else {
			weakSelf.errorMsg = [res objectForKey:@"resultMsg"];
			weakSelf.userIdentityLogoutModel.resultMsg = [res objectForKey:@"resultMsg"];
			userIdentityLogoutBlock(nil, weakSelf.userIdentityLogoutModel.resultMsg);
		}
	}];
}


@end
