import Foundation
import FirebaseAuth

final class Validations {
    private init() { }

    enum EmailError {
        case isEmpty(_ errorText: String)
        case isAlreadyInUse(_ errorText: String)
        case isWrongFormat(_ errorText: String)
    }

    enum PasswordError {
        case isEmpty(_ errorText: String)
        case isTooLong(_ errorText: String)
        case isTooShort(_ errorText: String)
    }

    enum UsernameError {
        case isEmpty(_ errorText: String)
        case isTooLong(_ errorText: String)
        case isTooShort(_ errorText: String)
        case isWrongFormat(_ errorText: String)
        case isAlreadyInUse(_ errorText: String)
    }

    static var maxPasswordLength = 128
    static var minPasswordLength = 8

    static var maxUsernameLength = 30
    static var minUsernameLength = 3

    static func isValid(email: String, willSignIn: Bool = false) async -> EmailError? {
        if isTextEmpty(email) {
            return EmailError.isEmpty("Enter an e-mail")
        } else if !isValidRegexFor(email: email) {
            return EmailError.isWrongFormat("Enter a valid e-mail format")
        } else if !willSignIn, await isExisting(email: email) {
            return EmailError.isAlreadyInUse("That e-mail is already in use")
        }

        return nil
    }

    static func isValid(password: String) -> PasswordError? {
        if isTextEmpty(password) {
            return PasswordError.isEmpty("Enter a password")
        } else if isTextTooShort(password, minLimit: minPasswordLength) {
            return PasswordError.isTooShort("Your password needs to be at least \(minPasswordLength) characters long")
        } else if isTextTooLong(password, maxLimit: maxPasswordLength) {
            return PasswordError.isTooShort("Your password needs to be \(maxPasswordLength) characters or less")
        }

        return nil
    }

    static func isValid(username: String) -> UsernameError? {
        if isTextEmpty(username) {
            return UsernameError.isEmpty("Enter a username")
        } else if isTextTooShort(username, minLimit: minUsernameLength) {
            return UsernameError.isTooShort("Your username needs to be at least \(minUsernameLength) characters long")
        } else if isTextTooLong(username, maxLimit: maxUsernameLength) {
            return UsernameError.isTooShort("Your username needs to be \(maxUsernameLength) characters or less")
        } else if !isAlphaNumericOrUnderscoresOrDot(username) {
            return UsernameError.isWrongFormat("Invalid username, try a different one")
        } else if isExisting(username: username) {
            return UsernameError.isAlreadyInUse("That username is already taken")
        }

        return nil
    }
}

func isTextEmpty(_ text: String) -> Bool {
    return text.isEmpty
}

func isTextTooShort(_ text: String, minLimit: Int) -> Bool {
    return text.count < minLimit
}

func isTextTooLong(_ text: String, maxLimit: Int) -> Bool {
    return text.count > maxLimit
}

func isExisting(email: String) async -> Bool {
    do {
        let signInMethods = try await Auth
            .auth()
            .fetchSignInMethods(forEmail: email)

        if signInMethods.isEmpty {
            return false
        } else {
            return true
        }
    } catch {
        print("isExistingEmail error", error.localizedDescription)
        return false
    }
}

func isExisting(username: String) -> Bool {
    // need implementation
    return false
}

func isValidRegexFor(email: String) -> Bool {
    let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"

    let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
    return emailPred.evaluate(with: email)
}

func isAlphaNumericOrUnderscoresOrDot(_ text: String) -> Bool {
    let pattern = #"^[a-zA-Z0-9][a-zA-Z0-9_\.]+[a-zA-Z0-9]$"#
    let result = text.range(of: pattern, options: .regularExpression)
    return result != nil
}
