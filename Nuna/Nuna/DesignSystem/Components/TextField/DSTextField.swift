//
//  DSTextField.swift
//  Nuna
//
//  Created by Miguel Barone on 25/03/26.
//

import SwiftUI

enum TextFieldStyle {
    case normal
    case big
    case dropdown(options: [String])
}

struct DSTextField: View {
    let description: String
    let hint: String
    let style: TextFieldStyle
    let icon: ImageResource?
    @Binding var typedText: String

    @FocusState private var isTextFieldFocused: Bool

    init(
        description: String,
        hint: String,
        style: TextFieldStyle = .normal,
        icon: ImageResource? = nil,
        typedText: Binding<String> = .constant("")
    ) {
        self.description = description
        self.hint = hint
        self.style = style
        self.icon = icon
        _typedText = typedText
    }

    var body: some View {
        VStack(alignment: .leading) {
            Text(description)
                .font(DSTypography.body)

            switch style {
            case .normal: normalStyleView
            case .big: bigStyleView
            case let .dropdown(options): dropdownStyleView(options: options)
            }
        }
    }

    private var normalStyleView: some View {
        ZStack(alignment: .leading) {
            TextField(hint, text: $typedText)
                .font(DSTypography.body)
                .padding(.leading, icon != nil ? 48 : 16)
                .frame(height: 50)
                .focused($isTextFieldFocused)
                .modifier(DSFieldModifier(isFocused: isTextFieldFocused))

            if let icon {
                Image(icon)
                    .padding(.leading, 16)
                    .foregroundColor(DSColor.Component.TextField.hint)
            }
        }
    }

    private var bigStyleView: some View {
        ZStack(alignment: .topLeading) {
            if typedText.isEmpty && !isTextFieldFocused {
                Text(hint)
                    .font(DSTypography.body)
                    .foregroundStyle(DSColor.Component.TextField.hint)
                    .padding(.top, 16)
                    .padding(.leading, 16)
            }

            TextEditor(text: $typedText)
                .scrollContentBackground(.hidden)
                .frame(height: 90)
                .padding()
                .focused($isTextFieldFocused)
        }
        .modifier(DSFieldModifier(isFocused: isTextFieldFocused))
    }

    private func dropdownStyleView(options: [String]) -> some View {
        Menu {
            ForEach(options, id: \.self) { option in
                Button(option) {
                    hideKeyboard()
                    typedText = option
                }
            }
        } label: {
            HStack {
                Text(typedText.isEmpty ? options.first ?? String() : typedText)
                    .foregroundColor(DSColor.Text.primary)
                    .padding(.leading, 4)
                Spacer()
            }
            .padding()
            .frame(maxWidth: .infinity, maxHeight: 50, alignment: .leading)
            .modifier(DSFieldModifier(isFocused: false))
        }
    }
}

#Preview {
    DSTextField(
        description: "",
        hint: "Email",
        style: .normal,
        icon: .cameraIcon
    )
    .padding(.leading, 16)
    .padding(.trailing, 16)
    DSTextField(
        description: "",
        hint: "Password",
        style: .normal,
        icon: .cameraIcon
    )
    .padding(.leading, 16)
    .padding(.trailing, 16)
    HStack {
        DSTextField(description: "Age *", hint: "e.g., 2 years", style: .normal)
            .padding(.leading, 16)
        DSTextField(description: "Gender *", hint: "Gender", style: .dropdown(options: ["Male", "Female"]))
            .padding(.trailing, 16)
    }
    DSTextField(description: "Additional Notes", hint: "Any special information about your pet...", style: .big)
        .padding()
}
