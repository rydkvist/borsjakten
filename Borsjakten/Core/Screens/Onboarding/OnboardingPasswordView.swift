import SwiftUI

struct OnboardingPasswordView: View {
    @ObservedObject var onboardingVM: OnboardingViewModel
    @FocusState private var isFocused: Bool

    var signWithAuth: () async -> Void

    private func onSubmitCallback() {
        Task {
            await onboardingVM.validate(password: onboardingVM.password)
            await signWithAuth()
        }
    }

    var body: some View {
        OnboardingScreenView {
            Image(systemName: "lock.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 50, height: 50)
                .foregroundColor(.white)

            Text("What's your password?")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundColor(.white)

            VStack(alignment: .leading) {
                SecureField("Enter your password here...", text: $onboardingVM.password)
                    .focused($isFocused)
                    .onSubmit(onSubmitCallback)
                    .modifier(PasswordFieldModifiers())
                    .textFieldStyle(OnboardingTextFieldStyle())

                if let errorText = onboardingVM.passwordErrorText {
                    Text(errorText)
                        .foregroundColor(.red)
                        .font(.body)
                        .fontWeight(.semibold)
                }

                if let errorText = onboardingVM.signingErrorText {
                    Text(errorText)
                        .foregroundColor(.red)
                        .font(.body)
                        .fontWeight(.semibold)
                }
            }
        }
        .onAppear(perform: { isFocused = true })
    }
}

struct OnboardingPasswordView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingPasswordView(onboardingVM: OnboardingViewModel(), signWithAuth: { })
    }
}
