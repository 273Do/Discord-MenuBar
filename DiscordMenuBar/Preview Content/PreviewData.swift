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
            status: .idle
        )

        static let user2 = User(
            id: UUID(),
            userId: UUID(),
            displayName: "Piyo Piyo",
            userName: "piyopiyo",
            avatarURL: nil,
            status: .offline
        )

        static let user3 = User(
            id: UUID(),
            userId: UUID(),
            displayName: "Hana Hana",
            userName: "hanahana",
            avatarURL: nil,
            status: .doNotDisturb
        )

        static let conversations: [DirectConversation] = [
            DirectConversation(
                dm: DM(
                    id: "dm-1",
                    channelId: "ch-1",
                    channelName: "Hoge Hoge",
                    hasUnreadMessages: true,
                    user: user
                ),
                vc: VC(
                    id: "vc-1",
                    channelId: "ch-2",
                    channelName: "General",
                    userCount: 3
                )
            ),
            DirectConversation(
                dm: DM(
                    id: "dm-2",
                    channelId: "ch-3",
                    channelName: "Fuga Fuga",
                    hasUnreadMessages: false,
                    user: user1
                ),
                vc: VC(
                    id: "vc-2",
                    channelId: "ch-4",
                    channelName: "Gaming",
                    userCount: 1
                )
            ),
            DirectConversation(
                dm: DM(
                    id: "dm-3",
                    channelId: "ch-5",
                    channelName: "Piyo Piyo",
                    hasUnreadMessages: true,
                    user: user2
                ),
                vc: VC(
                    id: "vc-3",
                    channelId: "ch-6",
                    channelName: "Music",
                    userCount: 5
                )
            ),
            DirectConversation(
                dm: DM(
                    id: "dm-4",
                    channelId: "ch-7",
                    channelName: "Hana Hana",
                    hasUnreadMessages: false,
                    user: user3
                ),
                vc: VC(
                    id: "vc-4",
                    channelId: "ch-8",
                    channelName: "Chill",
                    userCount: 2
                )
            ),
        ]
    }
#endif
