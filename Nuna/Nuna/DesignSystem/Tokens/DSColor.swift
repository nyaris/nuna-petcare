//
//  DSColor.swift
//  Nuna
//
//  Created by nana on 24/03/26.
//

import SwiftUI

extension Color {
    /// Initialize a Color from a hex string like "#RRGGBB" or "#RRGGBBAA"
    init(hex: String) {
        var hexString = hex.trimmingCharacters(in: .whitespacesAndNewlines)
        if hexString.hasPrefix("#") { hexString.removeFirst() }
        var value: UInt64 = 0
        Scanner(string: hexString).scanHexInt64(&value)
        let r, g, b, a: Double
        switch hexString.count {
        case 8: // RRGGBBAA
            r = Double((value & 0xFF000000) >> 24) / 255.0
            g = Double((value & 0x00FF0000) >> 16) / 255.0
            b = Double((value & 0x0000FF00) >> 8) / 255.0
            a = Double(value & 0x000000FF) / 255.0
        case 6: // RRGGBB
            r = Double((value & 0xFF0000) >> 16) / 255.0
            g = Double((value & 0x00FF00) >> 8) / 255.0
            b = Double(value & 0x0000FF) / 255.0
            a = 1.0
        default:
            r = 0; g = 0; b = 0; a = 0
        }
        self = Color(red: r, green: g, blue: b, opacity: a)
    }
}

enum DSColor {

    // MARK: - Brand
    enum Brand {
        static let primary = Color(hex: "#C96F83")        // rosa principal (brand)
        static let secondary = Color(hex: "#E5A5B2")   // rosa claro
        static let primaryLight = Color(hex: "#F3D1D8") // rosa bem suave
        static let primarySoft = Color(hex: "#F8E4E8")    // rosa quase background
        static let secondaryNude = Color(hex: "#D3D3D3")   // cinza claro
    }

    // MARK: - Text
    enum Text {
        static let primary = Color(hex: "#1F2937")   // preto suave (títulos)
        static let secondary = Color(hex: "#4B5563") // cinza escuro (descrições)
        static let tertiary = Color(hex: "#9CA3AF")  // cinza médio (placeholders)
        static let inverted = Color(hex: "#FFFFFF")  // branco (texto em fundo escuro)
    }

    // MARK: - Background
    enum Background {
        static let primary = Color(hex: "#F7F7F7")     // background principal
        static let card = Color(hex: "#FFFFFF")        // fundo de cards
        static let soft = Color(hex: "#F5D6DC")        // rosa claro de destaque
        static let alternative = Color(hex: "#EAE3DA") // bege (tela onboarding)
    }

    // MARK: - Border
    enum Border {
        static let light = Color(hex: "#E5E7EB")  // borda leve
        static let medium = Color(hex: "#D1D5DB") // borda padrão
    }

    // MARK: - Icon
    enum Icon {
        static let primary = Color(hex: "#C96F83")  // ícone ativo (rosa)
        static let secondary = Color(hex: "#6B7280") // ícone inativo (cinza)
    }

    // MARK: - Feedback
    enum Feedback {
        static let success = Color(hex: "#F87171") // vermelho suave (favorito / coração)
    }

    // MARK: - Components
    enum Component {

        enum Checkbox {
            static let active = Color(hex: "#C96F83")  // checkbox selecionado
            static let inactive = Color(hex: "#E5E7EB") // checkbox desmarcado
        }

        enum Button {
            static let primary = Color(hex: "#C96F83") // botão principal (rosa brand)
            static let secondary = Color(hex: "#ECEBE9")  // off white
            static let tertiary = Color(hex: "#D3D3D3")   // cinza claro
            static let text = Color(hex: "#FFFFFF")    // texto do botão
        }

        enum TextField {
            static let background = Color(hex: "#F9FAFB")
            static let hint = Color(hex: "#BEBEBE")
        }
    }
}
