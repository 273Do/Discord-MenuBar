import SwiftUI

struct AuthUserPanelView: View {
    var userState: UserState
    @State private var isMicOn = true
    @State private var isDeafened = false
    @State private var wasMicOnBeforeDeafen = true

    var body: some View {
        HStack {

            Group {
                Image(systemName: "person.circle.fill")
                    .resizable()
                    .frame(width: 32, height: 32)
                    .overlay(alignment: .bottomTrailing) {
                        Circle()
                            .fill(userState.currentStatus.color)
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

            HStack(spacing: 8) {
                Button {
                    if isDeafened {
                        isDeafened = false
                        isMicOn = true
                    } else {
                        isMicOn.toggle()
                    }
                } label: {
                    Image(systemName: isMicOn && !isDeafened
                        ? "microphone.fill" : "microphone.slash.fill")
                        .frame(width: 16, height: 16)
                        .foregroundColor(isMicOn && !isDeafened ? .primary : .red)
                }
                .buttonStyle(.plain)

                Button {
                    if isDeafened {
                        isDeafened = false
                    } else {
                        wasMicOnBeforeDeafen = isMicOn
                        isDeafened = true
                    }
                } label: {
                    Image(systemName: isDeafened
                        ? "headphones.slash" : "headphones")
                        .frame(width: 16, height: 16)
                        .foregroundColor(isDeafened ? .red : .primary)
                }
                .buttonStyle(.plain)
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

#Preview { AuthUserPanelView(userState: UserState()) }
