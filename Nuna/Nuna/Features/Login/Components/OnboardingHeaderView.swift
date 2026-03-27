//
//  OnboardingHeaderView.swift
//  Nuna
//
//  Created by nana on 25/03/26.
//

import SwiftUI

struct OnboardingHeaderView: View {
    let items: [LoginHeaderItem]
    @Binding var currentIndex: Int
    
    var body: some View {
        VStack(spacing: 16) {
            
            ZStack {
                Circle()
                    .fill(DSColor.Brand.primary.opacity(0.2))
                    .frame(width: 220, height: 220)
                
                ZStack {
                    ForEach(Array(items.enumerated()), id: \.offset) { index, item in
                        Image(item.imageName)
                            .resizable()
                            .scaledToFill()
                            .frame(width: 160, height: 160)
                            .clipped()
                            .clipShape(Circle())
                            .scaleEffect(index == currentIndex ? 1 : 0.95)
                            .opacity(index == currentIndex ? 1 : 0)
                            .animation(.easeInOut(duration: 0.5), value: currentIndex)
                    }
                }
                .frame(width: 160, height: 160)
                .clipShape(Circle())
            }
            
            HStack(spacing: 8) {
                ForEach(Array(items.enumerated()), id: \.offset) { index, _ in
                    if index == currentIndex {
                        Capsule()
                            .fill(DSColor.Brand.primary)
                            .frame(width: 24, height: 6)
                    } else {
                        Circle()
                            .fill(DSColor.Brand.secondaryNude)
                            .frame(width: 6, height: 6)
                    }
                }
            }
        }
    }
}
