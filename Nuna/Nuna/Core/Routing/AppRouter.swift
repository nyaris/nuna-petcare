//
//  AppRouter.swift
//  Nuna
//
//  Created by nana on 31/03/26.
//

import SwiftUI
import Combine

final class AppRouter: ObservableObject {
    @Published var path = NavigationPath()
    
    @Published var isLoggedIn: Bool = false
    
    func push(route: AppRoute) {
        path.append(route)
    }

    func pop() {
        if !path.isEmpty {
            path.removeLast()
        }
    }

    func popToRoot() {
        path.removeLast(path.count)
    }

    func goToHome() {
        isLoggedIn = true
        popToRoot()
    }

    func goToLogin() {
        isLoggedIn = false
        popToRoot()
    }
}
