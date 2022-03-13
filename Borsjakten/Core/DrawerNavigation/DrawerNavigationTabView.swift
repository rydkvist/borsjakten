import SwiftUI

struct DrawerNavigationTabView: View {
    var name: DrawerScreens
    var systemImage: String
    var selectedScreen: DrawerScreens
    var onTap: () -> Void

    private var isSelected: Bool { selectedScreen == name }

    var body: some View {
        Button(action: onTap) {
            HStack {
                Image(systemName: systemImage)
                    .font(.title3)

                Text(name.rawValue)
                    .fontWeight(isSelected ? .semibold : .regular)

                Spacer()
            }
            .foregroundColor(isSelected ? .black : .white)
            .padding(.horizontal)
            .padding(.vertical, 12)
            .background(
                ZStack {
                    if isSelected {
                        Color.white
                            .cornerRadius(12)
                    } else {
                        Color.clear
                    }
                }
            )
            .cornerRadius(12)
        }
    }
}

struct DrawerNavigationTabView_Previews: PreviewProvider {
    static var previews: some View {
        DrawerNavigationTabView(
            name: .portfolio,
            systemImage: "case",
            selectedScreen: .portfolio,
            onTap: { }
        )
    }
}
