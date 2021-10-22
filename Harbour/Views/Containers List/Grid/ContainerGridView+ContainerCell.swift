//
//  ContainerGridView+ContainerCell.swift
//  Harbour
//
//  Created by royal on 04/10/2021.
//

import SwiftUI
import PortainerKit

extension ContainerGridView {
	struct ContainerCell: View {
		@ObservedObject var container: PortainerKit.Container
		
		let circleSize: Double = 10
		let backgroundShape = RoundedRectangle(cornerRadius: Globals.Views.largeCornerRadius, style: .continuous)
		
		var body: some View {
			VStack(alignment: .leading) {
				HStack(alignment: .top) {
					if let state = container.state {
						Text(state.rawValue.capitalizingFirstLetter())
							.font(.footnote.weight(.medium))
							.foregroundStyle(.secondary)
							.lineLimit(1)
							.frame(maxWidth: .infinity, alignment: .leading)
					}
					
					Spacer()
					
					Circle()
						.fill(container.state.color)
						.frame(width: circleSize, height: circleSize)
						.animation(.easeInOut, value: container.state.color)
				}
				
				Spacer()
				
				if let status = container.status {
					Text(status)
						.font(.caption.weight(.medium))
						.foregroundStyle(.secondary)
						.lineLimit(1)
						.minimumScaleFactor(0.8)
						.multilineTextAlignment(.leading)
						.frame(maxWidth: .infinity, alignment: .leading)
				}
				
				Text(container.displayName ?? "Unnamed")
					.font(.headline)
					.foregroundColor(container.displayName != nil ? .primary : .secondary)
					.lineLimit(2)
					// .minimumScaleFactor(0.6)
					.multilineTextAlignment(.leading)
					.frame(maxWidth: .infinity, alignment: .leading)
			}
			.padding(.medium)
			.aspectRatio(1, contentMode: .fill)
			// .background(Color(uiColor: .secondarySystemBackground), in: backgroundRectangle)
			// .background(container.state?.color.opacity(0.15) ?? Color(uiColor: .secondarySystemBackground), in: backgroundRectangle)
			// .contentShape(backgroundRectangle)
			.background(ContainerCellBackground(state: container.state))
			.containerShape(backgroundShape)
			.animation(.easeInOut, value: container.state)
			.animation(.easeInOut, value: container.status)
			.animation(.easeInOut, value: container.displayName)
			.transition(.opacity)
		}
	}
}