import SwiftUI

struct MenuBarView: View {
    var userState = UserState()

    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            
            AuthUserPanelView(userState: userState)
            
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
