import SwiftUI

struct HomeView: View {
    @EnvironmentObject private var taskModel: TasksViewModel
    
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
    
    let gridColumns: [GridItem] = [
        GridItem(.flexible(minimum: .taskButtonSize), spacing: 0, alignment: .center),
        GridItem(.flexible(minimum: .taskButtonSize), spacing: 0, alignment: .center),
        GridItem(.flexible(minimum: .taskButtonSize), spacing: 0, alignment: .center)
    ]
    
    var body: some View {
        VStack {
            LazyVGrid(columns: gridColumns, alignment: .center, spacing: 0, content: {
                ForEach(taskModel.tasks, id:\.id){ task in
                    NavigationLink(destination: TaskDetailView(task: task)) {
                        TaskCircle(task: task, direction: getTaskDirection(task.placement))
                    }
                    .padding(.top, .directionHeight)
                }
            })
            .padding(.horizontal)
            
            
            HStack {
                Button("Add new task", action: taskModel.addTask)
                Button("Completed current task", action: taskModel.completeTask)
                Button("Remove last task", action: taskModel.removeLastTask)
            }
            .padding(.bottom)
        }
    }
}


