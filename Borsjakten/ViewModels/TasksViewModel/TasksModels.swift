import SwiftUI

struct TaskResponse: Identifiable, Equatable {
    var placement: Int
    var status: TaskStatusResponse
    var info: TaskInfoResponse
    let taskID = UUID().uuidString

    var id: String { taskID }

    static func mockedTask(
        placement: Int = 99,
        status: TaskStatusResponse = .locked,
        title: String = "Lorem ipsum",
        text: String = "Doremi fa soida lo"
    ) -> TaskResponse {
        return TaskResponse(placement: placement, status: status, info: .init(title: title, text: text))
    }
}

struct TaskInfoResponse: Equatable {
    var title: String
    var text: String
}

enum TaskStatusResponse {
    case completed, active, locked
}
