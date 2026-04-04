//
//  HomeFlowView.swift
//  Nuna
//
//  Created by nana on 31/03/26.
//

import SwiftUI

struct HomeFlowView: View {
    @EnvironmentObject var router: AppRouter

    var body: some View {
        NavigationStack(path: $router.path) {
            HomeView()
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
//        case .task:
//            // TODO: Chamar TaskView
//        case .shop:
//            // TODO: Chamar ShopView
//        case .social:
//            // TODO: Chamar SocialView
//        case .profile:
//            // TODO: Chamar ProfileView
        }
    }
}

#Preview {
    HomeFlowView()
        .environmentObject(AppRouter())
}
