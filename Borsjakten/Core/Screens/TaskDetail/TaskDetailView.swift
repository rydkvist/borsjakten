import SwiftUI

struct TaskDetailView: View {
    @EnvironmentObject private var tasksVM: TasksViewModel
    var task: TaskResponse
    
    var body: some View {
        NavigationView {
            VStack {
                Text(task.info.title)
                    .font(.headline)

                Text(task.info.text)
                    .font(.subheadline)

                Button("Finished reading", action: { tasksVM.completeTask(task) })
            }
        }
        .navigationTitle("Task \(task.placement)")
    }
}

struct TaskDetailView_Previews: PreviewProvider {
    static var previews: some View {
        TaskDetailView(task: .mockedTask())
    }
}
