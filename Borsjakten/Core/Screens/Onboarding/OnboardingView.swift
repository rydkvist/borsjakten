import SwiftUI

struct OnboardingView: View {
    @EnvironmentObject private var authVM: AuthViewModel
    @StateObject var onboardingVM = OnboardingViewModel()
    @State private var isSigningWithAuth = false

    private func onPressBottomButton() {
        Task {
            await onboardingVM.onPressNext()

            if onboardingVM.onboardingState == .password && !onboardingVM.password.isEmpty {
                await signWithAuth()
            }
        }
    }

    private func onPressSignInButton() {
        Task {
            await onboardingVM.onPressNext(willSignIn: true)
        }
    }

    @MainActor
    private func signWithAuth() async {
        isSigningWithAuth = true

        if let email = onboardingVM.savedEmail {
            if onboardingVM.willSignIn {
                await authVM.signInWith(email: email, password: onboardingVM.password)
            } else {
                await authVM.signUpWith(email: email, password: onboardingVM.password)
                await authVM.updateUser(name: onboardingVM.username)
            }

            onboardingVM.signingErrorText = authVM.authErrorMessage
        }

        isSigningWithAuth = false
    }

    private var bottomButtonView: some View {
        VStack(spacing: 24) {
            if onboardingVM.onboardingState == .landing {
                Button(action: onPressSignInButton) {
                    Text("Already have an account? **Sign in here**")
                        .foregroundColor(.white)
                }
            }

            Button(action: onPressBottomButton) {
                Label(onboardingVM.getBottomButtonText(), systemImage: "arrow.forward")
                    .labelStyle(.titleOnly)
                    .font(.headline)
                    .foregroundColor(.blue)
                    .frame(height: 56)
                    .frame(maxWidth: .infinity)
            }
            .background(Color.white)
            .cornerRadius(12)
        }
    }

    private var goBackButtonView: some View {
        Group {
            if onboardingVM.onboardingState != .landing {
                Button(action: onboardingVM.onGoBack) {
                    Image(systemName: "arrow.backward")
                        .font(.headline)
                        .foregroundColor(.blue)
                }
                .frame(width: 40, height: 40)
                .background(Color.white)
                .cornerRadius(40)
                .padding()
                .transition(.opacity)
            }
        }
        .animation(.easeInOut, value: onboardingVM.onboardingState)
    }

    private var onboardingTransition: AnyTransition {
        onboardingVM.onboardingDirection == .backward ? .onboardingSlideBackward : .onboardingSlideForward
    }

    var body: some View {
        ZStack {
            RadialGradient(
                gradient: Gradient(colors: [.cyan, .accentColor]),
                center: .topLeading,
                startRadius: 5,
                endRadius: .screenHeight
            )
                .ignoresSafeArea()

            ZStack {
                switch onboardingVM.onboardingState {
                case .landing:
                    OnboardingLandingView()
                        .transition(onboardingTransition)
                case .username:
                    OnboardingUsernameView(onboardingVM: onboardingVM)
                        .transition(onboardingTransition)
                case .email:
                    OnboardingEmailView(onboardingVM: onboardingVM)
                        .transition(onboardingTransition)
                case .password:
                    OnboardingPasswordView(onboardingVM: onboardingVM, signWithAuth: signWithAuth)
                        .transition(onboardingTransition)
                }
            }
            .animation(.spring(), value: onboardingVM.onboardingState)

            VStack(spacing: 0) {
                Spacer()

                bottomButtonView
            }
            .padding(32)
        }
        .overlay(alignment: .topLeading) {
            goBackButtonView
        }
        .overlay(alignment: .center) {
            if isSigningWithAuth {
                Color.black.opacity(0.4)
                    .ignoresSafeArea()

                ProgressView()
                    .scaleEffect(2)
                    .tint(.white)
            }
        }
    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
    }
}
