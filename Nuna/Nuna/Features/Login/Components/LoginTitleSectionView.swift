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
            Text(LoginConstants.Texts.caringPawSible)
                .font(DSTypography.title)
                .foregroundStyle(DSColor.Text.primary)
                .multilineTextAlignment(.center)

            Text(LoginConstants.Texts.allInOneApp)
                .font(DSTypography.body)
                .foregroundStyle(DSColor.Text.secondary)
                .multilineTextAlignment(.center)
        }
        .padding(.horizontal, 24)
    }
}
