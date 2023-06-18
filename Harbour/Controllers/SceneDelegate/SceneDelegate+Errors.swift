//
//  SceneDelegate+Errors.swift
//  Harbour
//
//  Created by royal on 19/12/2022.
//

import Foundation
import CommonFoundation
import CommonHaptics
import IndicatorsKit

extension SceneDelegate {
	@MainActor
	func handleError(_ error: Error, _debugInfo: String = ._debugInfo()) {
		guard !error.isCancellationError else {
			logger.debug("Cancelled error: \(error, privacy: .public) [\(_debugInfo, privacy: .public)]")
			return
		}

		logger.error("Error: \(error, privacy: .public) [\(_debugInfo, privacy: .public)]")

		Haptics.generateIfEnabled(.error)
		showIndicator(.error(error))
	}
}