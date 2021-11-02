import SwiftUI
import FirebaseAuth

struct ContentView: View {
    @StateObject var taskModel = TaskModel()
    @StateObject var authModel = AuthModel()
    @State var selectedTab: Tabs = .home
    
    var body: some View {
        NavigationView {
            TabView(selection: $selectedTab) {
                HomeView(taskModel: taskModel)
                    .tabItem {
                        Label("Home", systemImage: "house")
                    }
                    .tag(Tabs.home)
                
                SignInView()
                    .tabItem {
                        Label("Login", systemImage: "person")
                    }
                    .tag(Tabs.login)
                
                SignUpView()
                    .tabItem {
                        Label("Register", systemImage: "pencil.circle")
                    }
                    .tag(Tabs.register)
                
                SettingsView()
                    .tabItem {
                        Label("Settings", systemImage: "gear")
                    }
                    .tag(Tabs.settings)
            }
        }
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
    static var previews: some View {
        ContentView()
    }
}
