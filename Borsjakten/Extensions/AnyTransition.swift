import Foundation
import SwiftUI

extension AnyTransition {
    static var onboardingSlideForward: AnyTransition {
        return .asymmetric(insertion: .move(edge: .trailing), removal: .move(edge: .leading))
    }

    static var onboardingSlideBackward: AnyTransition {
        return .asymmetric(insertion: .move(edge: .leading), removal: .move(edge: .trailing))
    }
}
