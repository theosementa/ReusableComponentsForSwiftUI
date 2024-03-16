//
//  GradientModifier.swift
//  ReusableComponentsForSwiftUI
//
//  Created by Theo Sementa on 05/02/2024.
//

import SwiftUI

// MARK: - Modifier
struct GradientModifier: ViewModifier {
    
    var colors: [Color]
    var start: UnitPoint
    var end: UnitPoint
    
    func body(content: Content) -> some View {
        content
            .foregroundStyle(
                LinearGradient(
                    colors: colors,
                    startPoint: start,
                    endPoint: end
                )
            )
    }
}

extension View {
    func gradient(colors: [Color], start: UnitPoint, end: UnitPoint ) -> some View {
        modifier(
            GradientModifier(
                colors: colors,
                start: start,
                end: end
            )
        )
    }
}

// MARK: - Example
struct GradientModifierExampleView: View {
    
    var body: some View {
        VStack {
            Text("Hello iOS Dev !")
                .font(.largeTitle)
                .fontWeight(.bold)
                .gradient(
                    colors: [Color.blue, Color.red],
                    start: .leading,
                    end: .trailing
                )
            
            RoundedRectangle(cornerRadius: 16, style: .continuous)
                .frame(height: 120)
                .gradient(
                    colors: [Color.green, Color.blue, Color.purple],
                    start: .topLeading,
                    end: .bottomTrailing
                )
                .padding()
        }
    } // End body
} // End struct

// MARK: - Preview
#Preview {
    GradientModifierExampleView()
}
