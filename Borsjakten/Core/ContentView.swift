import SwiftUI

enum Tabs: String {
    case home
    case settings
}

struct ContentView: View {
    @StateObject var taskModel = TaskModel()
    @State var selectedTab: Tabs = .home
    
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
            .navigationTitle(selectedTab.rawValue.capitalized)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
