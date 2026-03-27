//
//  TextAndButtonView.swift
//  Nuna
//
//  Created by nana on 27/03/26.
//

import SwiftUI

struct TextAndButtonView: View {
    var body: some View {
        HStack {
            Text(LoginConstants.Texts.dontHaveAnAccount)
                .font(DSTypography.body)
                .foregroundStyle(DSColor.Text.primary)
            
            DSButton(title: LoginConstants.Texts.signUpTitle, style: .link, state: .normal) {
                // TODO: Open Sign Up Screen or Bottom Sheet
            }
        }
    }
}
