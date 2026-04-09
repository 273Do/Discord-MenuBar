import SwiftUI

@main
struct DiscordMenuBarApp: App {
    var body: some Scene {
        MenuBarExtra("Discord", systemImage: "bubble.left.and.bubble.right.fill") {
            MenuBarView()
        }
//        .menuBarExtraStyle(.window)
    }
}
