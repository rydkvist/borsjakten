import SwiftUI

struct TaskButtonStyle: ButtonStyle {
    var status: TaskStatusResponse
        
    private func setBackground(isPressed: Bool) -> Color {
        if status == .completed && isPressed {
            return .blue.opacity(0.82)
        } else if status == .completed {
            return .blue
        } else if status != .completed && isPressed {
            return .white.opacity(0.82)
        } else {
            return .white
        }
    }
    
    func makeBody(configuration: Configuration) -> some View {
        configuration
            .label
            .font(.body)
            .foregroundColor(status == .completed ? .white : .blue)
            .frame(width: .minButtonSize, height: .minButtonSize, alignment: .center)
            .background(setBackground(isPressed: configuration.isPressed))
            .clipShape(Circle())
            .overlay(
                Circle()
                    .stroke(.blue, lineWidth: 4)
            )
    }
}
