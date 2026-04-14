import AppKit
import SwiftUI

enum UserStatus: CaseIterable {
    case online, idle, doNotDisturb, offline

    var color: Color {
        switch self {
        case .online:       return .green
        case .idle:         return .yellow
        case .doNotDisturb: return .red
        case .offline:      return .gray
        }
    }

    var label: String {
        switch self {
        case .online:       return "Online"
        case .idle:         return "Idle"
        case .doNotDisturb: return "Do Not Disturb"
        case .offline:      return "Invisible"
        }
    }

    /// ステータス色の丸画像（NSMenu用）
    var circleImage: NSImage {
        let nsColor: NSColor = switch self {
        case .online:       .systemGreen
        case .idle:         .systemYellow
        case .doNotDisturb: .systemRed
        case .offline:      .systemGray
        }
        let image = NSImage(size: NSSize(width: 10, height: 10), flipped: false) { rect in
            nsColor.setFill()
            NSBezierPath(ovalIn: rect).fill()
            return true
        }
        image.isTemplate = false
        return image
    }
}
