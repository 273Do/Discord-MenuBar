protocol ChannelProtocol {
    var id: String { get }
    var channelId: String { get }
    var channelName: String { get }
}

protocol HasUnreadMessages {
    var hasUnreadMessages: Bool { get }
}

struct Channel: ChannelProtocol, HasUnreadMessages {
    let id: String
    let channelId: String
    let channelName: String
    let hasUnreadMessages: Bool
}
