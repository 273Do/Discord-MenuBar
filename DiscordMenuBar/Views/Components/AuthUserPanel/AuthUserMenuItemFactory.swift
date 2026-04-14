import AppKit
import SwiftUI

/// AuthUserPanel の NSMenuItem + ステータスサブメニューを構築するファクトリ
enum AuthUserMenuItemFactory {

    static func makeMenuItem(userState: UserState, target: AnyObject) -> NSMenuItem {
        let item = NSMenuItem()

        let hostingView = NSHostingView(
            rootView: AuthUserPanelView(userState: userState).frame(width: 250)
        )
        hostingView.frame.size = hostingView.fittingSize
        item.view = hostingView

        item.submenu = makeStatusSubmenu(userState: userState, target: target)
        return item
    }

    private static func makeStatusSubmenu(userState: UserState, target: AnyObject) -> NSMenu {
        let menu = NSMenu()
        for status in UserStatus.allCases {
            let item = NSMenuItem(
                title: status.label,
                action: #selector(AppDelegate.changeStatus(_:)),
                keyEquivalent: ""
            )
            item.target = target
            item.representedObject = status
            item.image = status.circleImage
            if status == userState.currentStatus {
                item.state = .on
            }
            menu.addItem(item)
        }
        return menu
    }
}
