import AppKit

enum DMMenuItemFactory {

    static func makeMenuItem(for conversation: DirectConversation, target: AnyObject) -> NSMenuItem {
        let dm = conversation.dm
        let vc = conversation.vc

        let item = NSMenuItem(title: dm.user.displayName, action: nil, keyEquivalent: "")
        item.image = statusImage(for: dm.user.status)

        let submenu = NSMenu()

        let openDM = NSMenuItem(title: "Open DM", action: #selector(AppDelegate.openURL(_:)), keyEquivalent: "")
        openDM.representedObject = URL(string: "discord://discord.com/channels/\(dm.channelId)")
        openDM.target = target
        submenu.addItem(openDM)

        let joinVC = NSMenuItem(title: "Join VC (\(vc.userCount))", action: #selector(AppDelegate.openURL(_:)), keyEquivalent: "")
        joinVC.representedObject = URL(string: "discord://discord.com/channels/\(vc.channelId)")
        joinVC.target = target
        submenu.addItem(joinVC)

        item.submenu = submenu
        return item
    }

    private static func statusImage(for status: UserStatus) -> NSImage {
        let color: NSColor = switch status {
        case .online:       .systemGreen
        case .idle:         .systemYellow
        case .doNotDisturb: .systemRed
        case .offline:      .systemGray
        }
        let image = NSImage(size: NSSize(width: 10, height: 10), flipped: false) { rect in
            color.setFill()
            NSBezierPath(ovalIn: rect).fill()
            return true
        }
        image.isTemplate = false
        return image
    }
}
