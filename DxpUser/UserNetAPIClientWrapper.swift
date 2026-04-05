//
//  UserNetAPIClientWrapper.swift
//  DxpUser
//
//  Created by 李标 on 2025/11/9.
//

import Foundation
import DXPNetWorkingManagerLib

@objc public class UserNetAPIClientWrapper: NSObject {
	
	// 单例实例 对外
	@objc public static let shared = UserNetAPIClientWrapper()
	
	// 对内
	private let objcInstance = DCNetAPIClient.shared()
	
	public override init() {
		super.init()
	}
	
	// 包装属性
	@objc public var baseUrl: String {
		get { return objcInstance?.baseUrl ?? "" }
		set { objcInstance?.baseUrl = newValue ?? "" }
	}
	
}
