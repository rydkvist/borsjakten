import SwiftUI

struct OnboardingTextFieldStyle: TextFieldStyle {
    func _body(configuration: TextField<Self._Label>) -> some View {
        configuration
            .font(.headline)
            .frame(height: 54)
            .padding(.horizontal, 16)
            .background(Color.white)
            .cornerRadius(12)
            .multilineTextAlignment(.leading)
    }
}
