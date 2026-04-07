import SwiftUI

struct DMListView: View {
    let dms: [DirectMessage]
    
    var body: some View {
        VStack(spacing: 0) {
            ForEach(dms) { dm in
                DMRowView(dm: dm)
            }
        }
    }
}

#Preview {
    DMListView(dms: PreviewData.dms)
}
