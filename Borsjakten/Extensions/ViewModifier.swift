import SwiftUI

struct UsernameFieldModifiers: ViewModifier {
    func body(content: Content) -> some View {
        content
            .textInputAutocapitalization(.never)
            .textContentType(.username)
            .disableAutocorrection(true)
    }
}

struct EmailFieldModifiers: ViewModifier {
    func body(content: Content) -> some View {
        content
            .textInputAutocapitalization(.never)
            .textContentType(.emailAddress)
            .keyboardType(.emailAddress)
            .disableAutocorrection(true)
    }
}

struct PasswordFieldModifiers: ViewModifier {
    func body(content: Content) -> some View {
        content
            .textInputAutocapitalization(.never)
            .textContentType(.password)
            .disableAutocorrection(true)
    }
}
