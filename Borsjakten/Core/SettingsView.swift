import SwiftUI

struct SettingsView: View {
    var body: some View {
        VStack {
            Image(systemName: "gear")
                .resizable()
                .frame(width: .minButtonSize, height: .minButtonSize, alignment: .center)
            
            Text("Settings page")
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
