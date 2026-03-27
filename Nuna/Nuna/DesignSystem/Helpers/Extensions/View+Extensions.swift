//
//  View+Extensions.swift
//  Nuna
//
//  Created by Miguel Barone on 25/03/26.
//

import SwiftUI

extension View {
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
