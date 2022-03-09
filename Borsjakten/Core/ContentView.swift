import SwiftUI
import FirebaseAuth

struct ContentView: View {
    @EnvironmentObject private var tasksVM: TasksViewModel

    @State private var selectedTab: Tabs = .home
    @AppStorage("shouldShowOnboarding") var shouldShowOnboarding: Bool = true
    
    var body: some View {
        NavigationView {
            TabView(selection: $selectedTab) {
                HomeView()
                    .tabItem {
                        Label("Home", systemImage: "house")
                    }
                    .tag(Tabs.home)
                
                SettingsView()
                    .tabItem {
                        Label("Settings", systemImage: "gear")
                    }
                    .tag(Tabs.settings)
            }
        }
        .fullScreenCover(isPresented: $shouldShowOnboarding, content: { OnboardingView() })
    }
}

enum Tabs: String {
    case home
    case login
    case register
    case settings
}

struct ContentView_Previews: PreviewProvider {
    static var authVM = AuthViewModel()
    
    static var previews: some View {
        OnboardingView()
            .preferredColorScheme(.dark)
            .environmentObject(authVM)
    }
}
