import Foundation

#if DEBUG
    enum PreviewData {
        static let user = User(
            id: UUID(),
            userId: UUID(),
            displayName: "Hoge Hoge",
            userName: "hogehoge",
            avatarURL: nil,
            status: .online
        )

        static let user1 = User(
            id: UUID(),
            userId: UUID(),
            displayName: "Fuga Fuga",
            userName: "fugafuga",
            avatarURL: nil,
            status: .online
        )

        static let user2 = User(
            id: UUID(),
            userId: UUID(),
            displayName: "Piyo Piyo",
            userName: "piyopiyo",
            avatarURL: nil,
            status: .online
        )

        static let dms: [DirectMessage] = [
            DirectMessage(
                id: UUID(),
                channelId: UUID(),
                user: user
            ),
            DirectMessage(
                id: UUID(),
                channelId: UUID(),
                user: user1
            ),
            DirectMessage(
                id: UUID(),
                channelId: UUID(),
                user: user2
            ),
        ]
    }
#endif
