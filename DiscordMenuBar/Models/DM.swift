import Foundation

struct DM: ChannelProtocol, HasUnreadMessages {
    let id: String
    let channelId: String
    let channelName: String
    let hasUnreadMessages: Bool
    let user: User
}
