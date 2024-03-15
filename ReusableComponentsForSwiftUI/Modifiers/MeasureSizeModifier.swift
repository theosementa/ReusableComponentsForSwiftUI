//
//  MeasureSizeModifier.swift
//  CardShuffeler
//
//  Created by Theo Sementa on 05/02/2024.
//

import SwiftUI

// MARK: - Modifier
struct MeasureSizeModifier: ViewModifier {
    let callback: (CGSize) -> Void
    
    func body(content: Content) -> some View {
        content
            .background {
                GeometryReader { proxy in
                    Color.clear
                        .onAppear {
                            callback(proxy.size)
                        }
                }
            }
    }
}

extension View {
    func measureSize(_ callback: @escaping (CGSize) -> Void) -> some View {
        modifier(MeasureSizeModifier(callback: callback))
    }
}

// MARK: - Example
struct MeasureSizeExampleView: View {
    
    // Number variables
    @State private var height: CGFloat = 0
    
    var body: some View {
        Rectangle()
            .overlay {
                Text(height.formatted())
                    .foregroundStyle(Color.red)
            }
            .measureSize { size in
                height = size.height
            }
    } // End body
} // End struct

// MARK: - Preview
#Preview {
    MeasureSizeExampleView()
}
