//
//  BannerModifier.swift
//  ReusableComponentsForSwiftUI
//
//  Created by Theo Sementa on 19/01/2024.
//

import Foundation
import SwiftUI

enum BannerStyle {
    case neutral
    case success
    case error
}

struct Banner: Equatable {
    var title: String
    var style: BannerStyle = .neutral
    var duration: Double = 3
}

// MARK: - ViewModifier
struct BannerModifier: ViewModifier {
    
    // Builder
    @Binding var banner: Banner?
    @State private var workItem: DispatchWorkItem?
    
    func body(content: Content) -> some View {
        content
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .overlay {
                ZStack {
                    mainBannerView()
                        .offset(y: 30)
                }
                .animation(.spring(), value: banner)
            }
            .onChange(of: banner) { _ in
                showBanner()
            }
    } // End body

    // MARK: ViewBuilder
    @ViewBuilder
    func mainBannerView() -> some View {
        if let banner = banner {
            VStack {
                BannerView(title: banner.title, style: banner.style) {
                    dismissBanner()
                }
                Spacer()
            }
            .transition(.move(edge: .top))
        }
    }

    // MARK: Functions
    private func showBanner() {
        guard let banner = banner else { return }

        if banner.duration > 0 {
            workItem?.cancel()
            
            let task = DispatchWorkItem {
                dismissBanner()
            }

            workItem = task
            DispatchQueue.main.asyncAfter(deadline: .now() + banner.duration, execute: task)
        }
    }
    
    private func dismissBanner() {
        withAnimation { banner = nil }

        workItem?.cancel()
        workItem = nil
    }
} // End struct Modifier

extension View {
    func bannerView(banner: Binding<Banner?>) -> some View {
        self.modifier(BannerModifier(banner: banner))
    }
}

// MARK: - BannerView
struct BannerView: View {

    // Builder
    var title: String
    var style: BannerStyle
    var onCancelTapped: (() -> Void)
    
    var body: some View {
        Text(title)
            .font(.system(size: 12, weight: .bold, design: .rounded))
            .foregroundStyle(style == .neutral ? Color(uiColor: .systemBackground) : Color.white)
            .padding(12)
            .background(convertStyleToColor())
            .clipShape(Capsule())
            .onTapGesture {
                onCancelTapped()
            }
    } // End body
    
    // MARK: Functions
    func convertStyleToColor() -> Color {
        switch style {
        case .neutral:
            return Color(uiColor: .systemBackground)
        case .success:
            return Color.green
        case .error:
            return Color.red
        }
    }
    
} // End struct

// MARK: - Example
struct BannerModifierExampleView: View {
    
    // Custom
    @State private var banner: Banner? = nil
    
    var body: some View {
        VStack {
            Button(action: {
                banner = Banner(
                    title: "Hey iOS Dev !",
                    style: .success
                )
            }, label: {
                Text("Target banner")
            })
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .bannerView(banner: $banner)
    } // End body
} // End struct

// MARK: - Preview
#Preview {
    BannerModifierExampleView()
}
