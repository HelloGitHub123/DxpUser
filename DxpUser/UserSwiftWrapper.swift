//
//  UserSwiftWrapper.swift
//  DxpUser
//
//  Created by 李标 on 2025/11/9.
//

import Foundation

@objc public class UserSwiftWrapper: NSObject {
	
	// 创建实例
	private let objcInstance = HJUserLogic()
	
	//
	@objc public func queryUserIdentityInitialWithPrefix(prefix:String,custNbr:String, serviceNumber:String,subsId:String, completion: @escaping (HJUserIdentityInitialModel?, String) -> Void) {
		
		objcInstance.queryUserIdentityInitial(withPrefix: prefix, custNbr: custNbr, serviceNumber: serviceNumber, subsId: subsId) { (model, errorMsg)  in
			completion(model, errorMsg)
		}
	}
	
	
	@objc public func reportDeviceInfoWithToken(token:String, pushServiceVendor:String, completion:@escaping (HJDeviceReportModel?, String) ->Void ) {
		
		objcInstance.reportDeviceInfo(withPushToken: token, pushServiceVendor: "") { (model, errorMsg) in
			completion(model, errorMsg)
		}
	}
	
	
	@objc public func requestUserIdentityLogoutWithPushToken(token:String, pushServiceVendor:String, completion:@escaping (HJUserIdentityLogoutModel?, String) -> Void) {
		
		objcInstance.requestUserIdentityLogout(withPushToken: token, pushServiceVendor: "") { (model, errorMsg) in
			completion(model, errorMsg)
		}
	}
	
	
}
