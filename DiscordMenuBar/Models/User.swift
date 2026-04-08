import Foundation
import SwiftUI

struct User: Identifiable {
    let id: UUID
    let userId: UUID
    let displayName: String
    let userName: String
    let avatarURL: String?
    var status: UserStatus
}

enum UserStatus {
    case online, idle, doNotDisturb, offline

    var color: Color {
        switch self {
        case .online:       return .green
        case .idle:         return .yellow
        case .doNotDisturb: return .red
        case .offline:      return .gray
        }
    }
}
