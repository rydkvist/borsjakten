import SwiftUI

struct DrawerNavigationView: View {
    @EnvironmentObject private var drawerNavigationVM: DrawerNavigationViewModel
    @EnvironmentObject private var authVM: AuthViewModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 32) {
            HStack(alignment: .center) {
                UserThumbnailView(size: 64, urlString: authVM.imageURL)
                
                VStack(alignment: .leading, spacing: 4) {
                    Text("Niklas Rydkvist")
                        .foregroundColor(.white)
                    
                    Text("@niklas")
                        .foregroundColor(.white.opacity(0.8))
                }
            }
            
            VStack(spacing: 16) {
                DrawerNavigationTabView(
                    name: .portfolio,
                    systemImage: "case",
                    selectedScreen: drawerNavigationVM.selectedScreen,
                    onTap: { drawerNavigationVM.setSelected(screen: .portfolio) }
                )
                
                DrawerNavigationTabView(
                    name: .stockStudy,
                    systemImage: "graduationcap",
                    selectedScreen: drawerNavigationVM.selectedScreen,
                    onTap: { drawerNavigationVM.setSelected(screen: .stockStudy) }
                )
                
                DrawerNavigationTabView(
                    name: .settings,
                    systemImage: "gear",
                    selectedScreen: drawerNavigationVM.selectedScreen,
                    onTap: { drawerNavigationVM.setSelected(screen: .settings) }
                )
            }
            
            Spacer()
        }
        .padding(.horizontal)
        .padding(.top, 32)
        .frame(width: .drawerNavigationWidth)
        .background(
            RadialGradient(
                gradient: Gradient(colors: [.accentColor]),
                center: .topLeading,
                startRadius: 5,
                endRadius: .screenHeight
            )
            .ignoresSafeArea(.all, edges: .vertical)
        )
    }
}

struct DrawerNavigationView_Previews: PreviewProvider {
    static var previews: some View {
        DrawerNavigationView()
    }
}
