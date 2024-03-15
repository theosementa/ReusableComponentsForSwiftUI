//
//  Bundle.swift
//  ReusableComponentsForSwiftUI
//
//  Created by KaayZenn on 15/03/2024.
//

import Foundation

extension Bundle {
    
    /// Returns the release version number of the application.
    ///
    /// This property retrieves the release version number (CFBundleShortVersionString) from the app's Info.plist file.
    ///
    /// - Returns: The release version number of the application, or nil if it is not available.
    ///
    /// - Example:
    ///   ```swift
    ///   if let versionNumber = Bundle.main.releaseVersionNumber {
    ///       print("Release version number: \(versionNumber)")
    ///   } else {
    ///       print("Release version number is not available.")
    ///   }
    ///   ```
    ///
    var releaseVersionNumber: String? {
        return infoDictionary?["CFBundleShortVersionString"] as? String
    }
    
    /// Returns the build version number of the application.
    ///
    /// This property retrieves the build version number (CFBundleVersion) from the app's Info.plist file.
    ///
    /// - Returns: The build version number of the application, or nil if it is not available.
    ///
    /// - Example:
    ///   ```swift
    ///   if let buildNumber = Bundle.main.buildVersionNumber {
    ///       print("Build version number: \(buildNumber)")
    ///   } else {
    ///       print("Build version number is not available.")
    ///   }
    ///   ```
    ///
    var buildVersionNumber: String? {
        return infoDictionary?["CFBundleVersion"] as? String
    }
    
}
