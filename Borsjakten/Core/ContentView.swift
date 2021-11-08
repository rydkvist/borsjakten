import SwiftUI
import FirebaseAuth

struct ContentView: View {
    @StateObject var taskModel = TaskModel()
    @StateObject var authModel = AuthModel()
    @State var selectedTab: Tabs = .home
    @AppStorage("shouldShowOnboarding") var shouldShowOnboarding: Bool = true
    
    var body: some View {
        NavigationView {
            TabView(selection: $selectedTab) {
                HomeView(taskModel: taskModel)
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
        .environmentObject(authModel)
        .onAppear(perform: authModel.setAuthState)
        .onDisappear(perform: authModel.removeAuthState)
    }
}

enum Tabs: String {
    case home
    case login
    case register
    case settings
}

struct ContentView_Previews: PreviewProvider {
    static var authModel: AuthModel = AuthModel()
    
    static var previews: some View {
        OnboardingView()
            .preferredColorScheme(.dark)
            .environmentObject(authModel)
    }
}
