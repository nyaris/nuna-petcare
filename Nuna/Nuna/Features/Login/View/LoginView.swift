//
//  ContentView.swift
//  Nuna
//
//  Created by nana on 24/03/26.
//

import SwiftUI

struct LoginView: View {

    @State private var currentIndex = 0

    private let headerItems = [
        OnboardingHeaderItem(imageName: "boy-and-cat"),
        OnboardingHeaderItem(imageName: "girl-and-rabbit"),
        OnboardingHeaderItem(imageName: "guy-and-dog")
    ]

    var body: some View {
        ZStack {
            DSColor.Background.alternative.ignoresSafeArea()

            VStack(spacing: DSSpacing.lg) {
                OnboardingHeaderView(
                    items: headerItems,
                    currentIndex: $currentIndex
                )
                LoginTitleSectionView()
                VStack(spacing: 6) {
                    DSTextField(description: String(), hint: LoginConstants.Texts.emailPlaceholder, icon: .mailIcon)
                        .padding(.vertical, .zero)
                    DSTextField(description: String(), hint: LoginConstants.Texts.passwordPlaceholder, icon: .lockIcon)
                        .padding(.vertical, .zero)
                }
                DSButton(title: LoginConstants.Texts.forgotPassword, style: .link, state: .normal) {
                    // TODO: Action forgot password
                }.frame(maxWidth: .infinity, alignment: .trailing)
                DSButton(title: LoginConstants.Texts.signInTitle, style: .primary, state: .normal) {
                    // TODO: Action Sign In
                }
                DividerAndTextView(text: LoginConstants.Texts.orContinueWith)
                DSButton(title: LoginConstants.Texts.signInWithGoogle, style: .secondary
                         , state: .normal, icon: DSIcon.google.image, iconPosition: .leading) {
                    // TODO: Login with google
                }
                TextAndButtonView()
            }
            .padding()
        }
        .task {
            while true {
                try? await Task.sleep(for: .seconds(LoginConstants.Metrics.treeTime))

                await MainActor.run {
                    withAnimation {
                        currentIndex = (currentIndex + 1) % headerItems.count
                    }
                }
            }
        }
    }
}

#Preview {
    LoginView()
}
