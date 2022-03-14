import SwiftUI

struct PortfolioListView: View {
    @EnvironmentObject private var portfolioVM: PortfolioViewModel
    var isMyStocks = false

    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(isMyStocks ? "My Stocks" : "Trending Stocks")
                .font(.title3)
                .fontWeight(.semibold)
                .padding(.horizontal)

            LazyVStack(alignment: .leading, spacing: 0) {
                if isMyStocks {
                    ForEach(portfolioVM.myStocks) { myStock in
                        NavigationLink(destination: StockView(stock: myStock.stock)) {
                            PortfolioListRowView(item: myStock.stock)
                        }
                    }
                } else {
                    ForEach(portfolioVM.trendingStocks) { stock in
                        NavigationLink(destination: StockView(stock: stock)) {
                            PortfolioListRowView(item: stock)
                        }
                    }
                }
            }
            .cornerRadius(12)
            .animation(.spring(), value: portfolioVM.myStocks)
            .animation(.spring(), value: portfolioVM.trendingStocks)
        }
    }
}

struct PortfolioListView_Previews: PreviewProvider {
    static var previews: some View {
        PortfolioListView()
    }
}
