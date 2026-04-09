import SwiftUI

struct DMRowView: View {
    let conversation: DirectConversation
    var dm: DM { conversation.dm }
    var vc: VC { conversation.vc }

    var body: some View {
        Menu {
            Button("Open DM") {
                NSWorkspace.shared.open(URL(string: "discord://discord.com/channels/\(dm.channelId)")!)
            }
            Button("Join VC (\(vc.userCount))") {
                NSWorkspace.shared.open(URL(string: "discord://discord.com/channels/\(vc.channelId)")!)
            }
        } label: {
            HStack {

                Image(systemName: "circle.fill")
                    .symbolRenderingMode(.palette)
                    .foregroundColor(dm.user.status.color)

                Text(conversation.dm.user.displayName)
                    .foregroundColor(
                        conversation.dm.hasUnreadMessages
                            ? .primary : .secondary
                    )
            }
        }
    }
}

#Preview {
    DMRowView(conversation: PreviewData.conversations[0])
    DMRowView(conversation: PreviewData.conversations[1])
}
