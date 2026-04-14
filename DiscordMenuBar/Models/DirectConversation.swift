import Foundation

struct DirectConversation: Identifiable {
    var id: UUID { dm.id }
    let dm: DM
    let vc: VC
}
