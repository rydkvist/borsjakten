import SwiftUI

struct OnboardingEmailView: View {
    @ObservedObject var onboardingVM: OnboardingViewModel
    @FocusState private var isFocused: Bool

    var body: some View {
        OnboardingScreenView {
            Image(systemName: "envelope.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 50, height: 50)
                .foregroundColor(.white)
            
            Text("What's your e-mail?")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundColor(.white)

            VStack(alignment: .leading) {
                TextField("Enter your e-mail here...", text: $onboardingVM.email)
                    .focused($isFocused)
                    .onSubmit {
                        Task {
                            await onboardingVM.validate(email: onboardingVM.email)
                        }
                    }
                    .modifier(EmailFieldModifiers())
                    .textFieldStyle(OnboardingTextFieldStyle())

                if let errorText = onboardingVM.emailErrorText {
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

struct OnboardingEmailView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingEmailView(onboardingVM: OnboardingViewModel())
    }
}
