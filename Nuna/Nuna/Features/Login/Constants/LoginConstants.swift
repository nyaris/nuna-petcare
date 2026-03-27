//
//  LoginConstants.swift
//  Nuna
//
//  Centralized constants for Login texts and component metrics.
//

import SwiftUI

enum LoginConstants {
    enum Texts {
        static let emailPlaceholder = "Email"
        static let passwordPlaceholder = "Password"
        static let signInTitle = "Sign In"
        static let signUpTitle = "Sign Up"
        static let forgotPassword = "Forgot password"
        static let orContinueWith = "Or continue with"
        static let signInWithGoogle = "Sign in with Google"
        static let dontHaveAnAccount = "Don't have an account?"
        static let caringPawSible = "Caring Made Paw-sible"
        static let allInOneApp = "All-in-one app for your pet’s needs. Manage health, track activities, and find services easily."
    }

    enum Metrics {
        // Spacing
        static let horizontalPadding: CGFloat = 16
        static let verticalPadding: CGFloat = 16
        static let fieldSpacing: CGFloat = 12
        static let buttonSpacing: CGFloat = 16
        static let dividerTextSpacing: CGFloat = 8

        // Sizes
        static let buttonCornerRadius: CGFloat = 12
        static let dividerThickness: CGFloat = 0.5
        static let treeTime: CGFloat = 3

        // Opacity
        static let disabledOpacity: Double = 0.4
        static let dividerOpacity: Double = 0.3
        static let textMutedOpacity: Double = 0.5

        // Line width
        static let secondaryBorderWidth: CGFloat = 1
        
        static let buttonHeight: CGFloat = 50

        // Onboarding Header
        static let headerVerticalSpacing: CGFloat = 16
        static let headerBackgroundCircleSize: CGFloat = 220
        static let headerAvatarSize: CGFloat = 160
        static let headerAnimationDuration: Double = 0.5
        static let headerIndicatorSpacing: CGFloat = 8
        static let headerActiveIndicatorWidth: CGFloat = 24
        static let headerIndicatorHeight: CGFloat = 6

    }
}
