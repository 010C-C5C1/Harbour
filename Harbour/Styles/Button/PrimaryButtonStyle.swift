//
//  PrimaryButtonStyle.swift
//  Harbour
//
//  Created by royal on 29/07/2022.
//

import SwiftUI

struct PrimaryButtonStyle: ButtonStyle {
	@Environment(\.isEnabled) private var isEnabled: Bool
	let foregroundColor: Color
	let backgroundColor: Color
	let font: Font

	public init(foregroundColor: Color = .white, backgroundColor: Color = .accentColor, font: Font = .body.weight(.semibold)) {
		self.foregroundColor = foregroundColor
		self.backgroundColor = backgroundColor
		self.font = font
	}

	func makeBody(configuration: Configuration) -> some View {
		configuration.label
			.font(font)
			.multilineTextAlignment(.center)
			.foregroundStyle(isEnabled ? foregroundColor : .secondary)
			.padding()
			.frame(maxWidth: .infinity, alignment: .center)
			.background(isEnabled ? backgroundColor : Color(uiColor: .systemGray5))
			.cornerRadius(Constants.cornerRadius)
			.opacity(configuration.isPressed ? Constants.Buttons.pressedOpacity : 1)
			.scaleEffect(configuration.isPressed ? Constants.Buttons.pressedScale : 1)
			.animation(Constants.Buttons.pressAnimation, value: configuration.isPressed)
			.animation(.easeInOut, value: isEnabled)
	}
}

extension ButtonStyle where Self == PrimaryButtonStyle {
	static var customPrimary: PrimaryButtonStyle { .init() }
	static func customPrimary(foregroundColor: Color = .white,
							  backgroundColor: Color = .accentColor,
							  font: Font = .body.weight(.semibold)) -> PrimaryButtonStyle {
		.init(foregroundColor: foregroundColor, backgroundColor: backgroundColor, font: font)
	}
}
