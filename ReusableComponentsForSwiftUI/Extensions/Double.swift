//
//  Double.swift
//  ReusableComponentsForSwiftUI
//
//  Created by KaayZenn on 15/03/2024.
//

import Foundation

extension Double {
    
    /// Rounds a double value to the specified number of decimal places.
    ///
    /// This function rounds a double value to the specified number of decimal places,
    /// effectively reducing its scale to the desired precision.
    ///
    /// - Parameter decimalPlaces: The number of decimal places to round to.
    /// - Returns: The double value rounded to the specified number of decimal places.
    ///
    /// - Example:
    ///   ```swift
    ///   let number = 1234.56789
    ///   let roundedNumber = number.round(toDecimalPlaces: 2)
    ///   print(roundedNumber) // Displays 1234.57
    ///   ```
    ///
    func round(toDecimalPlaces decimalPlaces: Int) -> Double {
        let multiplier = pow(10, Double(decimalPlaces))
        let scaledNumber = (self * multiplier).rounded(.towardZero)
        return scaledNumber / multiplier
    }
    
    /// Formats a number into a string representation with compact notation.
    ///
    /// This function formats a given number into a string representation with compact notation,
    /// indicating thousands (K), millions (M), or billions (B), and appends the appropriate suffix.
    /// If the number is less than 1000, it formats it with one decimal place.
    ///
    /// - Returns: The formatted string representation of the number.
    ///
    /// - Example:
    ///   ```swift
    ///   let number = 1234567.89
    ///   let formattedString = number.formattedStringWithCompactNotation()
    ///   print(formattedString) // Displays "1.2M"
    ///   ```
    ///
    func formattedStringWithCompactNotation() -> String {
        let absoluteNumber = abs(self)
        let suffixes = ["", "K", "M", "B"]
        
        for (index, suffix) in suffixes.enumerated().reversed() {
            let divisor = pow(10, Double(index * 3))
            if absoluteNumber >= divisor {
                let formattedNumber = absoluteNumber / divisor
                return String(format: "%0.1f%@", formattedNumber, suffix)
            }
        }
        
        return String(format: "%.1f", self)
    }

}
