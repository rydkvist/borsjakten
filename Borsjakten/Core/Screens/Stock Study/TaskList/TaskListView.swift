import SwiftUI

struct TaskListView: View {
    @ObservedObject var tasksVM: TasksViewModel

    private let gridColumns: [GridItem] = [
        GridItem(.flexible(minimum: .minButtonSize), spacing: 0, alignment: .center),
        GridItem(.flexible(minimum: .minButtonSize), spacing: 0, alignment: .center),
        GridItem(.flexible(minimum: .minButtonSize), spacing: 0, alignment: .center)
    ]
    
    var body: some View {
        LazyVGrid(columns: gridColumns, alignment: .center, spacing: 0) {
            ForEach(tasksVM.tasks) { task in
                TaskItemView(task: task)
            }
        }
        .padding(.horizontal)
    }
}

struct TaskListView_Previews: PreviewProvider {
    static var previews: some View {
        TaskListView(tasksVM: TasksViewModel())
    }
}
