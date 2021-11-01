import SwiftUI

struct TaskItem: Identifiable {
    var id = UUID()
    var placement: Int
    var label: String
    var description: String
    var active: Bool
    var isCompleted: Bool
}
