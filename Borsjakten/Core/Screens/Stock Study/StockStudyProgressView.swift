import SwiftUI

struct StockStudyProgressView: View {
    var completedTasks: Int
    var amountOfTasks: Int

    private var rankName: String {
        if completedTasks >= 25 {
            return "Trader"
        } else if completedTasks >= 20 {
            return "Clerk"
        } else if completedTasks >= 10 {
            return "Investor"
        } else if completedTasks >= 3 {
            return "Saver"
        } else {
            return "Beginner"
        }
    }

    private var progressAmountText: String {
        return "\(completedTasks) / \(amountOfTasks)"
    }

    var body: some View {
        VStack(spacing: 8) {
            HStack {
                Text(rankName)
                    .foregroundColor(.primary)
                    .fontWeight(.semibold)

                Spacer()

                Text(progressAmountText)
                    .foregroundColor(.secondary)
            }
            .textCase(.uppercase)
            .font(.caption.weight(.semibold))

            ProgressView(value: CGFloat(completedTasks), total: CGFloat(amountOfTasks))
                .animation(.linear, value: completedTasks)
                .progressViewStyle(.linear)
                .tint(.accentColor)
        }
        .frame(maxWidth: .infinity)
        .padding()
        .background(.thinMaterial)
        .cornerRadius(16)
        .shadow(radius: 4)
        .padding(.horizontal, 24)
    }
}

struct StockStudyProgressView_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            StockStudyProgressView(completedTasks: 4, amountOfTasks: 25)
        }
        .frame(width: .screenWidth, height: .screenHeight)
        .preferredColorScheme(.dark)
    }
}
