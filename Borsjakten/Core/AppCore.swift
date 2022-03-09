import SwiftUI
import UIKit

@main
struct AppCore: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    @StateObject private var authVM = AuthViewModel()
    @StateObject private var tasksVM = TasksViewModel()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .onAppear(perform: authVM.setAuthState)
                .onDisappear(perform: authVM.removeAuthState)
                .environmentObject(authVM)
                .environmentObject(tasksVM)
        }
    }
}
