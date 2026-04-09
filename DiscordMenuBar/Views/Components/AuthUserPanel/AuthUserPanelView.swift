import SwiftUI

struct AuthUserPanelView: View {
    @State private var isOn = false

    var body: some View {
        HStack {
            Circle()
                .fill(Color.green)
                .frame(width: 32, height: 32)
            VStack(alignment: .leading) {
                Text("Username")
                    .font(.headline)
                Text("#1234")
                    .font(.caption)
                    .foregroundStyle(.secondary)
            }
            Spacer()
            Toggle("", isOn: $isOn)
                .labelsHidden()
        }
        .padding(12)
        .background(
            RoundedRectangle(cornerRadius: 8)
                .fill(Color.blue.opacity(0.2))
        )
        .padding(.horizontal)
        .padding(.top, 8)
    }
}

#Preview { AuthUserPanelView() }
