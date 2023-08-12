//
//  SettingsView+PortainerSection.swift
//  Harbour
//
//  Created by royal on 23/07/2022.
//

import CommonFoundation
import CommonHaptics
import KeychainKit
import SwiftUI

// MARK: - SettingsView+PortainerSection

extension SettingsView {
	struct PortainerSection: View {
		@EnvironmentObject private var viewModel: ViewModel

		var body: some View {
			Section("SettingsView.Portainer.Title") {
				EndpointsMenu()
			}
			.sheet(isPresented: $viewModel.isSetupSheetPresented) {
				viewModel.refreshServers()
			} content: {
				SetupView()
			}
		}
	}
}

// MARK: - SettingsView.PortainerSection+Components

private extension SettingsView.PortainerSection {
	struct EndpointsMenu: View {
		@EnvironmentObject private var viewModel: SettingsView.ViewModel
		@Environment(\.errorHandler) private var errorHandler

		private var serverURLLabel: String? {
			guard let url = viewModel.activeURL else { return nil }
			return formattedURL(url)
		}

		var body: some View {
			let urls = viewModel.serverURLs.sorted { $0.absoluteString > $1.absoluteString }
			Menu {
				ForEach(urls, id: \.absoluteString) { url in
					urlMenu(for: url)
				}

				Divider()

				Button {
//					Haptics.generateIfEnabled(.sheetPresentation)
					viewModel.isSetupSheetPresented.toggle()
				} label: {
					Label("SettingsView.Portainer.EndpointsMenu.Add", systemImage: SFSymbol.plus)
				}
			} label: {
				let _serverURLLabel = serverURLLabel ?? "SettingsView.Portainer.EndpointsMenu.NoServersPlaceholder"
				HStack {
//					SettingsView.OptionIcon(symbolName: "tag", color: .accentColor)
					Text(_serverURLLabel)
						.font(SettingsView.labelFontHeadline)
						.foregroundStyle(serverURLLabel != nil ? .primary : .secondary)

					Spacer()

					Image(systemName: SFSymbol.chevronDown)
						.fontWeight(.medium)
				}
				.transition(.opacity)
				.animation(.easeInOut, value: _serverURLLabel)
			}
		}

		@ViewBuilder
		private func urlMenu(for url: URL) -> some View {
			Menu(formattedURL(url), content: {
				if viewModel.activeURL == url {
					Label("SettingsView.Portainer.EndpointsMenu.Server.InUse", systemImage: SFSymbol.checkmark)
						.symbolVariant(.circle.fill)
				} else {
					Button {
						Haptics.generateIfEnabled(.buttonPress)
						viewModel.switchPortainerServer(to: url, errorHandler: errorHandler)
					} label: {
						Label("SettingsView.Portainer.EndpointsMenu.Server.Use", systemImage: SFSymbol.checkmark)
							.symbolVariant(.circle)
					}
				}

				#if DEBUG
				CopyButton("SettingsView.Portainer.EndpointsMenu.Server.CopyToken") {
					try? Keychain.shared.getString(for: url)
				}
				#endif

				Divider()

				Menu {
					Button(role: .destructive) {
						Haptics.generateIfEnabled(.buttonPress)
						viewModel.removeServer(url, errorHandler: errorHandler)
					} label: {
						Label("SettingsView.Portainer.EndpointsMenu.Server.Remove!", systemImage: SFSymbol.remove)
					}
				} label: {
					Label("SettingsView.Portainer.EndpointsMenu.Server.Remove", systemImage: SFSymbol.remove)
				}
				.foregroundStyle(.red)
			})
		}

		private func formattedURL(_ url: URL) -> String {
			if let scheme = url.scheme {
				return url.absoluteString.replacing("\(scheme)://", with: "")
			}
			return url.absoluteString
		}
	}
}

// MARK: - Previews

/*
#Preview {
	SettingsView.PortainerSection()
}
*/
