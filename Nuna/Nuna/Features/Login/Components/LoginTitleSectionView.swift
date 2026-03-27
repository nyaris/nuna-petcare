//
//  LoginTitleSectionView.swift
//  Nuna
//
//  Created by nana on 25/03/26.
//

import SwiftUI

struct LoginTitleSectionView: View {

    var body: some View {
        VStack(spacing: 8) {
            Text("Caring Made Paw-sible")
                .font(DSTypography.title)
                .foregroundStyle(DSColor.Text.primary)
                .multilineTextAlignment(.center)

            Text("All-in-one app for your pet’s needs. Manage health, track activities, and find services easily.")
                .font(DSTypography.body)
                .foregroundStyle(DSColor.Text.secondary)
                .multilineTextAlignment(.center)
        }
        .padding(.horizontal, 24)
    }
}
