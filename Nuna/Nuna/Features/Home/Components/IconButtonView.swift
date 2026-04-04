//
//  IconButton.swift
//  Nuna
//
//  Created by nana on 01/04/26.
//

import SwiftUI

struct IconButtonView: View {

    let icon: Image
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            ZStack {
                Circle()
                    .fill(DSColor.Brand.primarySoft)
                    .frame(width: 40, height: 40)

                icon
                    .foregroundStyle(DSColor.Brand.primary)
            }
        }
    }
}
