//
//  ContainerDetails+displayName.swift
//  Harbour
//
//  Created by royal on 27/12/2022.
//  Copyright © 2023 shameful. All rights reserved.
//

import Foundation
import PortainerKit

extension ContainerDetails {
	var displayName: Container.Name? {
		name.starts(with: "/") ? String(name.dropFirst()) : name
	}
}
