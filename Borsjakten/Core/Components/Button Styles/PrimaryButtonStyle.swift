import SwiftUI

struct PrimaryButtonStyle: ButtonStyle {
    @Binding var buttonText: String
    
    func makeBody(configuration: Configuration) -> some View {
        configuration
            .label
            .padding(.vertical, 12)
            .frame(maxWidth: .infinity)
            .foregroundColor(buttonText.isEmpty ? .gray : .white)
            .background(buttonText.isEmpty ? Color.primary.opacity(0.15) : .blue)
            .opacity(configuration.isPressed ? 0.75 : 1)
            .cornerRadius(4)
    }
}
