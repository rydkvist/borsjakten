import SwiftUI

struct HomeInfoHelpView: View {
    var body: some View {
        VStack(spacing: 16) {
            Divider()
                .padding(.horizontal, 16)

            Text("Genom enkla, lärorika och roliga nivåer kommer du att lära dig allt du behöver för att göra ditt bästa på börsen.")
                .multilineTextAlignment(.center)
                .padding(.horizontal, 24)
                .font(.body)
                .foregroundColor(.secondary)
        }
        .padding(.vertical, 24)
    }
}

struct HomeInfoHelpView_Previews: PreviewProvider {
    static var previews: some View {
        HomeInfoHelpView()
    }
}
