//
//  SceneDelegate+Navigation.swift
//  Harbour
//
//  Created by royal on 26/03/2024.
//  Copyright © 2024 shameful. All rights reserved.
//

import Foundation
import Navigation

extension SceneDelegate: DeeplinkHandlable {
	@MainActor
	func resetSheets() {
		isSettingsSheetPresented = false
	}

	@MainActor
	func navigate(to tab: ViewTab, with navigationPath: AnyHashable...) {
		activeTab = tab

		switch tab {
		case .containers:
			navigationPathContainers.removeLast(navigationPathContainers.count)
			if !navigationPath.isEmpty {
				navigationPathContainers.append(navigationPath)
			}
		case .stacks:
			navigationPathStacks.removeLast(navigationPathStacks.count)
			if !navigationPath.isEmpty {
				navigationPathStacks.append(navigationPath)
			}
		}
	}

	@MainActor
	func handleURL(_ url: URL) {
		logger.notice("Opening from URL: \"\(url.absoluteString, privacy: .sensitive(mask: .hash))\"")

		guard let destination = Deeplink.destination(from: url) else { return }

		resetSheets()

		// swiftlint:disable force_cast
		switch destination.host {
		case .containerDetails:
			typealias DestinationView = ContainerDetailsView

			navigate(to: .containers)
			DestinationView.handleNavigation(&navigationPathContainers, with: destination as! DestinationView.DeeplinkDestination)
		case .stackDetails:
			typealias DestinationView = StackDetailsView

			navigate(to: .stacks)
			DestinationView.handleNavigation(&navigationPathStacks, with: destination as! DestinationView.DeeplinkDestination)
		case .settings:
			isSettingsSheetPresented = true
		}
		// swiftlint:enable force_cast
	}
}
