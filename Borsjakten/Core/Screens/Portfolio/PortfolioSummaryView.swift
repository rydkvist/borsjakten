import SwiftUI

struct PortfolioSummaryView: View {
    @EnvironmentObject private var portfolioVM: PortfolioViewModel
    
    var body: some View {
        HStack(spacing: 8) {
            VStack(alignment: .leading, spacing: 2) {
                Text("Your balance")
                    .font(.footnote)
                    .fontWeight(.semibold)
                    .foregroundColor(.secondary)

                Text(String(format: "$%.2f", portfolioVM.balance))
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.primary)
            }

            Spacer()

//            GraphView()
        }
    }
}

struct PortfolioSummaryView_Previews: PreviewProvider {
    static var previews: some View {
        PortfolioSummaryView()
    }
}
