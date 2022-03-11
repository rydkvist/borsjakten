import SwiftUI

struct OnboardingUsernameView: View {
    @ObservedObject var onboardingVM: OnboardingViewModel
    @FocusState private var isFocused: Bool

    var body: some View {
        OnboardingScreenView {
            Image(systemName: "square.and.pencil")
                .resizable()
                .scaledToFit()
                .frame(width: 50, height: 50)
                .foregroundColor(.white)

            Text("What's your username?")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundColor(.white)

            VStack(alignment: .leading) {
                TextField("Enter your username here...", text: $onboardingVM.username)
                    .focused($isFocused)
                    .onSubmit {
                        Task {
                            await onboardingVM.validate(userName: onboardingVM.username)
                        }
                    }
                    .modifier(UsernameFieldModifiers())
                    .textFieldStyle(OnboardingTextFieldStyle())

                if let errorText = onboardingVM.usernameErrorText {
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

struct UsernameView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingUsernameView(onboardingVM: OnboardingViewModel())
    }
}
