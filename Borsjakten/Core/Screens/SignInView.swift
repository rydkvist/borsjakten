import SwiftUI

struct SignInView: View {
    @EnvironmentObject var authModel: AuthModel
    
    @State private var email: String = ""
    @State private var password: String = ""
    
    private func onTapSignIn() {
        authModel.onSignIn(email: email, password: password)
    }
    
    var body: some View {
        VStack {
            Text("Sign in page")

            Image(systemName: "person")
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
                .textCase(.lowercase)
                .textInputAutocapitalization(.never)
                .textContentType(.emailAddress)
                .disableAutocorrection(true)
                .padding()
                .border(.secondary)
                
                TextField("Password", text: $password, prompt: Text("Password"))
                .textInputAutocapitalization(.never)
                .disableAutocorrection(true)
                .textContentType(.password)
                .padding()
                .border(.secondary)
                
                Button("Sign in", action: onTapSignIn)
                    .buttonStyle(BorderedButtonStyle())
                    .padding(.top)
                
                if authModel.isAuthLoading {
                    ProgressView()
                        .progressViewStyle(.circular)
                        .tint(.black)
                }
                
            }
        }
    }
}
