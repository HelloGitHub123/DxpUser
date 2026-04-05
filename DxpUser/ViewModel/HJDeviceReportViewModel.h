//
//  HJDeviceReportViewModel.h
//  DxpUserSDK
//
//  Created by 李标 on 2025/11/3.
//

#import <Foundation/Foundation.h>
#import "DxpBaseObject.h"
#import "HJDeviceReportModel.h"
#import "HJUserLogic.h"

NS_ASSUME_NONNULL_BEGIN

static NSString * _Nullable const DeviceReport = @"DeviceReport";


@interface HJDeviceReportViewModel : DxpBaseObject

@property (nonatomic, weak) id<HJVMRequestDelegate> delegate;
@property (nonatomic, strong) HJDeviceReportModel *deviceReportModel;

// Report Device Info(CLP).
- (void)reportDeviceInfoWithDic:(NSDictionary *)dic block:(ReportDeviceInfoBlock)reportDeviceInfoBlock;
@end

NS_ASSUME_NONNULL_END
