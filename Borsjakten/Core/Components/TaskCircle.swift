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
            
            NavigationLink(destination: TaskDetailView(task: task)) {
                Text(String(task.placement))
            }
            .buttonStyle(TaskButtonStyle(isCompleted: task.isCompleted))
        }
    }
}

enum TaskDirection: String {
    case up
    case right
    case left
}

struct TaskCircle_Previews: PreviewProvider {
    static var previews: some View {
        TaskCircle(
            task: TaskItem(placement: 30, label: "Walla", description: "space", active: true, isCompleted: false),
            direction: .up
        )
    }
}
