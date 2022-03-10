import SwiftUI

struct TaskItemView: View {
    var task: TaskResponse

    private var direction: TaskDirection {
        if task.placement == 1 {
            return .up
        } else if task.placement == 2 {
            return .right
        } else if task.placement % 3 == 0 {
            return .up
        } else if task.placement % 3 == 1 {
            return .left
        } else {
            return .left
        }
    }

    private var rectangleColor: Color {
        switch task.status {
        case .completed:
            return .blue
        case .active:
            return .blue.opacity(0.16)
        case .locked:
            return .blue.opacity(0.16)
        }
    }

    private var rectangleSize: CGSize {
        if direction == .up {
            return CGSize(width: .taskDirectionWidth, height: .taskDirectionHeight)
        } else {
            return CGSize(width: .taskDirectionHeight, height: .taskDirectionWidth)
        }
    }

    private var rectangleOffset: CGSize {
        var offset = CGSize(width: 0, height: 0)

        if direction == .left {
            offset.width -= .taskDirectionWidth * 2
            offset.height = 0
        } else if direction == .right {
            offset.width = .taskDirectionWidth * 2
            offset.height = 0
        } else {
            offset.width = 0
            offset.height -= .taskDirectionWidth * 2
        }

        return offset
    }

    private var circleBackgroundColor: Color {
        switch task.status {
        case .completed:
            return .blue
        case .active:
            return .white
        case .locked:
            return .blue.opacity(0.16)
        }
    }

    private var circleBorderColor: Color {
        switch task.status {
        case .completed:
            return .blue
        case .active:
            return .blue
        case .locked:
            return .blue.opacity(0.16)
        }
    }

    var body: some View {
        ZStack {
            Rectangle()
                .fill(rectangleColor)
                .frame(width: rectangleSize.width, height: rectangleSize.height)
                .offset(rectangleOffset)

            NavigationLink(destination: TaskDetailView(task: task)) {
                ZStack {
                    Circle()
                        .fill(circleBackgroundColor)
                        .frame(width: .minButtonSize, height: .minButtonSize)

                    Circle()
                        .strokeBorder(circleBorderColor, lineWidth: 4, antialiased: false)

                    if task.status == .completed {
                        Image(systemName: "checkmark")
                            .foregroundColor(.white)
                    } else if task.status == .active {
                        Image(systemName: "play.fill")
                            .foregroundColor(.blue)
                    } else if task.status == .locked {
                        Image(systemName: "lock.fill")
                            .foregroundColor(.gray)
                            .rotationEffect(.degrees(25))
                    }
                }
                .font(.body)
            }
            .buttonStyle(.plain)
        }
        .padding(.top, .taskDirectionHeight)
    }
}

enum TaskDirection: String {
    case up
    case right
    case left
}

struct TaskItemView_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            HStack {
                TaskItemView(task: .mockedTask(placement: 5))
                TaskItemView(task: .mockedTask(placement: 6))
                TaskItemView(task: .mockedTask(placement: 7))
            }
            HStack {
                TaskItemView(task: .mockedTask(placement: 4))
                TaskItemView(task: .mockedTask(placement: 3))
                TaskItemView(task: .mockedTask(placement: 2))
            }
        }
    }
}
