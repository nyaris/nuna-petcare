//
//  ContentView.swift
//  Nuna
//
//  Created by nana on 24/03/26.
//

import SwiftUI

struct LoginView: View {

    @State private var currentIndex = 0

    private let headerItems = [
        LoginHeaderItem(imageName: "boy-and-cat"),
        LoginHeaderItem(imageName: "girl-and-rabbit"),
        LoginHeaderItem(imageName: "guy-and-dog")
    ]

    var body: some View {
        ZStack {
            DSColor.Background.alternative.ignoresSafeArea()

            VStack(spacing: DSSpacing.lg) {
                OnboardingHeaderView(
                    items: headerItems,
                    currentIndex: $currentIndex
                )
                LoginTitleSectionView()
            }
            .padding()
        }
        .task {
            while true {
                try? await Task.sleep(for: .seconds(3))

                await MainActor.run {
                    withAnimation {
                        currentIndex = (currentIndex + 1) % headerItems.count
                    }
                }
            }
        }
    }
}

#Preview {
    LoginView()
}
