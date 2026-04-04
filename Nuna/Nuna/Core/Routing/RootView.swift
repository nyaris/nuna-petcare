//
//  RootView.swift
//  Nuna
//
//  Created by nana on 31/03/26.
//

import SwiftUI

struct RootView: View {
    @StateObject var router = AppRouter()
    @StateObject var loginViewModel = LoginViewModel()

    var body: some View {
        Group {
            if router.isLoggedIn {
                HomeFlowView()
            } else {
                LoginFlowView()
            }
        }
        .environmentObject(router)
        .environmentObject(loginViewModel)
        .onReceive(loginViewModel.$isLoggedIn) { logged in
            if logged {
                router.goToHome()
            }
        }
    }
}
