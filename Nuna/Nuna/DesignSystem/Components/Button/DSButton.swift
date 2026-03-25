//
//  DSButton.swift
//  Nuna
//
//  Created by nana on 24/03/26.
//

import SwiftUI

struct DSButton: View {
    let title: String
    let style: DSButtonStyle
    let state: DSButtonState
    let action: () -> Void

    var body: some View {
        Button(action: {
            if state == .normal { action() }
        }) {
            ZStack {
                if state == .loading {
                    ProgressView()
                } else {
                    Text(title)
                        .font(DSTypography.body)
                }
            }
            .padding()
            .frame(maxWidth: .infinity)
            .background(backgroundColor)
            .foregroundColor(textColor)
            .cornerRadius(12)
            .opacity(state == .disabled ? 0.4 : 1)
        }
        .disabled(state != .normal)
    }

    private var backgroundColor: Color {
        switch style {
        case .primary: return DSColor.Component.Button.primary
        case .secondary: return DSColor.Component.Button.secondary
        case .tertiary: return DSColor.Component.Button.tertiary
        }
    }

    private var textColor: Color {
        DSColor.Text.primary
    }
}

#Preview("DSButton - Examples") {
    VStack(spacing: 16) {
        DSButton(title: "Primary / Normal", style: .primary, state: .normal, action: {})
        DSButton(title: "Primary / Disabled", style: .primary, state: .disabled, action: {})
        DSButton(title: "Secondary / Normal", style: .secondary, state: .normal, action: {})
        DSButton(title: "Secondary / Disabled", style: .secondary, state: .disabled, action: {})
        DSButton(title: "Tertiary / Normal", style: .tertiary, state: .normal, action: {})
        DSButton(title: "Tertiary / Disabled", style: .tertiary, state: .disabled, action: {})
        DSButton(title: "Primary / Loading", style: .primary, state: .loading, action: {})
    }
    .padding()
    .background(DSColor.Background.primary)
}
