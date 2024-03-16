//
//  Swipe Back.swift
//  ReusableComponentsForSwiftUI
//
//  Created by Théo Sementa on 19/06/2023.
//

import Foundation
import UIKit

// Keep swipe back when you use .navigationBarBackButtonHidden(true). Just add this file to your project
extension UINavigationController: UIGestureRecognizerDelegate {
    override open func viewDidLoad() {
        super.viewDidLoad()
        interactivePopGestureRecognizer?.delegate = self
    }

    public func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        return viewControllers.count > 1
    }
}
