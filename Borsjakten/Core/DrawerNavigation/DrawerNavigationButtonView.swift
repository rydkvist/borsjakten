import SwiftUI

struct DrawerNavigationButtonView: View {
    @EnvironmentObject private var drawerNavigationVM: DrawerNavigationViewModel
    @EnvironmentObject private var authVM: AuthViewModel

    var body: some View {
        Button(action: drawerNavigationVM.toggleDrawer) {
            if let url = URL(string: authVM.imageURL) {
                UserThumbnailView(size: 32, url: url)
            }
        }
    }
}

struct DrawerNavigationButtonView_Previews: PreviewProvider {
    static var previews: some View {
        DrawerNavigationButtonView()
    }
}
