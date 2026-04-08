struct DirectConversation: Identifiable {
    var id: String { dm.id }
    let dm: DM
    let vc: VC
}
