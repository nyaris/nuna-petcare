//
//  DSCornerRadius.swift
//  Nuna
//
//  Created by nana on 24/03/26.
//

import SwiftUI

enum DSCornerRadius {
    
    // MARK: - Base scale
    static let none: CGFloat = 0
    static let xs: CGFloat = 4
    static let sm: CGFloat = 8
    static let md: CGFloat = 12
    static let lg: CGFloat = 16
    static let xl: CGFloat = 24
    
    // MARK: - Semantic usage (opcional, mas MUITO bom)
    enum Component {
        static let button: CGFloat = md
        static let card: CGFloat = lg
        static let input: CGFloat = md
        static let container: CGFloat = xl
    }
}
