import SwiftUI

class TasksViewModel: ObservableObject {
    @AppStorage("tasks") var tasks: [TaskResponse] = mockedTasks
    @Published var amountOfCompletedTasks: Int = 0

    func updateCompletedTasks() {
        amountOfCompletedTasks = tasks.filter({ $0.status == .completed }).count
    }

    func addTask() {
        let newTaskItem = TaskResponse(
            placement: tasks.count + 1,
            status: .locked,
            info: .init(title: "Random \(tasks.count + 1)", text: "Random Description")
        )
        
        withAnimation(.spring()) {
            tasks.append(newTaskItem)
        }
    }
    
    func completeTask(_ task: TaskResponse) {
        guard let activeTaskIndex = tasks.firstIndex(where: { $0.id == task.id }) else {
            return
        }

        tasks[activeTaskIndex].status = .completed

        let upcomingTaskIndex = activeTaskIndex + 1
        if tasks.indices.contains(upcomingTaskIndex) {
            tasks[upcomingTaskIndex].status = .active
        }
    }
    
    func removeLastTask() {
        withAnimation(.spring()) {
            _ = self.tasks.removeLast()
        }
    }
}

var mockedTasks: [TaskResponse] = [
    .mockedTask(placement: 1, status: .active, title: "Börsen"),
    .mockedTask(placement: 2, title: "CSN"),
    .mockedTask(placement: 3, title: "Bostäder"),
    .mockedTask(placement: 4, title: "Crypto valutor"),
    .mockedTask(placement: 5, title: "Bolån"),
    .mockedTask(placement: 6),
    .mockedTask(placement: 7),
    .mockedTask(placement: 8),
    .mockedTask(placement: 9),
    .mockedTask(placement: 10),
    .mockedTask(placement: 11),
    .mockedTask(placement: 12),
    .mockedTask(placement: 13),
    .mockedTask(placement: 14),
    .mockedTask(placement: 15),
    .mockedTask(placement: 16),
    .mockedTask(placement: 17),
    .mockedTask(placement: 18),
    .mockedTask(placement: 19),
    .mockedTask(placement: 20),
    .mockedTask(placement: 21),
    .mockedTask(placement: 22),
    .mockedTask(placement: 23),
    .mockedTask(placement: 24),
    .mockedTask(placement: 25)
]
