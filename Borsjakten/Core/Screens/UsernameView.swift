import SwiftUI

struct UsernameView: View {
    @EnvironmentObject var authModel: AuthModel
    @State private var username: String = ""
    @Environment(\.presentationMode) var presentationMode
    
    private func validateUsername() {
        if !username.isEmpty {
            if username.count >= 2 && username.count < 28 {
                authModel.updateUser(userName: username) {
                    presentationMode.wrappedValue.dismiss()
                }
            }
        }
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            UsernameSigningView(username: $username)
                .onSubmit { validateUsername() }
                .padding(.bottom)
            
            Text("Username needs to be from 2 to 28 characters")
                .font(.body)
                .padding(.bottom, 32)
            
            Button("Change", action: validateUsername)
                .buttonStyle(PrimaryButtonStyle(buttonText: $username))
                .disabled(username.isEmpty)
                .padding(.bottom)
                        
            Spacer()
        }
        .padding(.top, 32)
        .padding(.horizontal)
        .navigationTitle("Username")
    }
}
