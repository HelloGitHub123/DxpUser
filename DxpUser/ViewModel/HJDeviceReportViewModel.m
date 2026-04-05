//
//  HJDeviceReportViewModel.m
//  DxpUserSDK
//
//  Created by 李标 on 2025/11/3.
//

#import "HJDeviceReportViewModel.h"
#import <DXPNetWorkingManagerLib/DCNetAPIClient.h>
#import "HJDeviceReportModel.h"
#import <YYModel/YYModel.h>

@implementation HJDeviceReportViewModel

- (id)init {
	self = [super init];
	if (self) {
	}
	return self;
}

// Report Device Info(CLP).
- (void)reportDeviceInfoWithDic:(NSDictionary *)dic block:(ReportDeviceInfoBlock)reportDeviceInfoBlock {
	[[DCNetAPIClient sharedClient] PUT:@"/dxp/user-management/legacy/v1/device/report" paramaters:dic CompleteBlock:^(id res, NSError *error) {
		__weak __typeof(&*self)weakSelf = self;
		if (!error) {
			NSDictionary *dict = (NSDictionary *)res;
			if (![[dict objectForKey:@"resultCode"] isEqualToString:@"0"]) {
				weakSelf.deviceReportModel.resultMsg = [res objectForKey:@"resultMsg"];
				reportDeviceInfoBlock(nil, weakSelf.deviceReportModel.resultMsg);
			} else {
				// 解析数据
				weakSelf.deviceReportModel = [HJDeviceReportModel yy_modelWithDictionary:dict];
				reportDeviceInfoBlock(weakSelf.deviceReportModel, @"");
			}
		} else {
			weakSelf.errorMsg = [res objectForKey:@"resultMsg"];
			weakSelf.deviceReportModel.resultMsg = [res objectForKey:@"resultMsg"];
			reportDeviceInfoBlock(nil, weakSelf.deviceReportModel.resultMsg);
		}
	}];
}

@end
