//
//  CornerPaddingModifier.swift
//  ReusableComponentsForSwiftUI
//
//  Created by KaayZenn on 16/03/2024.
//

import Foundation
import SwiftUI

struct CornerPaddingModifier: ViewModifier {
    enum Corner {
        case bottomRight, bottomLeft, topLeft, topRight, ignoringRight, ignoringLeft, ignoringTop, ignoringBottom
    }
    
    var corner: Corner
    var value: CGFloat
    
    func body(content: Content) -> some View {
        switch corner {
        case .bottomRight:
            return content.padding([.bottom, .trailing], value)
        case .bottomLeft:
            return content.padding([.bottom, .leading], value)
        case .topLeft:
            return content.padding([.top, .leading], value)
        case .topRight:
            return content.padding([.top, .trailing], value)
        case .ignoringRight:
            return content.padding([.vertical, .leading], value)
        case .ignoringLeft:
            return content.padding([.vertical, .trailing], value)
        case .ignoringTop:
            return content.padding([.horizontal, .bottom], value)
        case .ignoringBottom:
            return content.padding([.horizontal, .top], value)
        }
    }
}

extension View {
    func padding(corner: CornerPaddingModifier.Corner, _ value: CGFloat) -> some View {
        modifier(CornerPaddingModifier(corner: corner, value: value))
    }
}

// MARK: - Example
struct CornerPaddingModifierExampleView:View {
    var body: some View {
        VStack(spacing: 0) {
            RoundedRectangle(cornerRadius: 25.0, style: .continuous)
                .frame(height: 200)
                .padding(corner: .topRight, 16)
            
            RoundedRectangle(cornerRadius: 25.0, style: .continuous)
                .frame(height: 200)
                .padding(corner: .ignoringTop, 16)
            
            RoundedRectangle(cornerRadius: 25.0, style: .continuous)
                .frame(height: 200)
            
            Spacer()
        }
        .background(Color.red)
    } // End body
} // End struct

// MARK: - Preview
#Preview {
    CornerPaddingModifierExampleView()
}
