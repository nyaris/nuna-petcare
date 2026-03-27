//
//  QuickActionCardView.swift
//  Nuna
//
//  Created by Miguel Barone on 27/03/26.
//

import SwiftUI

struct QuickActionCardView: View {
    let icon: ImageResource
    let title: String
    let description: String

    init(icon: ImageResource, title: String, description: String) {
        self.icon = icon
        self.title = title
        self.description = description
    }

    var body: some View {
        HStack {
            Circle()
                .fill(Color.white)
                .frame(width: 45, height: 45)
                .overlay(
                    Image(icon)
                        .foregroundStyle(DSColor.Icon.secondary)
                )
                .padding(.leading, 16)
            VStack(alignment: .leading) {
                Text(title)
                    .font(DSTypography.medium.bold())
                    .foregroundStyle(DSColor.Text.primary)
                Text(description)
                    .font(DSTypography.small)
                    .foregroundStyle(DSColor.Text.secondary)
            }
            .padding(.top, 24)
            .padding(.bottom, 24)
            .padding(.leading, 4)
            Spacer()
            Text("Setup →")
                .padding(.trailing, 16)
                .foregroundStyle(DSColor.Brand.primary)
                .font(DSTypography.medium.bold())
        }
        .background(DSColor.Brand.primaryLight)
        .clipShape(RoundedRectangle(cornerRadius: 16))
        .padding()
    }
}

#Preview {
    QuickActionCardView(
        icon: .bellIcon,
        title: "Set Reminders",
        description: "Feeding, walks, vet visits"
    )
}
