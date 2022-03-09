import SwiftUI

struct SettingsView: View {
    @EnvironmentObject private var authVM: AuthViewModel
    
    func getWelcomeText() -> String {
        var welcomeText: String = "Hey there!"
        if authVM.isAuthed {
            let userName = authVM.user?.displayName ?? "BUG"
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
                        Button("Logout", action: authVM.onSignOut)
                    }
                }
            }
        }
        .navigationTitle(getWelcomeText())
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var authVM = AuthViewModel()
    
    static var previews: some View {
        NavigationView {
            SettingsView()
                .environmentObject(authVM)
        }
        
    }
}
