import SwiftUI

struct DMRowView: View {
    let conversation: DirectConversation
    var dm: DM { conversation.dm }
    var vc: VC { conversation.vc }

    var body: some View {
        Menu {
            Button("DMを開く"){}
            Button("VCを開く (\(vc.userCount))"){}
        } label: {
            HStack {

                Image(systemName: "circle.fill")
                    .symbolRenderingMode(.palette)
                    .foregroundColor(dm.user.status.color)

                Text(conversation.dm.user.displayName)
                    .foregroundColor(
                        conversation.dm.hasUnreadMessages ? .primary : .secondary
                    )
            }
        }
    }
}

#Preview {
    DMRowView(conversation: PreviewData.conversations[0])
    DMRowView(conversation: PreviewData.conversations[1])
}
