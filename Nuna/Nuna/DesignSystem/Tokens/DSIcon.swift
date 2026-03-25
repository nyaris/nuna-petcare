//
//  DSIcon.swift
//  Nuna
//
//  Created by nana on 25/03/26.
//

import SwiftUI

enum DSIcon: String {
    case home
    case task
    case bag
    case users
    case user
    case notifications
    case bell
    case arrowLeft
    case camera
    case upload
}

extension DSIcon {
    var image: Image {
        Image(assetName)
    }

    private var assetName: String {
        switch self {
        case .home: return "home_icon"
        case .task: return "task_icon"
        case .bag: return "bag_icon"
        case .users: return "users_icon"
        case .user: return "user_icon"
        case .notifications: return "notifications_icon"
        case .bell: return "bell_icon"
        case .arrowLeft: return "arrow_left_icon"
        case .camera: return "camera_icon"
        case .upload: return "upload_icon"
        }
    }
}
