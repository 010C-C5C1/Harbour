//
//  ContainerDetailsView+PlaceholderView.swift
//  Harbour
//
//  Created by royal on 30/01/2023.
//

import SwiftUI

// MARK: - ContainerDetailsView+PlaceholderView

extension ContainerDetailsView {
	struct PlaceholderView: View {
		let viewState: ViewModel.ViewState

		var body: some View {
			Group {
				switch viewState {
				case .loading:
					ProgressView()
						.progressViewStyle(.circular)
				case .hasDetails:
					EmptyView()
				default:
					if let title = viewState.title {
						Text(title)
					}
				}
			}
			.foregroundStyle(.secondary)
			.transition(.opacity)
			.animation(.easeInOut, value: viewState)
		}
	}
}

// MARK: - Previews

#Preview("loading") {
	ContainerDetailsView.PlaceholderView(viewState: .loading)
}

#Preview("hasDetails") {
	ContainerDetailsView.PlaceholderView(viewState: .hasDetails)
}

#Preview("error") {
	ContainerDetailsView.PlaceholderView(viewState: .error(NSError(domain: "", code: 0, userInfo: nil)))
}

#Preview("somethingWentWrong") {
	ContainerDetailsView.PlaceholderView(viewState: .somethingWentWrong)
}
