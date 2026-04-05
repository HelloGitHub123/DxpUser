//
//  HJUserIdentityInitialViewModel.m
//  DxpUserSDK
//
//  Created by 李标 on 2025/11/2.
//

#import "HJUserIdentityInitialViewModel.h"
#import "DCNetAPIClient.h"
#import "HJUserIdentityInitialModel.h"
#import <YYModel/YYModel.h>

@implementation HJUserIdentityInitialViewModel

- (id)init {
	self = [super init];
	if (self) {
	}
	return self;
}

// Initial User Identity
- (void)queryUserIdentityInitialWithDic:(NSDictionary *)dic block:(UserIdentityInitialBlock)userIdentityInitialBlock {
	[[DCNetAPIClient sharedClient] POST:@"/dxp/user-management/legacy/v1/user/identity-initial" paramaters:dic CompleteBlock:^(id res, NSError *error) {
		__weak __typeof(&*self)weakSelf = self;
		if (!error) {
			NSDictionary *dict = (NSDictionary *)res;
			if (![[dict objectForKey:@"resultCode"] isEqualToString:@"0"]) {
				weakSelf.userIdentityInitialModel.resultMsg = [res objectForKey:@"resultMsg"];
				// 回调
				userIdentityInitialBlock(nil, weakSelf.userIdentityInitialModel.resultMsg);
			} else {
				// 解析数据
				weakSelf.userIdentityInitialModel = [HJUserIdentityInitialModel yy_modelWithDictionary:[dict objectForKey:@"data"]];
				weakSelf.userIdentityInitialModel.resultCode = [res objectForKey:@"resultCode"];
				// 回调
				userIdentityInitialBlock(weakSelf.userIdentityInitialModel, @"");
			}
		} else {
			weakSelf.userIdentityInitialModel.resultMsg = [res objectForKey:@"resultMsg"];
			// 回调
			userIdentityInitialBlock(nil, weakSelf.userIdentityInitialModel.resultMsg);
		}
	}];
}

@end
