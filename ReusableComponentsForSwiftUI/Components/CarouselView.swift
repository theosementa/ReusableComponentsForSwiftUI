//
//  CarouselView.swift
//  HappyEat_iOS
//
//  Created by KaayZenn on 13/03/2024.
//

import SwiftUI

struct CarouselView: View {
        
    // Builder
    var items: [AnyView]
    var width: CGFloat
    var height: CGFloat
    var scaleFactor: Double = 0.88
    var radius: CGFloat = 25
    var backgroundColor: Color = .blue
    
    // Number variables
    @State private var currentIndex: Int = 0
    @State private var dragOffet: CGFloat = 0
    
    // Bool variables
    @State private var isIndexChanged: Bool = false
    
    var body: some View {
        VStack {
            ZStack {
                ForEach(items.indices, id: \.self) { index in
                    items[index]
                        .frame(width: width, height: height)
                        .background(backgroundColor)
                        .clipShape(RoundedRectangle(cornerRadius: radius, style: .continuous))
                        .opacity(currentIndex == index ? 1 : 0.5)
                        .scaleEffect(currentIndex == index ? 1 : scaleFactor)
                        .offset(x: CGFloat(index - currentIndex) * width + dragOffet, y: 0)
                        .onTapGesture {
                            if currentIndex < index {
                                withAnimation {
                                    currentIndex = min(items.count - 1, currentIndex + 1)
                                }
                            } else {
                                withAnimation {
                                    currentIndex = max(0, currentIndex - 1)
                                }
                            }
                        }
                }
            }
            .gesture(
                DragGesture()
                    .onChanged(onChanged(_:))
                    .onEnded(onEnd(_:))
            )
        }
    } // End body
    
    // MARK: Functions
    func onChanged(_ value: DragGesture.Value) {
        if !isIndexChanged {
            withAnimation {
                dragOffet = value.translation.width
            }
        }
        
        if dragOffet < -(UIScreen.main.bounds.width / 2) {
            withAnimation {
                currentIndex = min(items.count - 1, currentIndex + 1)
                isIndexChanged = true
                dragOffet = 0
            }
        }
         
        if dragOffet > UIScreen.main.bounds.width / 2 {
            withAnimation {
                currentIndex = max(0, currentIndex - 1)
                isIndexChanged = true
                dragOffet = 0
            }
        }
    }
    
    func onEnd(_ value: DragGesture.Value) {
        let threshold: CGFloat = 50
        
        withAnimation { dragOffet = 0 }
        
        if !isIndexChanged {
            if value.translation.width > threshold {
                withAnimation {
                    currentIndex = max(0, currentIndex - 1)
                }
            } else if value.translation.width < -threshold {
                withAnimation {
                    currentIndex = min(items.count - 1, currentIndex + 1)
                }
            }
        } else {
            withAnimation {
                isIndexChanged = false
            }
        }
    }
    
} // End struct

// MARK: - Preview
#Preview {
    CarouselView(items: [
        AnyView(Text("Hey iOS Dev !")),
        AnyView(Image(systemName: "star.fill")),
        AnyView(Color.red),
        AnyView(
            VStack(spacing: 8) {
                Text("Do you like it?")
                Image(systemName: "heart.fill")
            }
        )
    ], width: UIScreen.main.bounds.width - 96, height: 200)
}
