//
//  SystemStatus.swift
//  PortainerKit
//
//  Created by royal on 25/09/2023.
//  Copyright © 2023 shameful. All rights reserved.
//

import Foundation

public struct SystemStatus: Identifiable, Equatable, Codable, Sendable {
	enum CodingKeys: String, CodingKey {
		case version = "Version"
		case instanceID = "InstanceID"
	}

	public let version: String
	public let instanceID: String

	public var id: String {
		instanceID
	}
}
