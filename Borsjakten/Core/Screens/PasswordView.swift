import SwiftUI
import FirebaseAuth

struct PasswordView: View {
    @EnvironmentObject var authModel: AuthModel
    @State private var password: String = ""
    var isLoginPassword: Bool = false
    
    private func validatePassword() {
        if !password.isEmpty {
            if password.count >= 8 && password.count <= 128 {
                authModel.onboardingCredentials.password = password
                if isLoginPassword {
                    authModel.onSignIn(email: authModel.onboardingCredentials.email, password: authModel.onboardingCredentials.password)
                } else {
                    authModel.onSignUp(email: authModel.onboardingCredentials.email, password: authModel.onboardingCredentials.password)
                }
            }
        }
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            PasswordSigningView(password: $password)
                .onSubmit { validatePassword() }
                .padding(.bottom)
            
            if isLoginPassword {
                Text("Make sure to at least have **8 characters** in your password")
                    .font(.body)
                    .padding(.bottom, 32)
            }
            
            Button(isLoginPassword ? "Sign in" : "Sign up", action: validatePassword)
                .buttonStyle(PrimaryButtonStyle(buttonText: $password))
                .disabled(password.isEmpty)
            
            Spacer()
        }
        .padding(.top, 32)
        .padding(.horizontal)
        .navigationTitle("Password")
    }
}

