//
//  View+withEnvironment.swift
//  Harbour
//
//  Created by royal on 17/01/2024.
//  Copyright © 2024 shameful. All rights reserved.
//

import SwiftUI

extension View {
	@ViewBuilder
	func withEnvironment(appState: AppState, preferences: Preferences, portainerStore: PortainerStore) -> some View {
		self
			.environmentObject(portainerStore)
			.environmentObject(preferences)
			.environment(appState)
			.environment(\.portainerServerURL, portainerStore.serverURL)
			.environment(\.portainerSelectedEndpointID, portainerStore.selectedEndpoint?.id)
			.environment(\.cvUseGrid, preferences.cvUseGrid)
			.environment(\.ikEnableHaptics, preferences.enableHaptics)
	}
}
