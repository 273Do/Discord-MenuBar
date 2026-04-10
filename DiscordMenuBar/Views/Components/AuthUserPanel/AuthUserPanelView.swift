import SwiftUI

struct AuthUserPanelView: View {
    @State private var isOn = false

    var body: some View {
        HStack {

            Group {
                Image(systemName: "person.circle.fill")
                    .resizable()
                    .frame(width: 32, height: 32)
                    .overlay(alignment: .bottomTrailing) {
                        Circle()
                            .fill(.green)
                            .frame(width: 12, height: 12)
                            .overlay(
                                Circle().stroke(
                                    Color(.windowBackgroundColor),
                                    lineWidth: 3
                                )
                            )
                            .offset(x: 1, y: 1)
                    }

                VStack(alignment: .leading) {
                    Text("Username")
                        .font(.headline)
                    Text("#1234")
                        .font(.caption)
                        .foregroundStyle(.secondary)
                }
            }

            Spacer()

            Group {
                Image(systemName: "microphone.fill")
                    .frame(width: 16, height: 16)
                Image(systemName: "headphones")
                    .frame(width: 16, height: 16)

            }
        }
        .padding(12)
        .background(
            RoundedRectangle(cornerRadius: 8)
                .fill(Color.primary.opacity(0))
        )
        .padding(.horizontal, 8)
    }
}

#Preview { AuthUserPanelView() }
