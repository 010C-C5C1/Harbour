//
//  ContentView.swift
//  Harbour
//
//  Created by royal on 17/07/2022.
//

import SwiftUI
import PortainerKit
import IndicatorsKit
import CommonFoundation
import CommonHaptics

// MARK: - ContentView

struct ContentView: View {
	private typealias Localization = Localizable.ContentView

	@EnvironmentObject private var appDelegate: AppDelegate
	@EnvironmentObject private var sceneDelegate: SceneDelegate
	@EnvironmentObject private var appState: AppState
	@EnvironmentObject private var portainerStore: PortainerStore
	@EnvironmentObject private var preferences: Preferences

	@StateObject private var viewModel: ViewModel

	init() {
		let viewModel = ViewModel()
		self._viewModel = .init(wrappedValue: viewModel)
	}

	private var isSummaryVisible: Bool {
		preferences.cvDisplaySummary && viewModel.viewState == .hasContainers && viewModel.searchText.isReallyEmpty
	}

	@ViewBuilder
	private var titleMenu: some View {
		ForEach(portainerStore.endpoints) { endpoint in
			Button {
				Haptics.generateIfEnabled(.light)
				viewModel.selectEndpoint(endpoint)
			} label: {
				let isSelected = portainerStore.selectedEndpoint?.id == endpoint.id
				Label(endpoint.name ?? endpoint.id.description, systemImage: isSelected ? SFSymbol.checkmark : "")
			}
		}
	}

	@ToolbarContentBuilder
	private var toolbarMenu: some ToolbarContent {
		ToolbarItem(placement: .primaryAction) {
			Button {
//				Haptics.generateIfEnabled(.sheetPresentation)
				sceneDelegate.isSettingsSheetPresented.toggle()
			} label: {
				Label(Localization.NavigationButton.settings, systemImage: SFSymbol.settings)
			}
		}

		#if ENABLE_PREVIEW_FEATURES
		ToolbarItem(placement: .navigationBarLeading) {
			NavigationLink {
				StacksView()
			} label: {
				Label(Localization.NavigationButton.stacks, systemImage: SFSymbol.stack)
//					.symbolVariant(portainerStore.isSetup ? .none : .slash)
			}
		}
		#endif
	}

	@ViewBuilder
	private var containersView: some View {
		ScrollView {
			#if ENABLE_PREVIEW_FEATURES
			if isSummaryVisible {
				VStack {
					// TODO: Summary
					Text("Summary")
					Divider()
				}
				.transition(.move(edge: .top).combined(with: .opacity))
			}
			#endif

			ContainersView(containers: viewModel.containers)
				.transition(.opacity)
				.animation(.easeInOut, value: viewModel.containers)
		}
		.modifier(
			ContainersView.ListModifier {
				ContainersView.NoContainersPlaceholder(isEmpty: viewModel.containers.isEmpty)
			}
		)
		.refreshable(action: viewModel.refresh)
		.searchable(text: $viewModel.searchText)
		.animation(.easeInOut, value: isSummaryVisible)
	}

	// MARK: Body

	var body: some View {
		NavigationWrapped(useColumns: viewModel.shouldUseColumns) {
			containersView
				.navigationTitle(viewModel.navigationTitle)
				.navigationBarTitleDisplayMode(.inline)
				.toolbarTitleMenu {
					titleMenu
				}
				.toolbar {
					toolbarMenu
				}
		} placeholderContent: {
			Text(Localization.noContainerSelectedPlaceholder)
				.foregroundStyle(.tertiary)
		}
		.indicatorOverlay(model: sceneDelegate.indicators)
		.sheet(isPresented: $sceneDelegate.isSettingsSheetPresented) {
			SettingsView()
				.indicatorOverlay(model: sceneDelegate.indicators)
		}
		.sheet(isPresented: $viewModel.isLandingSheetPresented) {
			viewModel.onLandingDismissed()
		} content: {
			LandingView()
				.indicatorOverlay(model: sceneDelegate.indicators)
		}
		.environment(\.errorHandler, .init(sceneDelegate.handleError))
		.environment(\.showIndicator, sceneDelegate.showIndicator)
		.onOpenURL { url in
			sceneDelegate.onOpenURL(url)
		}
		.onContinueUserActivity("OpenContainerDetails") { userActivity in
			print(userActivity)
		}
		.onContinueUserActivity(HarbourUserActivityIdentifier.containerDetails) { userActivity in
			sceneDelegate.onContinueContainerDetailsActivity(userActivity)
		}
	}
}

// MARK: - Previews

#Preview {
	ContentView()
		.environmentObject(AppState.shared)
		.environmentObject(PortainerStore.shared)
		.environmentObject(Preferences.shared)
}