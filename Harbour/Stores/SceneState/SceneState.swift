//
//  SceneState.swift
//  Harbour
//
//  Created by royal on 18/07/2022.
//

import Foundation
import SwiftUI
import os.log
import PortainerKit
import IndicatorsKit

// MARK: - SceneState

@MainActor
final class SceneState: ObservableObject {

	// MARK: Internal properties

	// swiftlint:disable:next force_unwrapping
	internal let logger: Logger = Logger(subsystem: Bundle.main.bundleIdentifier!, category: "SceneState")

	// MARK: Public properties

	public let id: String
	public let indicators: Indicators = Indicators()

	// MARK: Navigation

	@Published public var isSettingsSheetPresented: Bool = false
	@Published public var navigationPath: NavigationPath = NavigationPath()

	// MARK: Data State

	public var isLoading: Bool {
		let portainerStore = PortainerStore.shared
		let setupCancelled = portainerStore.setupTask?.isCancelled ?? true
		let endpointsCancelled = portainerStore.endpointsTask?.isCancelled ?? true
		let containersCancelled = portainerStore.containersTask?.isCancelled ?? true
		return !setupCancelled || !endpointsCancelled || !containersCancelled
	}

	// MARK: init

	init(id: String = UUID().uuidString) {
		self.id = id
	}
}