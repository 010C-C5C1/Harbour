//
//  HarbourApp.swift
//  Harbour
//
//  Created by royal on 17/07/2022.
//

import SwiftUI

// MARK: - HarbourApp

@main
struct HarbourApp: App {
	@Environment(\.scenePhase) var scenePhase
	@StateObject var appState: AppState = .shared
	@StateObject var portainerStore: PortainerStore = .shared
	@StateObject var preferences: Preferences = .shared

	var body: some Scene {
		WindowGroup {
			ContentView()
				.environment(\.containersViewUseGrid, preferences.cvUseGrid)
				.environmentObject(appState)
				.environmentObject(portainerStore)
				.environmentObject(preferences)
		}
		.defaultAppStorage(Preferences.ud)
		.onChange(of: scenePhase, perform: onScenePhaseChange)
	}
}

// MARK: - HarbourApp+Actions

private extension HarbourApp {
	func onScenePhaseChange(_ scenePhase: ScenePhase) {
		switch scenePhase {
			case .background:
				break
			case .inactive:
				break
			case .active:
				portainerStore.refresh()
			@unknown default:
				break
		}
	}
}
