//
//  Localization.swift
//  Harbour
//
//  Created by royal on 02/10/2021.
//

import Foundation

enum Localization: String {
	case CONTAINER_DISMISSED_INDICATOR_TITLE = "%CONTAINER_DISMISSED_INDICATOR_TITLE%"
	case CONTAINER_DISMISSED_INDICATOR_DESCRIPTION = "%CONTAINER_DISMISSED_INDICATOR_DESCRIPTION%"
	
	case KEYCHAIN_TOKEN_COMMENT = "%KEYCHAIN_TOKEN_COMMENT%"
	case KEYCHAIN_CREDS_COMMENT = "%KEYCHAIN_CREDS_COMMENT%"
	
	case SETTINGS_FOOTER = "%SETTINGS_FOOTER%"
	
	case SETTINGS_PERSIST_ATTACHED_CONTAINER_TITLE = "%SETTINGS_PERSIST_ATTACHED_CONTAINER_TITLE%"
	case SETTINGS_PERSIST_ATTACHED_CONTAINER_DESCRIPTION = "%SETTINGS_PERSIST_ATTACHED_CONTAINER_DESCRIPTION%"
	case SETTINGS_CONTAINER_DISCONNECTED_PROMPT_TITLE = "%SETTINGS_CONTAINER_DISCONNECTED_PROMPT_TITLE%"
	case SETTINGS_CONTAINER_DISCONNECTED_PROMPT_DESCRIPTION = "%SETTINGS_CONTAINER_DISCONNECTED_PROMPT_DESCRIPTION%"
	case SETTINGS_ENABLE_HAPTICS_TITLE = "%SETTINGS_ENABLE_HAPTICS_TITLE%"
	case SETTINGS_ENABLE_HAPTICS_DESCRIPTION = "%SETTINGS_ENABLE_HAPTICS_DESCRIPTION%"
	case SETTINGS_USE_GRID_VIEW_TITLE = "%SETTINGS_USE_GRID_VIEW_TITLE%"
	case SETTINGS_USE_GRID_VIEW_DESCRIPTION = "%SETTINGS_USE_GRID_VIEW_DESCRIPTION%"
	case SETTINGS_AUTO_REFRESH_TITLE = "%SETTINGS_AUTO_REFRESH_TITLE%"
	
	case SETUP_FEATURE1_TITLE = "%SETUP_FEATURE1_TITLE%"
	case SETUP_FEATURE1_DESCRIPTION = "%SETUP_FEATURE1_DESCRIPTION%"
	case SETUP_FEATURE2_TITLE = "%SETUP_FEATURE2_TITLE%"
	case SETUP_FEATURE2_DESCRIPTION = "%SETUP_FEATURE2_DESCRIPTION%"
	case SETUP_FEATURE3_TITLE = "%SETUP_FEATURE3_TITLE%"
	case SETUP_FEATURE3_DESCRIPTION = "%SETUP_FEATURE3_DESCRIPTION%"
	
	case WEBSOCKET_DISCONNECTED_TITLE = "%WEBSOCKET_DISCONNECTED_TITLE%"
	
	var localizedString: String { NSLocalizedString(self.rawValue, comment: "") }
}
