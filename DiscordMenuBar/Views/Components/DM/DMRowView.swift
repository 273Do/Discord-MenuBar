import SwiftUI

struct DMRowView: View {
    let dm: DirectMessage

    var body: some View {
        Button {
            print("click!")
        } label: {
            HStack {
                Image(systemName: "circle.fill")
                    .symbolRenderingMode(.palette)
//                    .foregroundColor(item.color)
                Text(dm.user.displayName)
            }
        }
    }
}

#Preview {
    DMRowView(dm: PreviewData.dms[0])
}
