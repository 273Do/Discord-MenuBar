import Foundation

struct User: Identifiable {
    let id: UUID
    let userId: UUID
    let displayName: String
    let userName: String
    let avatarURL: String?
    var status: UserStatus
}
