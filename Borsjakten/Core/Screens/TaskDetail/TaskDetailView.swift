import SwiftUI

struct TaskDetailView: View {
    var task: TaskItem
    
    var body: some View {
        NavigationView {
            VStack {
                Text(task.label)
                    .font(.headline)
                Text(task.description)
                    .font(.subheadline)
            }
        }
        .navigationTitle("Task \(task.placement)")
    }
}

struct TaskDetailView_Previews: PreviewProvider {
    static var previews: some View {
        TaskDetailView(task: TaskItem(
            placement: 1,
            label: "CSN",
            description: "Beskrivning",
            active: true,
            isCompleted: true
        ))
    }
}
