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
    let icon: Image?
    let iconPosition: IconPosition
    let action: () -> Void

    enum IconPosition { case leading, trailing }

    init(title: String, style: DSButtonStyle, state: DSButtonState, icon: Image? = nil, iconPosition: IconPosition = .leading, action: @escaping () -> Void) {
        self.title = title
        self.style = style
        self.state = state
        self.icon = icon
        self.iconPosition = iconPosition
        self.action = action
    }

    var body: some View {
        Group {
            if style == .link {
                linkButton
            } else {
                filledButton
            }
        }
        .disabled(state != .normal)
    }

    // MARK: - Filled styles (primary/secondary/tertiary)
    private var filledButton: some View {
        Button(action: {
            if state == .normal { action() }
        }) {
            ZStack {
                if state == .loading {
                    ProgressView()
                } else {
                    HStack(spacing: 8) {
                        if iconPosition == .leading, let icon = icon {
                            icon
                        }
                        Text(title)
                            .font(DSTypography.body)
                        if iconPosition == .trailing, let icon = icon {
                            icon
                        }
                    }
                }
            }
            .padding()
            .frame(maxWidth: .infinity)
            .background(backgroundColor)
            .foregroundColor(textColor)
            .cornerRadius(12)
            .overlay(
                Group {
                    if style == .secondary {
                        RoundedRectangle(cornerRadius: 12)
                            .stroke(borderColor, lineWidth: 1)
                    }
                }
            )
            .bold()
            .opacity(state == .disabled ? 0.4 : 1)
        }
    }

    // MARK: - Link style
    private var linkButton: some View {
        Button(action: {
            if state == .normal { action() }
        }) {
            HStack(spacing: 6) {
                if state == .loading {
                    ProgressView().scaleEffect(0.8)
                }
                if iconPosition == .leading, let icon = icon {
                    icon
                }
                Text(title)
                if iconPosition == .trailing, let icon = icon {
                    icon
                }
            }
            .font(DSTypography.medium)
            .foregroundStyle(linkTextColor)
            .padding(.vertical, 4)
            .bold()
            .contentShape(Rectangle())
            .opacity(state == .disabled ? 0.6 : 1)
        }
    }

    private var backgroundColor: Color {
        switch style {
        case .primary: return DSColor.Component.Button.primary
        case .secondary: return DSColor.Component.Button.secondary
        case .tertiary: return DSColor.Component.Button.tertiary
        case .link: return .clear
        }
    }

    private var textColor: Color {
        switch style {
        case .primary:
            Color.white
        default:
            DSColor.Text.primary
        }
    }

    private var borderColor: Color {
        let base = DSColor.Border.medium
        return base
    }

    private var linkTextColor: Color {
        state == .disabled ? DSColor.Text.tertiary : DSColor.Component.Button.primary
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
        DSButton(title: "Link / Normal", style: .link, state: .normal, action: {})
        DSButton(title: "Link / Disabled", style: .link, state: .disabled, action: {})
        DSButton(title: "Primary + Icon Leading", style: .primary, state: .normal, icon: Image(systemName: "star.fill"), iconPosition: .leading, action: {})
        DSButton(title: "Secondary + Icon Trailing", style: .secondary, state: .normal, icon: Image(systemName: "chevron.right"), iconPosition: .trailing, action: {})
        DSButton(title: "Primary / Loading", style: .primary, state: .loading, action: {})
    }
    .padding()
    .background(DSColor.Background.primary)
}

