//
//  HomeView.swift
//  Nuna
//
//  Created by nana on 01/04/26.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        HStack(spacing: 16) {
            AvatarView(imageName: "girl-and-rabbit", size: 48)
            VStack(alignment: .leading) {
                Text("Hi, Sirena")
                    .font(DSTypography.title)
                Text("Let's take care of your cutie pets!")
                    .font(DSTypography.medium)
                    .foregroundColor(DSColor.Text.secondary)
            }
            Spacer()
            IconButtonView(icon: DSIcon.bell.image) {
                print("tap notifications")
            }
        }.padding(20)
        CarouselCardView(
            items: [
                .init(
                    title: "Did you know?",
                    description: "Dogs can accurately read human facial expressions...",
                    imageName: "black-dog"
                ),
                .init(
                    title: "Fun fact",
                    description: "Cats sleep 70% of their lives!",
                    imageName: "black-cat"
                ),
                .init(
                    title: "Bunnies ‘binky’",
                    description: "You’ll know a rabbit is binkying because of the happy hop in the air look unmistakably like pure joy.",
                    imageName: "rabbit"
                )
            ]
        )
        .padding(.horizontal, 20)
        HStack {
            Text("My pets")
                .font(DSTypography.title)
            Spacer()
            DSButton(title: "Add +", style: .link, state: .normal) {
                // TODO: Open add more pets screen
            }
        }.padding(20)
        MyPetCardView(
            pet: Pet(
                name: "Olívia",
                age: "1 year 4 month",
                imageName: "rabbit",
                tasks: [
                    .init(title: "Grooming", isDone: true),
                    .init(title: "Walking for 5 km", isDone: true),
                    .init(title: "Healthy food", isDone: false)
                ],
            ),
            onTapDetails: {
                print("Go to details")
            }
        ).padding(.horizontal, 20)
        TabBarView()
    }
}


#Preview {
    HomeView()
}
