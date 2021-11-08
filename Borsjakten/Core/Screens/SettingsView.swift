import SwiftUI

struct SettingsView: View {
    @EnvironmentObject var authModel: AuthModel
    
    func getWelcomeText() -> String {
        var welcomeText: String = "Hey there!"
        if authModel.isAuthed {
            let userName = authModel.user?.displayName ?? "BUG"
            welcomeText = "Hey there \(userName)!"
        }
        return welcomeText
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            Form {
                Section {
                    List {
                        NavigationLink("Change username", destination: UsernameView())
                        Button("Logout", action: authModel.onSignOut)
                    }
                }
            }
        }
        .navigationTitle(getWelcomeText())
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var authModel: AuthModel = AuthModel()
    
    static var previews: some View {
        NavigationView {
            SettingsView()
                .environmentObject(authModel)
        }
        
    }
}
