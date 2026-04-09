import SwiftUI

struct MenuBarView: View {

    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("Discor Menu Bar")
                .font(.headline)

            Divider()

            DMListView(conversations: PreviewData.conversations)

            Divider()
            
            Button("Quit Discord MenuBar") {
                NSApplication.shared.terminate(nil)
            }
        }
        .padding()
        .frame(width: 250)
    }
}
#Preview {
    MenuBarView()
}
