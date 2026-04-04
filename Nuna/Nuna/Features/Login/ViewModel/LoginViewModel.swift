//
//  LoginViewModel.swift
//  Nuna
//
//  Created by nana on 30/03/26.
//

import Foundation
import Combine

@MainActor
final class LoginViewModel: ObservableObject {

    @Published var email: String = ""
    @Published var password: String = ""

    @Published var isLoading: Bool = false
    @Published var errorMessage: String?
    @Published var isLoggedIn: Bool = false

    // TODO: Apenas Mock, será implementado Login com Firebase
    private let mockEmail = "nina.dominique@gmail.com"
    private let mockPassword = "euamoaoliviabuxexuda"

    // TODO: Discutir tipos de erro com o time
    enum LoginError: LocalizedError {
        case invalidCredentials
        case invalidInput

        var errorDescription: String? {
            switch self {
            case .invalidCredentials:
                return "Invalid email or password"
            case .invalidInput:
                return "Please enter a valid email and password (6+ chars)"
            }
        }
    }

    func login() async {
        guard isValid else {
            errorMessage = LoginError.invalidInput.localizedDescription
            return
        }

        isLoading = true
        errorMessage = nil

        do {
            let response = try await performMockLogin(email: email, password: password)
            // DEU BOMMM !!
            isLoggedIn = true
        } catch {
            errorMessage = (error as? LoginError)?.localizedDescription ?? "Something went wrong"
        }

        isLoading = false
    }

    // TODO: TUDO MOCKADO !! AJUSTAR DEPOIS PRA FAZER LOGIN COM FIREBASE
    private func performMockLogin(email: String, password: String) async throws -> String {
        try? await Task.sleep(for: .seconds(1))

        guard email.lowercased() == mockEmail.lowercased(),
              password == mockPassword else {
            throw LoginError.invalidCredentials
        }

        return "mock_token_123"
    }

    var isValid: Bool {
        return isValidEmail(email) && password.count >= 6
    }

    private func isValidEmail(_ email: String) -> Bool {
        return email.contains("@") && email.contains(".")
    }
}
