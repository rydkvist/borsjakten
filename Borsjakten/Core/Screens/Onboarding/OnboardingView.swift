import SwiftUI

struct OnboardingView: View {
    @State var selectedTab: OnboardingTabs = .landing
    
    var body: some View {
        NavigationView {
            TabView(selection: $selectedTab) {
                LandingView()
                    .tag(OnboardingTabs.landing)
                
                EmailView()
                    .tag(OnboardingTabs.email)
                
                PasswordView()
                    .tag(OnboardingTabs.password)
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
        }
    }
}

enum OnboardingTabs: String {
    case landing
    case email
    case password
    case username
}
