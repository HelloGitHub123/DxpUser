//
//  HJUserLogic.m
//  DxpUserSDK
//
//  Created by 李标 on 2025/11/2.
//

#import "HJUserLogic.h"
#import "HJRequestProtocolForVM.h"
#import <DXPToolsLib/HJMBProgressHUD+Category.h>
#import <DXPToolsLib/SNAlertMessage.h>
#import "DXPHJToolsHeader.h"
#import "HJRequestProtocolForVM.h"
#import "HJUserIdentityInitialViewModel.h"
#import "HJDeviceReportViewModel.h"
#import "HJDeviceReportViewModel.h"
#import "HJUserIdentityLogoutViewModel.h"

@interface HJUserLogic ()

@property (nonatomic, strong) HJUserIdentityInitialViewModel *viewModel;
@property (nonatomic, strong) HJDeviceReportViewModel *reportViewModel;
@property (nonatomic, strong) HJUserIdentityLogoutViewModel *userIdentityLogoutViewModel;

//@property (nonatomic, copy) UserIdentityInitialBlock userIdentityInitialBlock;
//@property (nonatomic, copy) ReportDeviceInfoBlock reportDeviceInfoBlock;
//@property (nonatomic, copy) UserIdentityLogoutBlock userIdentityLogoutBlock;
@end

@implementation HJUserLogic

- (instancetype)init {
	self = [super init];
	if (self) {
	}
	return self;
}

// Initial User Identity
- (void)queryUserIdentityInitialWithPrefix:(NSString *)prefix custNbr:(NSString *)custNbr serviceNumber:(NSString *)serviceNumber subsId:(NSString *)subsId block:(UserIdentityInitialBlock)userIdentityInitialBlock {
	
//	self.userIdentityInitialBlock = userIdentityInitialBlock;
	
	NSMutableDictionary *parmas = [[NSMutableDictionary alloc] init];
	[parmas setValue:subsId forKey:@"subsId"];
	[parmas setValue:serviceNumber forKey:@"serviceNumber"];
	[parmas setValue:custNbr forKey:@"custNbr"];
	[parmas setValue:prefix forKey:@"prefix"];
	[self.viewModel queryUserIdentityInitialWithDic:parmas block:^(HJUserIdentityInitialModel * userIdentityInitialModel, NSString * errorMsg) {
		if (userIdentityInitialBlock) {
			userIdentityInitialBlock(userIdentityInitialModel, errorMsg);
		}
	}];
}

// Report Device Info(CLP).
- (void)reportDeviceInfoWithPushToken:(NSString *)pushToken pushServiceVendor:(NSString *)pushServiceVendor block:(ReportDeviceInfoBlock)reportDeviceInfoBlock {
	
//	self.reportDeviceInfoBlock = reportDeviceInfoBlock;
	
	NSMutableDictionary *parmas = [[NSMutableDictionary alloc] init];
	[parmas setValue:pushToken forKey:@"pushToken"];
	[parmas setValue:pushServiceVendor forKey:@"pushServiceVendor"];
	
	[self.reportViewModel reportDeviceInfoWithDic:parmas block:^(HJDeviceReportModel * deviceReportModel, NSString * errorMsg) {
		if (reportDeviceInfoBlock) {
			reportDeviceInfoBlock(deviceReportModel,errorMsg);
		}
	}];
}

// User Identity Logout
- (void)requestUserIdentityLogoutWithPushToken:(NSString *)pushToken pushServiceVendor:(NSString *)pushServiceVendor block:(UserIdentityLogoutBlock)userIdentityLogoutBlock {
	
//	self.userIdentityLogoutBlock = userIdentityLogoutBlock;
	
	NSMutableDictionary *parmas = [[NSMutableDictionary alloc] init];
	[parmas setValue:pushToken forKey:@"pushToken"];
	[parmas setValue:pushServiceVendor forKey:@"pushServiceVendor"];
	
	[self.userIdentityLogoutViewModel requestUserIdentityLogoutWithDic:parmas block:^(HJUserIdentityLogoutModel * userIdentityLogoutModel, NSString * errorMsg) {
		if (userIdentityLogoutBlock) {
			userIdentityLogoutBlock(userIdentityLogoutModel,errorMsg);
		}
	}];
}

//#pragma mark - HJVMRequestDelegate
//- (void)requestSuccess:(NSObject *)vm method:(NSString *)methodFlag {
//	[SNAlertMessage hideLoading];
//	
//	// Initial User Identity
//	if ([methodFlag isEqualToString:UserIdentityInitial]) {
//		HJUserIdentityInitialModel *model = ((HJUserIdentityInitialViewModel *)vm).userIdentityInitialModel;
//		if (self.userIdentityInitialBlock) {
//			self.userIdentityInitialBlock(model, @"");
//		}
//	}
//	
//	// report device Info
//	if ([methodFlag isEqualToString:DeviceReport]) {
//		HJDeviceReportModel *model = ((HJDeviceReportViewModel *)vm).deviceReportModel;
//		if (self.reportDeviceInfoBlock) {
//			self.reportDeviceInfoBlock(model, @"");
//		}
//	}
//	
//	// User Identity Logout
//	if ([methodFlag isEqualToString:UserIdentityLogout]) {
//		HJUserIdentityLogoutModel *model = ((HJUserIdentityLogoutViewModel *)vm).userIdentityLogoutModel;
//		if (self.userIdentityLogoutBlock) {
//			self.userIdentityLogoutBlock(model, @"");
//		}
//	}
//}
//
//- (void)requestFailure:(NSObject *)vm method:(NSString *)methodFlag {
//	[SNAlertMessage hideLoading];
//	
//	// Initial User Identity
//	if ([methodFlag isEqualToString:UserIdentityInitial]) {
//		NSString *msg = ((HJUserIdentityInitialViewModel *)vm).errorMsg;
//		if (self.userIdentityInitialBlock) {
//			self.userIdentityInitialBlock(nil, msg);
//		}
//	}
//	
//	// report device Info
//	if ([methodFlag isEqualToString:DeviceReport]) {
//		NSString *msg = ((HJDeviceReportViewModel *)vm).deviceReportModel.resultMsg;
//		if (self.reportDeviceInfoBlock) {
//			self.reportDeviceInfoBlock(nil, msg);
//		}
//	}
//	
//	// User Identity Logout
//	if ([methodFlag isEqualToString:UserIdentityLogout]) {
//		NSString *msg = ((HJUserIdentityLogoutViewModel *)vm).userIdentityLogoutModel.resultMsg;
//		
//		if (self.userIdentityLogoutBlock) {
//			self.userIdentityLogoutBlock(nil, msg);
//		}
//	}
//}

#pragma mark -- lazy load
- (HJUserIdentityInitialViewModel *)viewModel {
	if (!_viewModel) {
		_viewModel = [[HJUserIdentityInitialViewModel alloc] init];
//		_viewModel.delegate = self;
	}
	return _viewModel;
}

- (HJDeviceReportViewModel *)reportViewModel {
	if (!_reportViewModel) {
		_reportViewModel = [[HJDeviceReportViewModel alloc] init];
//		_reportViewModel.delegate = self;
	}
	return _reportViewModel;
}

- (HJUserIdentityLogoutViewModel *)userIdentityLogoutViewModel {
	if (!_userIdentityLogoutViewModel) {
		_userIdentityLogoutViewModel = [[HJUserIdentityLogoutViewModel alloc] init];
//		_userIdentityLogoutViewModel.delegate = self;
	}
	return _userIdentityLogoutViewModel;
}

@end
