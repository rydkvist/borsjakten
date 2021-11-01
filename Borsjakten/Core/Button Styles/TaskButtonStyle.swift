import SwiftUI

struct TaskButtonStyle: ButtonStyle {
    var isCompleted: Bool
        
    func setBackground(isPressed: Bool) -> Color {
        if isCompleted && isPressed {
            return .blue.opacity(0.82)
        } else if isCompleted {
            return .blue
        } else if isPressed {
            return .white.opacity(0.82)
        } else {
            return .white
        }
    }
    
    func makeBody(configuration: Configuration) -> some View {
        configuration
            .label
            .font(.body)
            .foregroundColor(isCompleted ? .white : .blue)
            .frame(width: .minButtonSize, height: .minButtonSize, alignment: .center)
            .background(setBackground(isPressed: configuration.isPressed))
            .clipShape(Circle())
            .overlay(
                Circle()
                    .stroke(.blue, lineWidth: 4)
            )
    }
}
