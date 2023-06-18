//
//  ContainerStatusWidgetView+ContainerView.swift
//  HarbourWidgets
//
//  Created by royal on 11/06/2023.
//

import SwiftUI
import WidgetKit
import PortainerKit

// MARK: - ContainerStatusWidgetView+ContainerView

extension ContainerStatusWidgetView {
	struct ContainerView: View {
		var intentContainer: IntentContainer
		var intentEndpoint: IntentEndpoint?
		var container: Container?
		var date: Date
		var error: Error?

		private let circleSize: Double = 8
		private let minimumScaleFactor: Double = 0.8

		private var namePlaceholder: String {
			String(localized: "Unknown")
		}

		private var statusPlaceholder: String {
			if let error {
				return error.localizedDescription
			}

			return String(localized: "Unknown")
		}

		@ViewBuilder
		private var stateHeadline: some View {
			HStack {
				Text(verbatim: (container?.state.description ?? ContainerState?.none.description).localizedCapitalized)
					.font(.subheadline)
					.fontWeight(.medium)
					.foregroundColor(container?.state.color ?? ContainerState?.none.color)
					.minimumScaleFactor(minimumScaleFactor)

				Spacer()

				Circle()
					.fill(container?.state.color ?? ContainerState?.none.color)
					.frame(width: circleSize, height: circleSize)
			}
		}

		@ViewBuilder
		private var dateLabel: some View {
			Text(date, style: .relative)
				.font(.caption)
				.fontWeight(.medium)
				.foregroundStyle(.tertiary)
				.frame(maxWidth: .infinity, alignment: .leading)
		}

		@ViewBuilder
		private var nameLabel: some View {
			let displayName = container?.displayName ?? intentContainer.name
			Text(verbatim: displayName ?? namePlaceholder)
				.font(.headline)
				.foregroundStyle(displayName != nil ? .primary : .secondary)
				.lineLimit(2)
		}

		@ViewBuilder
		private var statusLabel: some View {
			Text(verbatim: container?.status ?? statusPlaceholder)
				.font(.subheadline)
				.fontWeight(.medium)
				.foregroundStyle(container?.status != nil ? .secondary : .tertiary)
				.lineLimit(2)
		}

		var body: some View {
//			Button(intent: OpenContainerDetailsIntent(endpoint: intentEndpoint, container: intentContainer)) {
				VStack(spacing: 0) {
					stateHeadline
						.padding(.bottom, 2)

					dateLabel

					Spacer()

					Group {
						nameLabel
						statusLabel
					}
					.multilineTextAlignment(.leading)
					.minimumScaleFactor(minimumScaleFactor)
					.frame(maxWidth: .infinity, alignment: .leading)
				}
				.padding()
				.background(Color.widgetBackground)
//			}
		}
	}
}

// MARK: - Previews

/*
#Preview {
	ContainerStatusWidgetView.ContainerView(
		intentContainer: ContainerStatusProvider.Entry.placeholder.configuration.containers.first!,
		container: ContainerStatusProvider.Entry.placeholder.containers?.first
	)
}
*/