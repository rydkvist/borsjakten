import SwiftUI
import FirebaseAuth

class AuthViewModel: ObservableObject {
    @Published var user: User? {
        didSet {
            isAuthed = user?.uid != nil
        }
    }
    @Published var isAuthed = false
    @Published var authErrorMessage: String?
    @AppStorage("shouldShowOnboarding") var shouldShowOnboarding: Bool = true

    @AppStorage("storedProfileImageURL") var imageURL = ""

    @State private var handle: AuthStateDidChangeListenerHandle?

    @MainActor
    func signUpWith(email: String, password: String) async {
        authErrorMessage = ""

        do {
            let response = try await Auth
                .auth()
                .createUser(withEmail: email, password: password)

            await sendEmailVerification()

            user = response.user
        } catch {
            // I don't know why, but I got the runtime error even though I have MainActor
            DispatchQueue.main.async {
                self.authErrorMessage = self.getFirebaseErrorMessage(label: "signUpWith", error: error)
            }
        }
    }

    @MainActor
    func signInWith(email: String, password: String) async {
        authErrorMessage = ""
        do {
            let response = try await Auth
                .auth()
                .signIn(withEmail: email, password: password)

            user = response.user
        } catch {
            // I don't know why, but I got the runtime error even though I have MainActor
            DispatchQueue.main.async {
                self.authErrorMessage = self.getFirebaseErrorMessage(label: "signInWith", error: error)
            }
        }
    }

    @discardableResult
    private func getFirebaseErrorMessage(label: String, error: Error?) -> String? {
        print("\(label) error:", error?.localizedDescription as Any)

        guard let error = error else {
            return nil
        }

        var errorString = ""

        let castedError = error as NSError
        if let firebaseError = AuthErrorCode(rawValue: castedError.code){
            switch(firebaseError) {
            case .invalidEmail:
                errorString = "Invalid e-mail"
            case .userNotFound:
                errorString = "The user doesn't exists"
            default:
                print("Firebase Error Code:", castedError.code)
                errorString = error.localizedDescription
            }
        }

        return errorString
    }

    @MainActor
    func signOut() async {
        do {
            try Auth.auth().signOut()
            user = nil
            shouldShowOnboarding = true
        } catch {
            getFirebaseErrorMessage(label: "signOut", error: error)
        }
    }

    @MainActor
    func sendEmailVerification() async {
        do {
            try await Auth.auth().currentUser?.sendEmailVerification()
        } catch {
            getFirebaseErrorMessage(label: "sendEmailVerification", error: error)
        }
    }

    @MainActor
    func updateUser(name: String) async {
        let changeRequest = Auth.auth().currentUser?.createProfileChangeRequest()
        changeRequest?.displayName = name

        do {
            try await changeRequest?.commitChanges()
            setAuthState()
        } catch {
            getFirebaseErrorMessage(label: "updateUser", error: error)
        }
    }

    @MainActor
    func setAuthState() {
        print("setAuthState..")
        handle = Auth.auth().addStateDidChangeListener { auth, user in
            print("will change user")
            if let user = user {
                print("user = user", user, user.email, user.displayName)
                if self.shouldShowOnboarding {
                    self.shouldShowOnboarding = false
                }
                self.user = user
            } else {
                self.shouldShowOnboarding = true
            }
        }
    }

    func removeAuthState() {
        if handle != nil {
            Auth.auth().removeStateDidChangeListener(handle!)
        }
    }
}
