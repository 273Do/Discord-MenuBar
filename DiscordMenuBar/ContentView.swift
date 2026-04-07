import SwiftUI

struct ContentView: View {

    struct MenuItem: Identifiable {
        let id = UUID()
        let icon: String
        let color: Color
        let text: String
    }
    
    let items: [MenuItem] = [
        MenuItem(icon: "circle.fill", color: .green, text: "Online"),
        MenuItem(icon: "circle.fill", color: .yellow, text: "Idle"),
        MenuItem(icon: "circle.fill", color: .red, text: "Do Not Disturb"),
        MenuItem(icon: "circle.fill", color: .gray, text: "Invisible"),
    
    ]


    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("Discor Menu Bar")
                .font(.headline)

            Divider()

            ForEach(items) { item in
                Button {
                    print("click!")
                } label: {
                    HStack {
                        Image(systemName: item.icon)
                            .symbolRenderingMode(.palette)
                            .foregroundColor(item.color)
                        Text(item.text)
                    }
                }
            }

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
    ContentView()
}
