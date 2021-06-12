//
//  ContainerCell.swift
//  Harbour
//
//  Created by royal on 11/06/2021.
//

import SwiftUI
import PortainerKit

struct ContainerCell: View {
	let container: PortainerKit.Container
		
	let circleSize: Double = 10
	
    var body: some View {
		VStack(alignment: .leading) {
			HStack(alignment: .top) {
				if let state = container.state {
					Text(state.rawValue.capitalizingFirstLetter())
						.font(.footnote.weight(.medium))
						.foregroundStyle(.secondary)
						.lineLimit(1)
				}
				
				Spacer()
				
				Circle()
					.fill(container.stateColor)
					.frame(width: circleSize, height: circleSize)
			}
			
			Spacer()
			
			if let status = container.status {
				Text(status)
					.font(.caption.weight(.medium))
					.foregroundStyle(.secondary)
					.lineLimit(1)
					.minimumScaleFactor(0.8)
					.multilineTextAlignment(.leading)
			}
			
			Text(container.displayName ?? "Unnamed")
				.font(.headline)
				.foregroundColor(container.displayName != nil ? .primary : .secondary)
				.lineLimit(2)
				.minimumScaleFactor(0.6)
				.multilineTextAlignment(.leading)
		}
		.padding(12)
		.aspectRatio(1, contentMode: .fill)
		.background(
			RoundedRectangle(cornerRadius: Globals.Views.largeCornerRadius, style: .continuous)
				.foregroundColor(Color(uiColor: .systemGray6))
		)
		.animation(.easeInOut, value: container)
		.transition(.opacity)
    }
}

/* struct ContainerCell_Previews: PreviewProvider {
    static var previews: some View {
        ContainerCell()
    }
} */
