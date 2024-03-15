//
//  String.swift
//  ReusableComponentsForSwiftUI
//
//  Created by KaayZenn on 15/03/2024.
//

import Foundation
import UIKit

extension String {
    
    /// Returns the localized version of the string.
    ///
    /// This property retrieves the localized version of the string using the NSLocalizedString function.
    /// If no localization is available for the string, it returns the original string.
    ///
    /// - Note: This property assumes that the string is a localization key and retrieves its corresponding localized value.
    ///
    /// - Returns: The localized version of the string.
    ///
    /// - Example:
    ///   ```swift
    ///   let localizedString = "Hello".localized
    ///   print(localizedString) // Display the localized version of "Hello"
    ///   ```
    ///
    var localized: String {
        return NSLocalizedString(self, comment: "")
    }
    
    /// Returns the width of the string when rendered with the specified font.
    ///
    /// - Parameters:
    ///   - font: The font used for rendering the string.
    /// - Returns: The width of the string.
    ///
    /// - Example:
    ///   ```swift
    ///   let myString = "Hello, World!"
    ///   let font = UIFont.systemFont(ofSize: 16)
    ///   let width = myString.width(usingFont: font)
    ///   print("Width of the string: \(width)")
    ///   ```
    ///
    func width(usingFont font: UIFont) -> CGFloat {
         let fontAttributes = [NSAttributedString.Key.font: font]
         let size = self.size(withAttributes: fontAttributes)
         return size.width
     }
    

    /// This function checks if the string is not empty without spaces.
    ///
    /// - How to use
    /// ```swift
    /// let myFirstString: String = "Hello iOS Dev"
    /// let mySecondString: String = "    "
    /// print(myFirstString.isEmptyWithoutSpace()) // false
    /// print(mySecondString.isEmptyWithoutSpace()) // true
    /// ```
    ///
    func isEmptyWithoutSpace() -> Bool {
        if self.replacingOccurrences(of: " ", with: "", options: NSString.CompareOptions.literal, range: nil).isEmpty {
            return true
        } else { return false }
    }
    
}
