//
//  Date.swift
//  ReusableComponentsForSwiftUI
//
//  Created by KaayZenn on 15/03/2024.
//

import Foundation

// MARK: - MONTH
extension Date {
    
    /// Returns the first day of the month for the specified date.
    ///
    /// This property retrieves the first day of the month for the specified date by extracting the month
    /// and year components from the date, and then attempting to create a new date object with these components.
    ///
    /// - Returns: The first day of the month for the specified date, or `nil` if the operation fails.
    ///
    /// - Example:
    ///   ```swift
    ///   let currentDate = Date()
    ///   if let startOfMonth = currentDate.startOfMonth {
    ///       print(startOfMonth) // Prints the first day of the month for the current date
    ///   }
    ///   ```
    ///
    var startOfMonth: Date? {
        let components = Calendar.current.dateComponents([.year, .month], from: self)
        return Calendar.current.date(from: components)
    }
    
    /// Returns the last day of the month for the specified date.
    ///
    /// This property retrieves the last day of the month for the specified date by adding one month to
    /// the first day of the month, obtained using the `startOfMonth` property.
    ///
    /// - Returns: The last day of the month for the specified date, or `nil` if the operation fails.
    ///
    /// - Example:
    ///   ```swift
    ///   let currentDate = Date()
    ///   if let endOfMonth = currentDate.endOfMonth {
    ///       print(endOfMonth) // Prints the last day of the month for the current date
    ///   }
    ///   ```
    ///
    var endOfMonth: Date? {
        if let startOfMonth = self.startOfMonth {
            return Calendar.current.date(byAdding: DateComponents(month: 1, day: -1), to: startOfMonth)
        } else {
            return nil
        }
    }
    
    /// Returns the current day of the month.
    ///
    /// This function retrieves the current day of the month by extracting the day component from the current date.
    ///
    /// - Returns: The current day of the month, or `nil` if the operation fails.
    ///
    /// - Example:
    ///   ```swift
    ///   if let currentDayOfMonth = Date().currentDayOfMonth() {
    ///       print(currentDayOfMonth) // Prints the current day of the month
    ///   } else {
    ///       print("Failed to retrieve the current day of the month")
    ///   }
    ///   ```
    ///
    func currentDayOfMonth() -> Int? {
        let components = Calendar.current.dateComponents([.day], from: self)
        return components.day
    }
    
}

// MARK: - YEAR
extension Date {
    
    /// Returns the current year.
    ///
    /// This function retrieves the current year by extracting the year component from the current date.
    ///
    /// - Returns: The current year, or `nil` if the operation fails.
    ///
    /// - Example:
    ///   ```swift
    ///   let currentDate = Date()
    ///   if let currentYear = currentDate.currentYear() {
    ///       print(currentYear) // Prints the current year
    ///   }
    ///   ```
    ///
    func currentYear() -> Int? {
        let components = Calendar.current.dateComponents([.year], from: self)
        return components.year
    }
    
}
