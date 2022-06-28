import SwiftUI

struct DrawerNavigationButtonView: View {
    @EnvironmentObject private var drawerNavigationVM: DrawerNavigationViewModel
    @EnvironmentObject private var authVM: AuthViewModel
    
    var body: some View {
        Button(action: drawerNavigationVM.toggleDrawer) {
            UserThumbnailView(size: 32, urlString: authVM.imageURL)
        }
        .id(authVM.imageURL)
    }
}

struct DrawerNavigationButtonView_Previews: PreviewProvider {
    static var previews: some View {
        DrawerNavigationButtonView()
    }
}
