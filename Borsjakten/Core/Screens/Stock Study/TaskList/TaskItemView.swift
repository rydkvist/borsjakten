import SwiftUI

struct TaskItemView: View {
    var task: TaskResponse
    var isHidden: Bool = false

    private var direction: TaskDirection {
        if task.placement == 1 {
            return .up
        } else if task.placement == 2 {
            return .right
        } else if task.placement == 3 {
            return .up
        } else if task.placement == 4 {
            return .left
        } else if task.placement == 5 {
            return .left
        } else if task.placement == 6 {
            return .up
        } else if task.placement == 7 {
            return .right
        } else if task.placement == 8 {
            return .right
        } else if task.placement == 9 {
            return .up
        } else {
            return .up
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
        NavigationLink(destination: TaskDetailView(task: task)) {

            ZStack {
                Rectangle()
                    .fill(rectangleColor)
                    .frame(width: rectangleSize.width, height: rectangleSize.height)
                    .offset(rectangleOffset)

                ZStack {
                    Circle()
                        .fill(circleBackgroundColor)

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
                .frame(width: .minButtonSize, height: .minButtonSize)
                .font(.body)

            }
        }
        .buttonStyle(.plain)
        .padding(.top, .taskDirectionHeight)
        .padding(.leading, direction == .left ? .taskDirectionWidth * 2 : 0)
        .padding(.trailing, direction == .right ? .taskDirectionWidth * 2 : 0)
        .opacity(isHidden ? 0 : 1)
        .allowsHitTesting(!isHidden)
    }
}

struct TaskItemView_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            HStack {
                TaskItemView(task: .mockedTask(placement: 9))
                TaskItemView(task: .mockedTask(placement: 8))
                TaskItemView(task: .mockedTask(placement: 7))
            }

            HStack {
                TaskItemView(task: .mockedTask(placement: 6))
                TaskItemView(task: .mockedTask(placement: 5))
                TaskItemView(task: .mockedTask(placement: 4))
            }
        }
    }
}
