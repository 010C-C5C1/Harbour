//
//  Bundle+.swift
//  Harbour
//
//  Created by royal on 11/06/2021.
//

import Foundation

public extension Bundle {
	var buildVersion: String {
		Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String ?? "Unknown"
	}

	var buildNumber: String {
		Bundle.main.infoDictionary?["CFBundleVersion"] as? String ?? "Unknown"
	}
}