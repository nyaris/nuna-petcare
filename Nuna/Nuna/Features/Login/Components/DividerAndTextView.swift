//
//  DividerAndText.swift
//  Nuna
//
//  Created by nana on 27/03/26.
//

import SwiftUI

struct DividerAndTextView: View {
    let text: String

    var body: some View {
        HStack {
            line

            Text(text)
                .font(DSTypography.body)
                .foregroundStyle(DSColor.Text.primary)
                .opacity(LoginConstants.Metrics.textMutedOpacity)

            line
        }
    }

    private var line: some View {
        Rectangle()
            .fill(DSColor.Border.soft)
            .frame(height: LoginConstants.Metrics.dividerThickness)
            .frame(maxWidth: .infinity)
            .opacity(LoginConstants.Metrics.dividerOpacity)
    }
}
