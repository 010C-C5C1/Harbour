// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

import Foundation

// swiftlint:disable superfluous_disable_command file_length implicit_return

// MARK: - Strings

// swiftlint:disable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:disable nesting type_body_length type_name vertical_whitespace_opening_braces
internal enum Localizable {
  /// Harbour
  internal static let appName = Localizable.tr("Localizable", "AppName")

  internal enum ContainerCell {
    ///  • 
    internal static let stateJoiner = Localizable.tr("Localizable", "ContainerCell.StateJoiner")
    /// Unnamed
    internal static let unnamed = Localizable.tr("Localizable", "ContainerCell.Unnamed")
  }

  internal enum ContainerContextMenu {
    /// Attach
    internal static let attach = Localizable.tr("Localizable", "ContainerContextMenu.Attach")
    /// Unknown
    internal static let unknownState = Localizable.tr("Localizable", "ContainerContextMenu.UnknownState")
  }

  internal enum ContainerDetails {
    internal enum UserActivity {
      /// See the details of %@
      internal static func title(_ p1: Any) -> String {
        return Localizable.tr("Localizable", "ContainerDetails.UserActivity.Title", String(describing: p1))
      }
      /// a container
      internal static let unnamedContainerPlaceholder = Localizable.tr("Localizable", "ContainerDetails.UserActivity.UnnamedContainerPlaceholder")
    }
  }

  internal enum ContainersView {
    /// Loading...
    internal static let loadingPlaceholder = Localizable.tr("Localizable", "ContainersView.LoadingPlaceholder")
    /// No containers
    internal static let noContainersPlaceholder = Localizable.tr("Localizable", "ContainersView.NoContainersPlaceholder")
    /// No endpoints
    internal static let noEndpointsPlaceholder = Localizable.tr("Localizable", "ContainersView.NoEndpointsPlaceholder")
    /// No endpoint selected
    internal static let noSelectedEndpointPlaceholder = Localizable.tr("Localizable", "ContainersView.NoSelectedEndpointPlaceholder")
  }

  internal enum Debug {
    /// Debug
    internal static let title = Localizable.tr("Localizable", "Debug.Title")
    internal enum LastBackgroundRefresh {
      /// Never
      internal static let never = Localizable.tr("Localizable", "Debug.LastBackgroundRefresh.Never")
      /// Last Background Refresh
      internal static let title = Localizable.tr("Localizable", "Debug.LastBackgroundRefresh.Title")
    }
  }

  internal enum Generic {
    /// Container
    internal static let container = Localizable.tr("Localizable", "Generic.Container")
    /// Error!
    internal static let error = Localizable.tr("Localizable", "Generic.Error")
    /// Loading...
    internal static let loading = Localizable.tr("Localizable", "Generic.Loading")
    /// Unknown
    internal static let unknown = Localizable.tr("Localizable", "Generic.Unknown")
  }

  internal enum Indicators {
    /// Expand to read more
    internal static let expandToReadMore = Localizable.tr("Localizable", "Indicators.ExpandToReadMore")
  }

  internal enum Landing {
    /// Beam me up, Scotty!
    internal static let continueButton = Localizable.tr("Localizable", "Landing.ContinueButton")
    /// Hi! Welcome to
    internal static let titlePrefix = Localizable.tr("Localizable", "Landing.TitlePrefix")
    internal enum Feature1 {
      /// Feature1_Description
      internal static let description = Localizable.tr("Localizable", "Landing.Feature1.Description")
      /// Feature1_Title
      internal static let title = Localizable.tr("Localizable", "Landing.Feature1.Title")
    }
    internal enum Feature2 {
      /// Feature2_Description
      internal static let description = Localizable.tr("Localizable", "Landing.Feature2.Description")
      /// Feature2_Title
      internal static let title = Localizable.tr("Localizable", "Landing.Feature2.Title")
    }
    internal enum Feature3 {
      /// Feature3_Description
      internal static let description = Localizable.tr("Localizable", "Landing.Feature3.Description")
      /// Feature3_Title
      internal static let title = Localizable.tr("Localizable", "Landing.Feature3.Title")
    }
  }

  internal enum Notifications {
    internal enum ContainersChanged {
      /// unknown
      internal static let unknownPlaceholder = Localizable.tr("Localizable", "Notifications.ContainersChanged.UnknownPlaceholder")
      internal enum Subtitle {
        /// "%@" changed it's state to %@.
        internal static func containerChangedState(_ p1: Any, _ p2: Any) -> String {
          return Localizable.tr("Localizable", "Notifications.ContainersChanged.Subtitle.ContainerChangedState", String(describing: p1), String(describing: p2))
        }
        /// Container "%@" disappeared.
        internal static func containerDisappeared(_ p1: Any) -> String {
          return Localizable.tr("Localizable", "Notifications.ContainersChanged.Subtitle.ContainerDisappeared", String(describing: p1))
        }
        internal enum ContainersChangedStates {
          /// %@ changed their states.
          internal static func readable(_ p1: Any) -> String {
            return Localizable.tr("Localizable", "Notifications.ContainersChanged.Subtitle.ContainersChangedStates.Readable", String(describing: p1))
          }
          /// Multiple containers changed their states.
          internal static let unreadable = Localizable.tr("Localizable", "Notifications.ContainersChanged.Subtitle.ContainersChangedStates.Unreadable")
        }
      }
      internal enum Title {
        /// Container changed!
        internal static let containerChanged = Localizable.tr("Localizable", "Notifications.ContainersChanged.Title.ContainerChanged")
        /// Containers changed!
        internal static let containersChanged = Localizable.tr("Localizable", "Notifications.ContainersChanged.Title.ContainersChanged")
      }
    }
  }

