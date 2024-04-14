//
//  ContentView+ViewModel.swift
//  Harbour
//
//  Created by royal on 30/01/2023.
//  Copyright © 2023 shameful. All rights reserved.
//

import Foundation
import Observation
import PortainerKit
#if canImport(UIKit)
import UIKit
#endif

// MARK: - ContentView+ViewModel

extension ContentView {
	@Observable
	final class ViewModel: @unchecked Sendable {
		private let portainerStore: PortainerStore
		private let preferences = Preferences.shared

		private var fetchTask: Task<Void, Error>?
		private var fetchError: Error?

		private(set) var suggestedSearchTokens: [SearchToken] = []

		var searchText = ""
		var searchTokens: [SearchToken] = []
		var isSearchActive = false
		var isLandingSheetPresented = !Preferences.shared.landingDisplayed

		var viewState: ViewState<[Container], Error> {
			let containers = portainerStore.containers

			if !(fetchTask?.isCancelled ?? true) {
				return .reloading(containers)
			}

			if portainerStore.isRefreshing {
				return containers.isEmpty ? .loading : .reloading(containers)
			}

			if let fetchError {
				return .failure(fetchError)
			}

			return .success(containers)
		}

		var containers: [Container] {
			portainerStore.containers
				.filter { container in
					for token in searchTokens {
						let matches = token.matchesContainer(container)
						if !matches { return false }
					}

					return true
				}
				.filter(searchText)
		}

		var shouldShowEmptyPlaceholder: Bool {
			switch viewState {
			case .loading:
				false
			case .reloading:
				false
			case .success:
				!viewState.isLoading && containers.isEmpty
			case .failure:
				false
			}
		}

		var shouldShowViewStateBackground: Bool {
			containers.isEmpty
		}

		var shouldUseColumns: Bool {
			#if os(iOS)
			guard UIDevice.current.userInterfaceIdiom == .pad || UIDevice.current.userInterfaceIdiom == .mac else {
				return false
			}
			#endif
			return preferences.cvUseColumns
		}

		var endpointsMenuTitle: String {
			if let selectedEndpoint = portainerStore.selectedEndpoint {
				return selectedEndpoint.name ?? selectedEndpoint.id.description
			}
			if portainerStore.endpoints.isEmpty {
				return String(localized: "ContentView.NoEndpointsAvailable")
			}
			return String(localized: "ContentView.NoEndpointSelected")
		}

		var canUseEndpointsMenu: Bool {
			portainerStore.selectedEndpoint != nil || !portainerStore.endpoints.isEmpty
		}

		var navigationTitle: String {
			if let selectedEndpoint = portainerStore.selectedEndpoint {
				return selectedEndpoint.name ?? selectedEndpoint.id.description
			}
			return String(localized: "AppName")
		}

		init() {
			let portainerStore = PortainerStore.shared
			self.portainerStore = portainerStore
		}

		@MainActor
		func refresh() async throws {
			fetchTask?.cancel()
			self.fetchTask = Task {
				defer { self.fetchTask = nil }

				fetchError = nil

				do {
					let task = portainerStore.refresh()
					_ = try await task.value

					let staticTokens: [SearchToken] = [
						.status(isOn: true),
						.status(isOn: false)
					]

					let stacks = Set(portainerStore.containers.compactMap(\.stack))
					let stacksTokens = stacks
						.sorted()
						.map { SearchToken.stack($0) }

					self.suggestedSearchTokens = staticTokens + stacksTokens
				} catch {
					fetchError = error
					throw error
				}
			}
			try await fetchTask?.value
		}

		@MainActor
		func selectEndpoint(_ endpoint: Endpoint?) {
			portainerStore.setSelectedEndpoint(endpoint)
		}

		@MainActor
		func filterByStackName(_ stackName: String?) {
			if let stackName {
				searchTokens = [.stack(stackName)]
			} else {
				searchTokens = []
			}
		}

		@MainActor
		func onLandingDismissed() {
			preferences.landingDisplayed = true
		}

//		@MainActor
//		func onContainersChange(_ before: [Container], after: [Container]) {
//			viewState = .success(())
//		}
	}
}

// MARK: - ContentView.ViewModel+SearchToken

extension ContentView.ViewModel {
	enum SearchToken: Identifiable {
		case stack(String)
		case status(isOn: Bool)

		var id: String {
			switch self {
			case .stack(let stackName):
				"stack:\(stackName)"
			case .status(let isOn):
				"status:\(isOn)"
			}
		}

		var title: String {
			switch self {
			case .stack(let stackName):
				stackName
			case .status(let isOn):
				String(localized: isOn ? "ContentView.SearchToken.Status.On" : "ContentView.SearchToken.Status.Off")
			}
		}

		var icon: String {
			switch self {
			case .stack:
				SFSymbol.stack
			case .status(let isOn):
				isOn ? SFSymbol.start : SFSymbol.stop
			}
		}

		func matchesContainer(_ container: Container) -> Bool {
			switch self {
			case .stack(let stackName):
				return container.stack == stackName
			case .status(let isOn):
				let isContainerOn = container.state.isRunning
				return isOn ? isContainerOn : !isContainerOn
			}
		}
	}
}
