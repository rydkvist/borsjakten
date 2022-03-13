import SwiftUI
import UIKit

@main
struct AppCore: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    @StateObject private var authVM = AuthViewModel()
    @StateObject private var tasksVM = TasksViewModel()
    @StateObject private var drawerNavigationVM = DrawerNavigationViewModel()

    var body: some Scene {
        WindowGroup {
            ZStack {
                ContentView()
                    .environmentObject(authVM)
                    .environmentObject(tasksVM)
                    .environmentObject(drawerNavigationVM)
                    .onDisappear(perform: authVM.removeAuthState)
                    .task { authVM.setAuthState() }

                // TODO: Add LaunchScreen
            }
        }
    }
}
