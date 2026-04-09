import SwiftUI

struct DMListView: View {
    let conversations: [DirectConversation]
    
    var body: some View {
        VStack(spacing: 0) {
            ForEach(conversations) { dm in
                DMRowView(conversation: dm)
            }
        }
    }
}

#Preview {
    DMListView(conversations: PreviewData.conversations)
}
