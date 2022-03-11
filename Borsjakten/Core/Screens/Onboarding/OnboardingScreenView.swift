import SwiftUI

struct OnboardingScreenView<Content>: View where Content: View {
    let content: () -> Content
    let isLandingView: Bool

    init(isLandingView: Bool = false, @ViewBuilder content: @escaping () -> Content) {
        self.content = content
        self.isLandingView = isLandingView
    }

    var body: some View {
        VStack(alignment: isLandingView ? .center : .leading, spacing: 20) {
            if isLandingView {
                Spacer()

                content()

                Spacer()
                Spacer()
            } else {
                content()

                Spacer()
            }
        }
        .padding(28)
        .padding(.top, isLandingView ? 28 : 48)
    }
}

struct OnboardingScreenView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingScreenView {
            Text("Wow!")
        }
    }
}
