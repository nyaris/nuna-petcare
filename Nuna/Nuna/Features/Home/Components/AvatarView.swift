//
//  AvatarUserView.swift
//  Nuna
//
//  Created by nana on 01/04/26.
//

import SwiftUI

struct AvatarView: View {

    let imageName: String
    let size: CGFloat

    var body: some View {
        Image(imageName)
            .resizable()
            .scaledToFill()
            .frame(width: size, height: size)
            .clipShape(Circle())
            .overlay(
                Circle()
                    .stroke(Color.white, lineWidth: 2)
            )
    }
}
