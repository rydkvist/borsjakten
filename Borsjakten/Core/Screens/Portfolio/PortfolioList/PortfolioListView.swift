import SwiftUI

struct PortfolioListView: View {
    @ObservedObject var portfolioVM: PortfolioViewModel

    var body: some View {
        LazyVStack(alignment: .leading, spacing: 20) {
            Text("Watchlist")
                .font(.title3)
                .fontWeight(.semibold)

            ForEach(portfolioVM.stocks) { stock in
                NavigationLink(destination: StockView(stock: stock)) {
                    PortfolioListRowView(item: stock)
                }
            }
        }
    }
}

struct PortfolioListView_Previews: PreviewProvider {
    static var previews: some View {
        PortfolioListView(portfolioVM: PortfolioViewModel())
    }
}
