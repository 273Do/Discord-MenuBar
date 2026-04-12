import Foundation

struct Server: Identifiable {
    let id: UUID
    let name: String
    let channels: [Channel]
    let voiceChannels: [VC]
}
