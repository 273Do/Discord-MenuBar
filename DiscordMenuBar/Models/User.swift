import Foundation
import Observation
import SwiftUI

struct User: Identifiable {
    let id: UUID
    let userId: UUID
    let displayName: String
    let userName: String
    let avatarURL: String?
    var status: UserStatus
}

@Observable
class UserState {
    var currentStatus: UserStatus = .online
}

enum UserStatus: CaseIterable {
    case online, idle, doNotDisturb, offline

    var color: Color {
        switch self {
        case .online:       return .green
        case .idle:         return .yellow
        case .doNotDisturb: return .red
        case .offline:      return .gray
        }
    }

    var label: String {
        switch self {
        case .online:       return "Online"
        case .idle:         return "Idle"
        case .doNotDisturb: return "Do Not Disturb"
        case .offline:      return "Invisible"
        }
    }
}
