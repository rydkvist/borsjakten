import SwiftUI

struct SettingsView: View {
    @EnvironmentObject var authModel: AuthModel
    
    var body: some View {
        VStack {
            Text("Settings page")

            Image(systemName: "gear")
                .resizable()
                .frame(width: .minButtonSize, height: .minButtonSize, alignment: .center)
            
            if authModel.user?.uid != nil {
                Button("Logout", action: authModel.onSignOut)
                    .buttonStyle(BorderedButtonStyle())
                    .padding(.top)
            } else {
                Text("You can log out whenever you have signed in with an account")
            }
           
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
