import SwiftUI

struct MenuBarView: View {

    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("Discor Menu Bar")
                .font(.headline)

            Divider()

            DMListView(dms: PreviewData.dms)

            Divider()

            Button("Discordを開く") {
                NSWorkspace.shared.open(URL(string: "discord://")!)
            }
        }
        .padding()
        .frame(width: 250)
    }
}
#Preview {
    MenuBarView()
}
