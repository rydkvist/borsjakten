import SwiftUI

struct ContentView: View {
    @EnvironmentObject private var authVM: AuthViewModel
    @EnvironmentObject private var drawerNavigationVM: DrawerNavigationViewModel

    init() {
        UITabBar.appearance().isHidden = true
    }

    private var drawerXOffset: CGFloat {
        if drawerNavigationVM.isDrawerOpen {
            return .drawerNavigationWidth / 2
        } else {
            return -(.drawerNavigationWidth / 2)
        }
    }

    var body: some View {
        GeometryReader { reader in
            HStack(spacing: 0) {
                DrawerNavigationView()

                TabView(selection: $drawerNavigationVM.selectedScreen) {
                    PortfolioView()
                        .tag(DrawerScreens.portfolio)

                    StockStudyView()
                        .tag(DrawerScreens.stockStudy)

                    SettingsView()
                        .tag(DrawerScreens.settings)
                }
                .frame(width: reader.size.width)
                .overlay {
                    Color.black
                        .ignoresSafeArea()
                        .opacity(drawerNavigationVM.isDrawerOpen ? 0.7 : 0)
                        .allowsHitTesting(drawerNavigationVM.isDrawerOpen)
                        .onTapGesture(perform: drawerNavigationVM.toggleDrawer)
                }
            }
            .frame(width: reader.size.width)
            .offset(x: drawerXOffset)
            .fullScreenCover(isPresented: $authVM.shouldShowOnboarding, content: { OnboardingView() })
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var authVM = AuthViewModel()
    
    static var previews: some View {
        OnboardingView()
            .preferredColorScheme(.dark)
            .environmentObject(authVM)
    }
}
