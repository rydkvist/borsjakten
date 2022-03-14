import SwiftUI

struct PortfolioBalanceControlsView: View {
    @EnvironmentObject private var portfolioVM: PortfolioViewModel

    var body: some View {
        HStack(spacing: 20) {
            Button(action: { portfolioVM.depositBalance(amount: 1000) }) {
                Label("Deposit balance", systemImage: "plus")
            }
            .buttonStyle(AccentCircleIconButtonStyle())

            Button(action: { portfolioVM.withdrawBalance(amount: 1000) }) {
                Label("Withdraw balance", systemImage: "minus")
            }
            .buttonStyle(AccentCircleIconButtonStyle())
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}

struct AccentCircleIconButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration
            .label
            .font(.title2.weight(.semibold))
            .labelStyle(.iconOnly)
            .foregroundColor(.white)
            .frame(width: .minButtonSize, height: .minButtonSize)
            .background(Color.accentColor)
            .opacity(configuration.isPressed ? 0.7 : 1)
            .scaleEffect(configuration.isPressed ? 1.2 : 1)
            .animation(.spring(), value: configuration.isPressed)
            .clipShape(Circle())
    }
}

struct PortfolioBalanceControlsView_Previews: PreviewProvider {
    static var previews: some View {
        PortfolioBalanceControlsView()
    }
}
