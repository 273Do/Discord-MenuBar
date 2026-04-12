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
                    id: UUID(),
                    channelId: "ch-1",
                    channelName: "Hoge Hoge",
                    hasUnreadMessages: true,
                    user: user
                ),
                vc: VC(
                    id: UUID(),
                    channelId: "ch-2",
                    channelName: "General",
                    userCount: 3
                )
            ),
            DirectConversation(
                dm: DM(
                    id: UUID(),
                    channelId: "ch-3",
                    channelName: "Fuga Fuga",
                    hasUnreadMessages: false,
                    user: user1
                ),
                vc: VC(
                    id: UUID(),
                    channelId: "ch-4",
                    channelName: "Gaming",
                    userCount: 1
                )
            ),
            DirectConversation(
                dm: DM(
                    id: UUID(),
                    channelId: "ch-5",
                    channelName: "Piyo Piyo",
                    hasUnreadMessages: true,
                    user: user2
                ),
                vc: VC(
                    id: UUID(),
                    channelId: "ch-6",
                    channelName: "Music",
                    userCount: 5
                )
            ),
            DirectConversation(
                dm: DM(
                    id: UUID(),
                    channelId: "ch-7",
                    channelName: "Hana Hana",
                    hasUnreadMessages: false,
                    user: user3
                ),
                vc: VC(
                    id: UUID(),
                    channelId: "ch-8",
                    channelName: "Chill",
                    userCount: 2
                )
            ),
        ]

        static let servers: [Server] = [
            Server(
                id: UUID(),
                name: "Gaming Hub",
                channels: [
                    Channel(
                        id: UUID(),
                        channelId: "ch-s1",
                        channelName: "general",
                        hasUnreadMessages: true
                    ),
                    Channel(
                        id: UUID(),
                        channelId: "ch-s2",
                        channelName: "announcements",
                        hasUnreadMessages: false
                    ),
                    Channel(
                        id: UUID(),
                        channelId: "ch-s3",
                        channelName: "memes",
                        hasUnreadMessages: true
                    ),
                ],
                voiceChannels: [
                    VC(
                        id: UUID(),
                        channelId: "vc-s1",
                        channelName: "General",
                        userCount: 4
                    ),
                    VC(
                        id: UUID(),
                        channelId: "vc-s2",
                        channelName: "Gaming",
                        userCount: 2
                    ),
                ]
            ),
            Server(
                id: UUID(),
                name: "Study Group",
                channels: [
                    Channel(
                        id: UUID(),
                        channelId: "ch-s4",
                        channelName: "math",
                        hasUnreadMessages: false
                    ),
                    Channel(
                        id: UUID(),
                        channelId: "ch-s5",
                        channelName: "programming",
                        hasUnreadMessages: true
                    ),
                ],
                voiceChannels: [
                    VC(
                        id: UUID(),
                        channelId: "vc-s3",
                        channelName: "Study Room",
                        userCount: 3
                    )
                ]
            ),
            Server(
                id: UUID(),
                name: "Music Lovers",
                channels: [
                    Channel(
                        id: UUID(),
                        channelId: "ch-s6",
                        channelName: "share-music",
                        hasUnreadMessages: false
                    ),
                    Channel(
                        id: UUID(),
                        channelId: "ch-s7",
                        channelName: "recommendations",
                        hasUnreadMessages: false
                    ),
                    Channel(
                        id: UUID(),
                        channelId: "ch-s8",
                        channelName: "production",
                        hasUnreadMessages: true
                    ),
                    Channel(
                        id: UUID(),
                        channelId: "ch-s9",
                        channelName: "feedback",
                        hasUnreadMessages: false
                    ),
                ],
                voiceChannels: [
                    VC(
                        id: UUID(),
                        channelId: "vc-s4",
                        channelName: "Listening Party",
                        userCount: 7
                    ),
                    VC(
                        id: UUID(),
                        channelId: "vc-s5",
                        channelName: "Jam Session",
                        userCount: 0
                    ),
                    VC(
                        id: UUID(),
                        channelId: "vc-s6",
                        channelName: "Chill",
                        userCount: 1
                    ),
                ]
            ),
        ]
    }
#endif
