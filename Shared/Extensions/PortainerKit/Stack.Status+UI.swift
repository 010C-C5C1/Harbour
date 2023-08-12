//
//  Stack.Status+UI.swift
//  Harbour
//
//  Created by royal on 07/06/2023.
//

import PortainerKit
import SwiftUI

// MARK: - Stack.Status+label

extension Stack.Status {
	var label: String {
		switch self {
		case .active:	String(localized: "PortainerKit.Stack.Status.Active")
		case .inactive: String(localized: "PortainerKit.Stack.Status.Inactive")
		}
	}
}

// MARK: - Stack.Status+color

extension Stack.Status {
	var color: Color {
		switch self {
		case .active:	.green
		case .inactive:	.red
		}
	}
}
