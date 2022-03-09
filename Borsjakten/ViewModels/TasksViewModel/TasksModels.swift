import SwiftUI

struct TaskItem: Identifiable, Equatable {
    var placement: Int
    var label: String
    var description: String
    var active: Bool
    var isCompleted: Bool
    var id = UUID()
}
