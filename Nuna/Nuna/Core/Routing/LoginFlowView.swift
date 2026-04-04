//
//  LoginFlowView.swift
//  Nuna
//
//  Created by nana on 31/03/26.
//

import SwiftUI

struct LoginFlowView: View {
    @EnvironmentObject var router: AppRouter
    @EnvironmentObject var loginViewModel: LoginViewModel

    var body: some View {
        NavigationStack(path: $router.path) {
            LoginView()
                .navigationDestination(for: AppRoute.self) { route in
                    destination(for: route)
                }
        }
    }

    @ViewBuilder
    private func destination(for route: AppRoute) -> some View {
        switch route {
        case .login:
            LoginView()
        case .home:
            HomeView()
            // TODO: Chamar HomeView
        }
    }
}

#Preview {
    LoginFlowView()
        .environmentObject(AppRouter())
        .environmentObject(LoginViewModel())
}