  internal enum PortainerKit {
    internal enum ExecuteAction {
      /// Kill
      internal static let kill = Localizable.tr("Localizable", "PortainerKit.ExecuteAction.Kill")
      /// Pause
      internal static let pause = Localizable.tr("Localizable", "PortainerKit.ExecuteAction.Pause")
      /// Restart
      internal static let restart = Localizable.tr("Localizable", "PortainerKit.ExecuteAction.Restart")
      /// Start
      internal static let start = Localizable.tr("Localizable", "PortainerKit.ExecuteAction.Start")
      /// Stop
      internal static let stop = Localizable.tr("Localizable", "PortainerKit.ExecuteAction.Stop")
      /// Resume
      internal static let unpause = Localizable.tr("Localizable", "PortainerKit.ExecuteAction.Unpause")
    }
  }

  internal enum Settings {
    /// Settings
    internal static let title = Localizable.tr("Localizable", "Settings.Title")
    internal enum General {
      /// General
      internal static let title = Localizable.tr("Localizable", "Settings.General.Title")
    }
    internal enum Interface {
      /// Interface
      internal static let title = Localizable.tr("Localizable", "Settings.Interface.Title")
      internal enum EnableHaptics {
        /// You can tone them down if you don't like them as much as I do :]
        internal static let description = Localizable.tr("Localizable", "Settings.Interface.EnableHaptics.Description")
        /// Enable Haptics
        internal static let title = Localizable.tr("Localizable", "Settings.Interface.EnableHaptics.Title")
      }
      internal enum UseGridView {
        /// You can fit more containers, but it's harder to read.
        internal static let description = Localizable.tr("Localizable", "Settings.Interface.UseGridView.Description")
        /// Use Grid view
        internal static let title = Localizable.tr("Localizable", "Settings.Interface.UseGridView.Title")
      }
    }
    internal enum Other {
      /// Debug
      internal static let debug = Localizable.tr("Localizable", "Settings.Other.Debug")
      /// Made with ❤️ (and ☕) by @rrroyal
      internal static let footer = Localizable.tr("Localizable", "Settings.Other.Footer")
      /// Other
      internal static let title = Localizable.tr("Localizable", "Settings.Other.Title")
    }
    internal enum Portainer {
      /// Portainer
      internal static let title = Localizable.tr("Localizable", "Settings.Portainer.Title")
      internal enum EndpointsMenu {
        /// Add
        internal static let add = Localizable.tr("Localizable", "Settings.Portainer.EndpointsMenu.Add")
        /// None
        internal static let noServerPlaceholder = Localizable.tr("Localizable", "Settings.Portainer.EndpointsMenu.NoServerPlaceholder")
        internal enum Server {
          /// Delete
          internal static let delete = Localizable.tr("Localizable", "Settings.Portainer.EndpointsMenu.Server.Delete")
          /// In use
          internal static let inUse = Localizable.tr("Localizable", "Settings.Portainer.EndpointsMenu.Server.InUse")
          /// Use
          internal static let use = Localizable.tr("Localizable", "Settings.Portainer.EndpointsMenu.Server.Use")
        }
      }
    }
  }

  internal enum Setup {
    /// Setup
    internal static let headline = Localizable.tr("Localizable", "Setup.Headline")
    /// How to log in?
    internal static let howToLogin = Localizable.tr("Localizable", "Setup.HowToLogin")
    internal enum Button {
      /// Log in
      internal static let login = Localizable.tr("Localizable", "Setup.Button.Login")
      /// Success!
      internal static let success = Localizable.tr("Localizable", "Setup.Button.Success")
    }
  }

  internal enum Widgets {
    /// Please select a container 🙈
    internal static let selectContainerPlaceholder = Localizable.tr("Localizable", "Widgets.SelectContainerPlaceholder")
    /// Unreachable
    internal static let unreachablePlaceholder = Localizable.tr("Localizable", "Widgets.UnreachablePlaceholder")
    internal enum ContainerState {
      /// See the status of selected container right on your Home Screen :)
      internal static let description = Localizable.tr("Localizable", "Widgets.ContainerState.Description")
      /// Container State
      internal static let displayName = Localizable.tr("Localizable", "Widgets.ContainerState.DisplayName")
    }
    internal enum Placeholder {
      /// Containy
      internal static let containerName = Localizable.tr("Localizable", "Widgets.Placeholder.ContainerName")
      /// Up 10 days
      internal static let containerStatus = Localizable.tr("Localizable", "Widgets.Placeholder.ContainerStatus")
    }
  }
}
// swiftlint:enable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:enable nesting type_body_length type_name vertical_whitespace_opening_braces

// MARK: - Implementation Details

extension Localizable {
  private static func tr(_ table: String, _ key: String, _ args: CVarArg...) -> String {
    let format = BundleToken.bundle.localizedString(forKey: key, value: nil, table: table)
    return String(format: format, locale: Locale.current, arguments: args)
  }
}

// swiftlint:disable convenience_type
private final class BundleToken {
  static let bundle: Bundle = {
    #if SWIFT_PACKAGE
    return Bundle.module
    #else
    return Bundle(for: BundleToken.self)
    #endif
  }()
}
// swiftlint:enable convenience_type
