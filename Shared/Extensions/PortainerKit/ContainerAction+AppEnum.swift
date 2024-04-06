//
//  ContainerAction+AppEnum.swift
//  Harbour
//
//  Created by royal on 09/07/2023.
//  Copyright © 2023 shameful. All rights reserved.
//

import AppIntents
import PortainerKit

extension ContainerAction: AppEnum {
	public static var typeDisplayRepresentation = TypeDisplayRepresentation(name: "PortainerKit.ContainerAction.AppEnumTitle")

	public static var caseDisplayRepresentations: [Self: DisplayRepresentation] = [
		.start: .init(title: .init(stringLiteral: Self.start.title), image: .init(systemName: Self.start.icon)),
		.stop: .init(title: .init(stringLiteral: Self.stop.title), image: .init(systemName: Self.stop.icon)),
		.restart: .init(title: .init(stringLiteral: Self.restart.title), image: .init(systemName: Self.restart.icon)),
		.kill: .init(title: .init(stringLiteral: Self.kill.title), image: .init(systemName: Self.kill.icon)),
		.pause: .init(title: .init(stringLiteral: Self.pause.title), image: .init(systemName: Self.pause.icon)),
		.unpause: .init(title: .init(stringLiteral: Self.unpause.title), image: .init(systemName: Self.unpause.icon))
	]

	public static var allCases: [Self] = [
		.start,
		.stop,
		.restart,
		.kill,
		.pause,
		.unpause
	]
}
