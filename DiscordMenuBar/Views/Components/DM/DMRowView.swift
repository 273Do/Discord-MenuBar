import SwiftUI

struct DMRowView: View {
    let dm: DirectConversation

    var body: some View {
        Menu {
            Button("Open DM"){}
            Button("Opne VC"){}
        } label: {
            HStack {

                Image(systemName: "circle.fill")
                    .symbolRenderingMode(.palette)
                    .foregroundColor(dm.dm.user.status.color)

                Text(dm.dm.user.displayName)
                    .foregroundColor(
                        dm.dm.hasUnreadMessages ? .primary : .secondary
                    )
            }
        }
    }
}

#Preview {
    DMRowView(dm: PreviewData.conversations[0])
    DMRowView(dm: PreviewData.conversations[1])
}
