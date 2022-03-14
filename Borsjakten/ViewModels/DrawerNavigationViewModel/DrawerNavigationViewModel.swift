import Foundation
import SwiftUI

class DrawerNavigationViewModel: ObservableObject {
    @Published var selectedScreen: DrawerScreens = .portfolio
    @Published private(set) var isDrawerOpen = false

    func setSelected(screen: DrawerScreens) {
        selectedScreen = screen
        toggleDrawer()
    }

    func toggleDrawer() {
        withAnimation(.easeInOut) {
            isDrawerOpen.toggle()
        }
    }
}

enum DrawerScreens: String {
    case portfolio = "Portfolio"
    case stockStudy = "Stock Study"
    case settings = "Settings"
}
