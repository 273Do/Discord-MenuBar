import Foundation

struct DirectMessage: Identifiable {
    let id: UUID
    let channelId: UUID
    var user: User
}
