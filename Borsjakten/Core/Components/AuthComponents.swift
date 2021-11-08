import SwiftUI

struct EmailSigningView: View {
    @Binding var email: String
    
    var body: some View {
        TextField("E-mail", text: $email, prompt: Text("E-mail address"))
            .textInputAutocapitalization(.never)
            .textContentType(.emailAddress)
            .keyboardType(.emailAddress)
            .disableAutocorrection(true)
            .textFieldStyle(UnderlineTextField())
    }
}

struct PasswordSigningView: View {
    @Binding var password: String
    
    var body: some View {
        SecureField("Password", text: $password, prompt: Text("Password"))
            .textInputAutocapitalization(.never)
            .textContentType(.password)
            .disableAutocorrection(true)
            .textFieldStyle(UnderlineTextField())
    }
}


struct UsernameSigningView: View {
    @Binding var username: String
    
    var body: some View {
        TextField("Username", text: $username, prompt: Text("Username"))
            .textInputAutocapitalization(.never)
            .textContentType(.username)
            .disableAutocorrection(true)
            .textFieldStyle(UnderlineTextField())
    }
}


struct UnderlineTextField: TextFieldStyle {
    func _body(configuration: TextField<Self._Label>) -> some View {
        configuration
        
        Divider()
            .padding(.top, -2)
          
    }
}
