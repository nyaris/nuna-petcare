//
//  CarouselCardView.swift
//  Nuna
//
//  Created by nana on 01/04/26.
//

import SwiftUI

struct HomeOnboardingItem {
    let title: String
    let description: String
    let imageName: String
}

struct CarouselCardView: View {

    let items: [HomeOnboardingItem]
    @State private var currentIndex = 0

    var body: some View {
        VStack(spacing: 16) {

            TabView(selection: $currentIndex) {
                ForEach(Array(items.enumerated()), id: \.offset) { index, item in
                    HStack {

                        VStack(alignment: .leading, spacing: 8) {
                            Text(item.title)
                                .font(DSTypography.title)
                                .lineLimit(nil)
                                .fixedSize(horizontal: false, vertical: true)

                            Text(item.description)
                                .font(DSTypography.body)
                                .foregroundStyle(DSColor.Text.secondary)
                                .lineLimit(nil)
                                .fixedSize(horizontal: false, vertical: true)
                        }

                        Spacer()

                        Image(item.imageName)
                            .resizable()
                            .scaledToFill()
                            .frame(width: 128, height: 128)
                            .clipShape(RoundedRectangle(cornerRadius: 16))
                            .opacity(0.7)
                    }
                    .padding()
                    .tag(index)
                }
            }
            .frame(height: 140)
            .tabViewStyle(.page(indexDisplayMode: .never))

            HStack(spacing: 6) {
                ForEach(items.indices, id: \.self) { index in
                    Capsule()
                        .fill(index == currentIndex
                              ? DSColor.Brand.primary
                              : DSColor.Brand.secondaryNude)
                        .frame(width: index == currentIndex ? 20 : 6, height: 6)
                        .animation(.easeInOut, value: currentIndex)
                }
            }
        }.task {
            guard !items.isEmpty else { return }

            while true {
                try? await Task.sleep(for: .seconds(4))

                await MainActor.run {
                    withAnimation {
                        currentIndex = (currentIndex + 1) % items.count
                    }
                }
            }
        }
        .padding()
        .background(DSColor.Brand.primarySoft)
        .clipShape(RoundedRectangle(cornerRadius: 24))
    }
}
