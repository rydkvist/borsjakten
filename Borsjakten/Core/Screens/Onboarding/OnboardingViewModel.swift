import Foundation

class OnboardingViewModel: ObservableObject {
    @Published var onboardingState: OnboardingState = .landing
    @Published var onboardingDirection: OnboardingDirection = .forward

    @Published var username = ""
    @Published var email = ""
    @Published var password = ""

    @Published var savedUsername: String?
    @Published var savedEmail: String?

    @Published var usernameErrorText: String?
    @Published var emailErrorText: String?
    @Published var passwordErrorText: String?
    @Published var signingErrorText: String?

    @Published var willSignIn: Bool = false

    @MainActor
    func onPressNext(willSignIn: Bool = false) async {
        onboardingDirection = .forward

        switch onboardingState {
        case .landing:

            self.willSignIn = willSignIn

            if self.willSignIn {
                onboardingState = .email
            } else {
                onboardingState = .username
            }
        case .username:
            await validate(userName: username)
        case .email:
            await validate(email: email)
        case .password:
            await validate(password: password)
        }
    }

    func onGoBack() {
        onboardingDirection = .backward

        switch onboardingState {
        case .landing:
            return
        case .username:
            onboardingState = .landing
        case .email:
            if willSignIn {
                onboardingState = .landing
                willSignIn = false
            } else {
                onboardingState = .username
            }
        case .password:
            onboardingState = .email
        }
    }

    private func clearOnboarding() {
        username = ""
        email = ""
        password = ""
    }

    @MainActor
    func validate(userName: String) async {
        guard userName != savedUsername else {
            onboardingState = .email
            return
        }

        if let error = Validations.isValid(username: username) {
            switch error {
            case .isEmpty(let userError):
                usernameErrorText = userError
            case .isTooLong(let userError):
                usernameErrorText = userError
            case .isTooShort(let userError):
                usernameErrorText = userError
            case .isWrongFormat(let userError):
                usernameErrorText = userError
            case .isAlreadyInUse(let userError):
                usernameErrorText = userError
            }
        } else {
            usernameErrorText = nil
            savedUsername = userName
            onboardingState = .email
        }
    }

    @MainActor
    func validate(email: String) async {
        guard email != savedEmail else {
            onboardingState = .password
            return
        }

        if let error = await Validations.isValid(email: email, willSignIn: willSignIn) {
            switch error {
            case .isEmpty(let emailError):
                emailErrorText = emailError
            case .isAlreadyInUse(let emailError):
                emailErrorText = emailError
            case .isWrongFormat(let emailError):
                emailErrorText = emailError
            }
        } else {
            emailErrorText = nil
            savedEmail = email
            onboardingState = .password
        }
    }

    @MainActor
    func validate(password: String) async {
        if let error = Validations.isValid(password: password) {
            switch error {
            case .isEmpty(let passwordError):
                passwordErrorText = passwordError
            case .isTooLong(let passwordError):
                passwordErrorText = passwordError
            case .isTooShort(let passwordError):
                passwordErrorText = passwordError
            }
        } else {
            passwordErrorText = nil
        }
    }

    func getBottomButtonText() -> String {
        if onboardingState == .landing {
            return "Get started"
        } else if onboardingState == .password {
            return "Start the hunt"
        } else {
            return "Next"
        }
    }
}

enum OnboardingState: String {
    case landing
    case username
    case email
    case password
}

enum OnboardingDirection: String {
    case forward, backward
}
