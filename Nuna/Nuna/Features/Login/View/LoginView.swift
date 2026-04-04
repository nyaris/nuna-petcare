//
//  ContentView.swift
//  Nuna
//
//  Created by nana on 24/03/26.
//

import SwiftUI

struct LoginView: View {

    @State private var currentIndex = 0
    @EnvironmentObject private var viewModel: LoginViewModel

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
                    DSTextField(description: String(), hint: LoginConstants.Texts.emailPlaceholder, icon: .mailIcon, typedText: $viewModel.email)
                        .padding(.vertical, .zero)
                    DSTextField(description: String(), hint: LoginConstants.Texts.passwordPlaceholder, style: .secure, icon: .lockIcon, typedText: $viewModel.password)
                        .padding(.vertical, .zero)
                }
                DSButton(title: LoginConstants.Texts.forgotPassword, style: .link, state: .normal) {
                    // TODO: Action forgot password
                }.frame(maxWidth: .infinity, alignment: .trailing)
                DSButton(title: LoginConstants.Texts.signInTitle, style: .primary, state: viewModel.isLoading ? .loading : (viewModel.isValid ? .normal : .disabled)) {
                    Task {
                        await viewModel.login()
                    }
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
        .environmentObject(LoginViewModel())
    
}
