//
//  Portainer+APIError.swift
//  PortainerKit
//
//  Created by royal on 10/06/2021.
//

import Foundation

public extension Portainer {
	struct APIError: LocalizedError, Decodable {
		public let message: String
		public let details: String?

		public var errorDescription: String? {
			message.trimmingCharacters(in: .whitespacesAndNewlines)
		}

		public var failureReason: String? {
			details?.trimmingCharacters(in: .whitespacesAndNewlines)
		}
	}
}

public extension Portainer.APIError {
	var isAuthorizationError: Bool {
		switch message.trimmingCharacters(in: .whitespacesAndNewlines).lowercased() {
		case "invalid jwt token", "a valid authorisation token is missing", "unauthorized":
			true
		default:
			false
		}
	}
}
