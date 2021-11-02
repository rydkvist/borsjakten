import SwiftUI

struct HomeView: View {
    @ObservedObject var taskModel: TaskModel
    
    private func getTaskDirection(_ placement: Int) -> TaskDirection {
        if placement == 1 {
            return .up
        } else if placement == 2 {
            return .right
        } else if placement % 3 == 0 {
            return .up
        } else if placement % 3 == 1 {
            return .left
        } else {
            return .left
        }
    }
    
    var body: some View {
        VStack {
            ScrollView(.vertical, showsIndicators: false){
                ForEach(taskModel.tasks, id:\.id){ task in
                    NavigationLink(destination: TaskDetailView(task: task)) {
                        TaskCircle(task: task, direction: getTaskDirection(task.placement))
                    }
                }
            }
            
            HStack {
                Button("Add new task", action: taskModel.addTask)
                Button("Completed current task", action: taskModel.completeTask)
                Button("Remove last task", action: taskModel.removeLastTask)
            }
            .padding(.bottom)
        }
    }
}


