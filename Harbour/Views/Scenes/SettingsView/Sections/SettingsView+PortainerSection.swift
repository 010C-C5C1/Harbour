//
//  SettingsView+PortainerSection.swift
//  Harbour
//
//  Created by royal on 23/07/2022.
//

import SwiftUI

// MARK: - SettingsView+PortainerSection

extension SettingsView {
	struct PortainerSection: View {
		private typealias Localization = Localizable.Settings.Portainer

		@State private var isSetupSheetPresented = false

		var body: some View {
			Section(Localization.title) {
				EndpointsMenu(isSetupSheetPresented: $isSetupSheetPresented)
			}
			.sheet(isPresented: $isSetupSheetPresented) {
				SetupView()
			}
		}
	}
}

// MARK: - SettingsView.PortainerSection+Components

private extension SettingsView.PortainerSection {
	struct EndpointsMenu: View {
		private typealias Localization = Localizable.Settings.Portainer.EndpointsMenu

		@EnvironmentObject private var portainerStore: PortainerStore
		@EnvironmentObject private var appState: AppState
		@Environment(\.sceneErrorHandler) private var sceneErrorHandler
		@Binding var isSetupSheetPresented: Bool

		private var serverURLLabel: String? {
			guard let url = portainerStore.serverURL else { return nil }
			return formattedURL(url)
		}

		var body: some View {
			let urls = portainerStore.savedURLs.sorted { $0.absoluteString > $1.absoluteString }
			Menu(content: {
				ForEach(urls, id: \.absoluteString) { url in
					urlMenu(for: url)
				}

				Divider()

				Button(action: {
					UIDevice.generateHaptic(.sheetPresentation)
					isSetupSheetPresented = true
				}) {
					Label(Localization.add, systemImage: SFSymbol.add)
				}
			}) {
				HStack {
//					SettingsView.OptionIcon(symbolName: "tag", color: .accentColor)
					Text(serverURLLabel ?? Localization.noServerPlaceholder)
						.font(SettingsView.standaloneLabelFont)
						.foregroundStyle(serverURLLabel != nil ? .primary : .secondary)

					Spacer()

					Image(systemName: "chevron.down")
						.fontWeight(.medium)
				}
			}
		}

		private func deleteServer(_ url: URL) {
			// TODO: deleteServer(_:)
			print(#function, url)
		}

		private func formattedURL(_ url: URL) -> String {
			if let scheme = url.scheme {
				return url.absoluteString.replacing("\(scheme)://", with: "")
			}
			return url.absoluteString
		}

		@ViewBuilder
		private func urlMenu(for url: URL) -> some View {
			Menu(formattedURL(url), content: {
				if portainerStore.serverURL == url {
					Label(Localization.Server.inUse, systemImage: SFSymbol.selected)
						.symbolVariant(.circle.fill)
				} else {
					Button(action: {
						UIDevice.generateHaptic(.buttonPress)
						appState.switchPortainerServer(to: url, errorHandler: sceneErrorHandler)
					}) {
						Label(Localization.Server.use, systemImage: SFSymbol.selected)
							.symbolVariant(.circle)
					}
				}

				Divider()

				Button(role: .destructive, action: {
					UIDevice.generateHaptic(.buttonPress)
					deleteServer(url)
				}) {
					Label(Localization.Server.delete, systemImage: SFSymbol.remove)
				}
			})
		}
	}
}

// MARK: - Previews

struct PortainerSection_Previews: PreviewProvider {
	static var previews: some View {
		SettingsView.PortainerSection()
	}
}
