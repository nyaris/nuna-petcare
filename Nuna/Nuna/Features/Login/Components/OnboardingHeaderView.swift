//
//  OnboardingHeaderView.swift
//  Nuna
//
//  Created by nana on 25/03/26.
//

import SwiftUI

struct OnboardingHeaderView: View {
    let items: [OnboardingHeaderItem]
    @Binding var currentIndex: Int
    
    var body: some View {
        VStack(spacing: LoginConstants.Metrics.headerVerticalSpacing) {
            
            ZStack {
                Circle()
                    .fill(DSColor.Brand.primary.opacity(0.2))
                    .frame(width: LoginConstants.Metrics.headerBackgroundCircleSize, height: LoginConstants.Metrics.headerBackgroundCircleSize)
                
                ZStack {
                    ForEach(Array(items.enumerated()), id: \.offset) { index, item in
                        Image(item.imageName)
                            .resizable()
                            .scaledToFill()
                            .frame(width: LoginConstants.Metrics.headerAvatarSize, height: LoginConstants.Metrics.headerAvatarSize)
                            .clipped()
                            .clipShape(Circle())
                            .scaleEffect(index == currentIndex ? 1 : 0.95)
                            .opacity(index == currentIndex ? 1 : 0)
                            .animation(.easeInOut(duration: LoginConstants.Metrics.headerAnimationDuration), value: currentIndex)
                    }
                }
                .frame(width: LoginConstants.Metrics.headerAvatarSize, height: LoginConstants.Metrics.headerAvatarSize)
                .clipShape(Circle())
            }
            
            HStack(spacing: LoginConstants.Metrics.headerIndicatorSpacing) {
                ForEach(Array(items.enumerated()), id: \.offset) { index, _ in
                    if index == currentIndex {
                        Capsule()
                            .fill(DSColor.Brand.primary)
                            .frame(width: LoginConstants.Metrics.headerActiveIndicatorWidth, height: LoginConstants.Metrics.headerIndicatorHeight)
                    } else {
                        Circle()
                            .fill(DSColor.Brand.secondaryNude)
                            .frame(width: LoginConstants.Metrics.headerIndicatorHeight, height: LoginConstants.Metrics.headerIndicatorHeight)
                    }
                }
            }
        }
    }
}
