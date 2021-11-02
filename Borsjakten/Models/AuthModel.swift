import Foundation
import SwiftUI
import FirebaseAuth

class AuthModel: ObservableObject {
    @Published var user: User? {
        didSet {
            if user?.uid != nil {
                self.isAuthed = true
            } else {
                self.isAuthed = false
            }
        }
    }
    @Published var isAuthed: Bool = false
    @Published var isAuthLoading: Bool = false
    @Published var signUpErrorMessage: String = ""
    @Published var signInErrorMessage: String = ""
   
    @State private var handle: AuthStateDidChangeListenerHandle?
    
    public func onSignUp(email: String, password: String) {
        self.isAuthLoading = true
        
        Auth.auth().createUser(
            withEmail: email,
            password: password
        ) { authResult, error in
            self.handleSigningError(handleFor: .onSignUp, authResult: authResult, error: error)
            guard let user = authResult?.user else { return }
            
            DispatchQueue.main.async {
                self.user = user
                self.sendEmailVerification()
            }
        }
        
        self.isAuthLoading = false
    }
    
    public func onSignIn(email: String, password: String) {
        self.isAuthLoading = true
        
        Auth.auth().signIn(
            withEmail: email,
            password: password
        ) { [weak self] authResult, error in
            guard let strongSelf = self else { return }
            strongSelf.handleSigningError(handleFor: .onSignIn, authResult: authResult, error: error)
            guard let user = authResult?.user else { return }
            
            DispatchQueue.main.async {
                strongSelf.user = user
            }
        }
        self.isAuthLoading = false
    }
    
    public func sendEmailVerification() {
        Auth.auth().currentUser?.sendEmailVerification { error in
            if let error = error {
                print("sendEmailVerification error:", error.localizedDescription)
            }
        }
    }
    
    private func handleSigningError(handleFor: SigningError, authResult: AuthDataResult?, error: Error?) {
        var errorMessage = ""
        
        if let error = error {
            print("\(handleFor.rawValue) error:", error.localizedDescription)
            
            let castedError = error as NSError
            if let firebaseError = AuthErrorCode(rawValue: castedError.code){
                switch(firebaseError) {
                case .invalidEmail:
                    errorMessage = "Invalid e-mail"
                default:
                    print("Firebase Error Code:", castedError.code)
                    errorMessage = error.localizedDescription
                }
            }
        }
        
        if authResult?.user == nil && error == nil {
            errorMessage = "Could not get user information"
        }
        
        if handleFor == .onSignUp {
            return self.signUpErrorMessage = errorMessage
        } else {
            return self.signInErrorMessage = errorMessage
        }
    }
    
    public func onSignOut() {
        let firebaseAuth = Auth.auth()
        do {
            try firebaseAuth.signOut()
            DispatchQueue.main.async { self.user = nil }
        } catch let signOutError as NSError {
            print("onSignOut Error signing out: %@", signOutError)
        }
    }
    
    public func setAuthState() {
        handle = Auth.auth().addStateDidChangeListener { auth, user in
            if let user = user {
                DispatchQueue.main.async {
                    self.user = user
                }
            }
        }
    }
    
    public func removeAuthState() {
        Auth.auth().removeStateDidChangeListener(handle!)
    }
}

enum SigningError: String {
    case onSignIn, onSignUp
}
