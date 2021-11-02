import SwiftUI
import FirebaseAuth

struct SignUpView: View {
    @EnvironmentObject var authModel: AuthModel
    
    @State private var email: String = ""
    @FocusState private var isEmailFieldFocused
    
    @State private var password: String = ""
    @FocusState private var isPasswordFieldFocused
    
    private func onTapSignUp() {
        authModel.onSignUp(email: email, password: password)
    }
    
    var body: some View {
        VStack {
            Text("Sign up")
                .font(.headline)
                .padding(.bottom)
            
            Image(systemName: "person.badge.plus")
                .resizable()
                .frame(width: .minButtonSize, height: .minButtonSize, alignment: .center)
            
            if authModel.user?.uid != nil {
                HStack {
                    Text("Your logged in, log out in the settings page")
                    
                    Image(systemName: "checkmark.circle.fill")
                        .foregroundColor(.green)
                }
            } else {
                TextField("E-mail", text: $email, prompt: Text("Email"))
                    .focused($isEmailFieldFocused)
                    .onSubmit {
                        isPasswordFieldFocused = true
                    }
                    .textCase(.lowercase)
                    .textInputAutocapitalization(.never)
                    .textContentType(.emailAddress)
                    .disableAutocorrection(true)
                    .padding()
                    .border(.secondary)
                
                TextField("Password", text: $password, prompt: Text("Password"))
                    .focused($isPasswordFieldFocused)
                    .textInputAutocapitalization(.never)
                    .disableAutocorrection(true)
                    .textContentType(.password)
                    .padding()
                    .border(.secondary)
                
                Text(authModel.signUpErrorMessage)
                    .font(.subheadline)
                    .foregroundColor(.red)
                    .padding(.vertical)
                
                Button("Sign up", action: onTapSignUp)
                    .buttonStyle(BorderedButtonStyle())
                    .padding(.top)
                
                if authModel.isAuthLoading {
                    ProgressView()
                        .progressViewStyle(.circular)
                        .tint(.black)
                }
            }
        }
        .padding()
    }
}
