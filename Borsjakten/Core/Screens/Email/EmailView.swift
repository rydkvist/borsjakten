import SwiftUI

struct EmailView: View {
    @EnvironmentObject private var authVM: AuthViewModel
    @State private var goToPasswordScreen: Bool = false
    @State private var email: String = ""
    var isLoginEmail: Bool = false
    
    private func validateEmailField() {
        if email == authVM.onboardingCredentials.email {
            goToPasswordScreen = true
            return
        }
        
        if !email.isEmpty {
            if isValidEmailFormat(email) {
                if !isLoginEmail {
                    authVM.isValidEmail(email: email) {
                        goToPasswordScreen = true
                    }
                } else {
                    authVM.onboardingCredentials.email = email
                    goToPasswordScreen = true
                }
               
            } else {
                authVM.emailErrorMessage = "Enter a valid e-mail address"
                goToPasswordScreen = false
            }
        }
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            EmailSigningView(email: $email)
                .onSubmit { validateEmailField() }
                .padding(.bottom)
            
            if !isLoginEmail {
                Text("By continuing, you agree to Börsjakten's **Terms of Service** and confirm that you have read Börsjaktens **Privacy Policy**.")
                    .font(.body)
                    .padding(.bottom, 32)
            }
            
            Button("Next", action: validateEmailField)
                .buttonStyle(PrimaryButtonStyle(buttonText: $email))
                .disabled(email.isEmpty)
            
            if authVM.emailErrorMessage.count > 0 {
                Text(authVM.emailErrorMessage)
                    .font(.subheadline)
                    .foregroundColor(.red)
                    .padding(.vertical)
            }
            
            Spacer()
            
            PasswordView(isLoginPassword: isLoginEmail)
                .navigatePush(when: $goToPasswordScreen)
        }
        .padding(.top, 32)
        .padding(.horizontal)
        .navigationTitle(isLoginEmail ? "Sign in" : "Sign up")
    }
}

private func isValidEmailFormat(_ email: String) -> Bool {
    let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
    
    let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
    return emailPred.evaluate(with: email)
}
