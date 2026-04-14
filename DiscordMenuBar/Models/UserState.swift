import Observation

@Observable
class UserState {
    var currentStatus: UserStatus = .online
}
