import SwiftUI

struct TabNavigationContentView: View {
    @EnvironmentObject private var authVM: AuthViewModel
    @EnvironmentObject private var tasksVM: TasksViewModel

    @State private var selectedTab: Tabs = .home

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
        .fullScreenCover(isPresented: $authVM.shouldShowOnboarding, content: { OnboardingView() })
    }
}

enum Tabs: String {
    case home
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
