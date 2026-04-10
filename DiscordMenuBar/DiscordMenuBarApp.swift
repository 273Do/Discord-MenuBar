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

    func applicationDidFinishLaunching(_ notification: Notification) {
        statusItem = NSStatusBar.system.statusItem(
            withLength: NSStatusItem.variableLength
        )
        statusItem.button?.image = NSImage(
            systemSymbolName: "bubble.left.and.bubble.right.fill",
            accessibilityDescription: "Discord"
        )

        let menu = NSMenu()

        // Custom SwiftUI: AuthUserPanelView
        let authItem = NSMenuItem()
        let hostingView = NSHostingView(rootView: AuthUserPanelView().frame(width: 250))
        hostingView.frame.size = hostingView.fittingSize
        authItem.view = hostingView
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
}
