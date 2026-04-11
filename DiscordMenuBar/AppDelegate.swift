import AppKit

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

        statusItem.menu = buildMenu()
    }

    private func buildMenu() -> NSMenu {
        let menu = NSMenu()

        // Auth user panel (with status submenu)
        let authItem = AuthUserMenuItemFactory.makeMenuItem(
            userState: userState, target: self
        )
        authItem.submenu?.delegate = self
        menu.addItem(authItem)

        menu.addItem(.separator())

        // DM header
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

        // DM list
        for conversation in PreviewData.conversations {
            let item = DMMenuItemFactory.makeMenuItem(for: conversation, target: self)
            menu.addItem(item)
        }

        menu.addItem(.separator())

        // Quit
        menu.addItem(
            withTitle: "Quit Discord MenuBar",
            action: #selector(NSApplication.terminate(_:)),
            keyEquivalent: "q"
        )

        return menu
    }

    @objc func openURL(_ sender: NSMenuItem) {
        guard let url = sender.representedObject as? URL else { return }
        NSWorkspace.shared.open(url)
    }

    @objc func changeStatus(_ sender: NSMenuItem) {
        guard let status = sender.representedObject as? UserStatus else { return }
        userState.currentStatus = status
    }
}

// MARK: - NSMenuDelegate
extension AppDelegate: NSMenuDelegate {
    func menuNeedsUpdate(_ menu: NSMenu) {
        for item in menu.items {
            if let status = item.representedObject as? UserStatus {
                item.state = status == userState.currentStatus ? .on : .off
            }
        }
    }
}
