//
//  DSFieldModifier.swift
//  Nuna
//
//  Created by Miguel Barone on 25/03/26.
//

import SwiftUI

struct DSFieldModifier: ViewModifier {
    var isFocused: Bool

    func body(content: Content) -> some View {
        content
            .background(DSColor.Component.TextField.background)
            .overlay(
                RoundedRectangle(cornerRadius: 16)
                    .stroke(
                        isFocused ? DSColor.Brand.primary : DSColor.Border.light,
                        lineWidth: isFocused ? 3 : 1
                    )
            )
            .clipShape(RoundedRectangle(cornerRadius: 16))
    }
}
