import SwiftUI

struct TaskCircle: View {
    var task: TaskItem
    var direction: TaskDirection
    
    private func getDirectionSize() -> CGSize {
        if direction == .up {
            return CGSize(width: .directionWidth, height: .directionHeight)
        }
        return CGSize(width: .directionHeight, height: .directionWidth)
    }
    
    private func getDirectionOffset() -> CGSize {
        var offset: CGSize = CGSize(width: 0, height: 0)
        if direction == .left {
            offset.width -= .directionWidth * 2
            offset.height = 0
        } else if direction == .right {
            offset.width = .directionWidth * 2
            offset.height = 0
        } else {
            offset.width = 0
            offset.height -= .directionWidth * 2
        }
        return offset
    }
    
    private func emptyFunc() {
        
    }
    
    var body: some View {
        ZStack {
            Rectangle()
                .fill(task.isCompleted ? .blue : .blue.opacity(0.16))
                .frame(
                    width: getDirectionSize().width,
                    height: getDirectionSize().height,
                    alignment: .center
                )
                .border(.blue, width: 1)
                .offset(getDirectionOffset())
                .opacity(direction == .fake ? 0 : 1)
            
            if direction == .fake {
                Button("", action: emptyFunc)
                    .buttonStyle(TaskButtonStyle(isCompleted: task.isCompleted))
                    .opacity(0)
            } else {
                NavigationLink(destination: TaskDetailView(task: task)) {
                    Text(String(task.placement))
                }
                .buttonStyle(TaskButtonStyle(isCompleted: task.isCompleted))
            }
        }
        .padding(8)
    }
}

enum TaskDirection: String {
    case up
    case right
    case left
    case fake
}


struct FakeTaskCircle: View {
    let fakeTask: TaskItem = TaskItem(
        placement: -1,
        label: "",
        description: "",
        active: false,
        isCompleted: false
    )
    
    var body: some View {
        TaskCircle(task: fakeTask, direction: .fake)
    }
}

//struct TaskCircle_Previews: PreviewProvider {
//    static var previews: some View {
//        VStack {
//            HStack {
//                TaskCircle(
//                    task: TaskItem(label: "6", description: "walla"),
//                    direction: .up
//                )
//                TaskCircle(
//                    task: TaskItem(label: "5", description: "walla"),
//                    direction: .left
//                )
//                TaskCircle(
//                    task: TaskItem(label: "4", description: "walla"),
//                    direction: .left
//                )
//            }
//
//            HStack {
//                FakeTaskCircle()
//                TaskCircle(
//                    task: TaskItem(label: "2", description: "walla"),
//                    direction: .right
//                )
//                TaskCircle(
//                    task: TaskItem(label: "3", description: "walla"),
//                    direction: .up
//                )
//            }
//
//            HStack {
//                FakeTaskCircle()
//                TaskCircle(
//                    task: TaskItem(label: "1", description: "walla"),
//                    direction: .up
//                )
//                FakeTaskCircle()
//            }
//        }
//    }
//}
