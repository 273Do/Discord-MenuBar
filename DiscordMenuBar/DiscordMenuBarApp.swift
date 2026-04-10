import SwiftUI

@main
struct DiscordMenuBarApp: App {
    @NSApplicationDelegateAdaptor(AppDelegate.self) var appDelegate

    var body: some Scene {
        Settings { EmptyView() }
    }
}

class AppDelegate: NSObject, NSApplicationDelegate {
    private var statusItem: NSStatusItem!
    private let userState = UserState()

    func applicationDidFinishLaunching(_ notification: Notification) {
        statusItem = NSStatusBar.system.statusItem(
            withLength: NSStatusItem.variableLength
        )
        statusItem.button?.image = NSImage(
            systemSymbolName: "bubble.left.and.bubble.right.fill",
            accessibilityDescription: "Discord"
        )

        let menu = NSMenu()

        // Custom SwiftUI: AuthUserPanelView (with status submenu)
        let authItem = NSMenuItem()
        let hostingView = NSHostingView(
            rootView: AuthUserPanelView(userState: userState).frame(width: 250)
        )
        hostingView.frame.size = hostingView.fittingSize
        authItem.view = hostingView

        let statusSubmenu = NSMenu()
        for status in UserStatus.allCases {
            let item = NSMenuItem(
                title: status.label,
                action: #selector(changeStatus(_:)),
                keyEquivalent: ""
            )
            item.target = self
            item.representedObject = status
            item.image = statusCircleImage(for: status)
            if status == userState.currentStatus {
                item.state = .on
            }
            statusSubmenu.addItem(item)
        }
        statusSubmenu.delegate = self
        authItem.submenu = statusSubmenu

        menu.addItem(authItem)

        menu.addItem(.separator())

        let dmHeader = NSMenuItem()
        dmHeader.attributedTitle = NSAttributedString(
            string: "DIRECT MESSAGES",
            attributes: [
                .font: NSFont.systemFont(ofSize: 11, weight: .semibold),
                .foregroundColor: NSColor.secondaryLabelColor,
            ]
        )
        dmHeader.isEnabled = false
        menu.addItem(dmHeader)

        // Native NSMenuItems: DM list
        for conversation in PreviewData.conversations {
            let item = DMMenuItemFactory.makeMenuItem(for: conversation, target: self)
            menu.addItem(item)
        }

        menu.addItem(.separator())

        // Native NSMenuItem: Quit
        menu.addItem(
            withTitle: "Quit Discord MenuBar",
            action: #selector(NSApplication.terminate(_:)),
            keyEquivalent: "q"
        )

        statusItem.menu = menu
    }

    @objc func openURL(_ sender: NSMenuItem) {
        guard let url = sender.representedObject as? URL else { return }
        NSWorkspace.shared.open(url)
    }

    @objc func changeStatus(_ sender: NSMenuItem) {
        guard let status = sender.representedObject as? UserStatus else { return }
        userState.currentStatus = status
    }

    /// ステータス色の丸画像を生成する
    private func statusCircleImage(for status: UserStatus) -> NSImage {
        let size = NSSize(width: 10, height: 10)
        let image = NSImage(size: size, flipped: false) { rect in
            let nsColor: NSColor
            switch status {
            case .online:       nsColor = .systemGreen
            case .idle:         nsColor = .systemYellow
            case .doNotDisturb: nsColor = .systemRed
            case .offline:      nsColor = .systemGray
            }
            nsColor.setFill()
            NSBezierPath(ovalIn: rect).fill()
            return true
        }
        image.isTemplate = false
        return image
    }
}
// MARK: - NSMenuDelegate
extension AppDelegate: NSMenuDelegate {
    func menuNeedsUpdate(_ menu: NSMenu) {
        // サブメニューが開くたびに現在のステータスのチェックマークを更新
        for item in menu.items {
            if let status = item.representedObject as? UserStatus {
                item.state = status == userState.currentStatus ? .on : .off
            }
        }
    }
}

