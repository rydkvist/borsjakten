import SwiftUI

struct SettingsView: View {
    @EnvironmentObject private var authVM: AuthViewModel

    @State private var displayName = ""
    @State private var email = ""

    private func setFieldValues() {
        if let displayName = authVM.user?.displayName {
            self.displayName = displayName
        }

        if let email = authVM.user?.email {
            self.email = email
        }
    }

    var body: some View {
        NavigationView {
            List {
                Section("Account") {
                    TextField("Name", text: $displayName)
                        .modifier(UsernameFieldModifiers())

                    TextField("E-mail", text: $email)
                        .modifier(EmailFieldModifiers())
                }

                Section("Other") {
                    Button("Logout", role: .destructive, action: { Task { await authVM.signOut() }})
                }
            }
            .onAppear(perform: setFieldValues)
            .navigationTitle(DrawerScreens.settings.rawValue)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    DrawerNavigationButtonView()
                }
            }
        }
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
