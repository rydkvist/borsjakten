import SwiftUI

class TaskModel: ObservableObject {
    @Published var tasks: [TaskItem] = [
        TaskItem(placement: 5, label: "CSN", description: "Här kan du låna", active: false, isCompleted: false),
        TaskItem(placement: 4, label: "Minecraft", description: "Här kan du låna", active: false, isCompleted: false),
        TaskItem(placement: 3, label: "Bostad", description: "Här kan du låna", active: true, isCompleted: false),
        TaskItem(placement: 2, label: "Crypto", description: "Här kan du låna", active: false, isCompleted: true),
        TaskItem(placement: 1, label: "Börsen", description: "Här kan du låna", active: false, isCompleted: true)
    ]
    
    public func addTask() {
        let newTaskItem = TaskItem(
            placement: tasks.count + 1,
            label: "Random",
            description: "Random description",
            active: tasks[tasks.count - 1].active,
            isCompleted: false
        )
        
        withAnimation(.spring()) {
            tasks.insert(newTaskItem, at: 0)
        }
    }
    
    public func completeTask() {
        if let indexOfActiveTask = tasks.firstIndex(where: { $0.active == true }) {
            tasks[indexOfActiveTask].isCompleted = true
            tasks[indexOfActiveTask].active = false
            
            let nextTaskIndex = indexOfActiveTask - 1
            if tasks.indices.contains(nextTaskIndex) {
                tasks[nextTaskIndex].active = true
            }
        } else {
            return print("Could not get the index of the active task")
        }
    }
    
    public func removeLastTask() {
        withAnimation(.spring()) {
            self.tasks.removeFirst()
        }
    }
}
