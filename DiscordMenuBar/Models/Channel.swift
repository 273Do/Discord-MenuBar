import Foundation

protocol ChannelProtocol {
    var id: UUID { get }
    var channelId: String { get }
    var channelName: String { get }
}

protocol HasUnreadMessages {
    var hasUnreadMessages: Bool { get }
}

struct Channel: ChannelProtocol, HasUnreadMessages {
    let id: UUID
    let channelId: String
    let channelName: String
    let hasUnreadMessages: Bool
}
