import AppKit

/// Server の NSMenuItem を構築するファクトリ
enum ServerMenuItemFactory {
    static func makeMenuItem(for server: Server, target: AnyObject) -> NSMenuItem {
        let item = NSMenuItem(title: server.name, action: nil, keyEquivalent: "")

        let submenu = NSMenu()

        let channelHeader = NSMenuItem()
        channelHeader.attributedTitle = NSAttributedString(
            string: "TEXT CHANNELS",
            attributes: [
                .font: NSFont.systemFont(ofSize: 10, weight: .semibold),
                .foregroundColor: NSColor.secondaryLabelColor,
            ]
        )
        channelHeader.isEnabled = false
        submenu.addItem(channelHeader)

        for channel in server.channels {
            let channelItem = NSMenuItem(
                title: "",
                action: #selector(AppDelegate.openURL(_:)),
                keyEquivalent: ""
            )
            let fontWeight: NSFont.Weight = channel.hasUnreadMessages ? .bold : .light
            channelItem.attributedTitle = NSAttributedString(
                string: "# \(channel.channelName)",
                attributes: [.font: NSFont.systemFont(ofSize: 14, weight: fontWeight)]
            )
            channelItem.representedObject = URL(string: "discord://discord.com/channels/\(channel.channelId)")
            channelItem.target = target
            submenu.addItem(channelItem)
        }

        submenu.addItem(.separator())

        let vcHeader = NSMenuItem()
        vcHeader.attributedTitle = NSAttributedString(
            string: "VOICE CHANNELS",
            attributes: [
                .font: NSFont.systemFont(ofSize: 10, weight: .semibold),
                .foregroundColor: NSColor.secondaryLabelColor,
            ]
        )
        vcHeader.isEnabled = false
        submenu.addItem(vcHeader)

        for vc in server.voiceChannels {
            let vcItem = NSMenuItem(
                title: "🔊 \(vc.channelName) (\(vc.userCount))",
                action: #selector(AppDelegate.openURL(_:)),
                keyEquivalent: ""
            )
            vcItem.representedObject = URL(string: "discord://discord.com/channels/\(vc.channelId)")
            vcItem.target = target
            submenu.addItem(vcItem)
        }

        item.submenu = submenu
        return item
    }
}
