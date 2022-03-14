import SwiftUI

struct StockView: View {
    @EnvironmentObject private var portfolioVM: PortfolioViewModel
    var stock: StockResponse

    private var myStock: BoughtStockResponse? {
        portfolioVM.myStocks.first(where: { $0.stock == stock })
    }

    var body: some View {
        VStack(spacing: 16) {
            Spacer()

            Image(stock.imageString)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 76, height: 76)

            VStack(spacing: 8) {
                HStack {
                    Text(stock.ticketSymbol.rawValue)
                        .fontWeight(.semibold)
                        .textCase(.uppercase)

                    Text("–")
                    Text(stock.companyName)
                }
                .font(.title3)
                .foregroundColor(.secondary)

                Text(getTextFor(stockPrice: stock.price))
                    .foregroundColor(.primary)
                    .fontWeight(.bold)
                    .font(.title2)

                Text(getTextFor(stockPercentage: stock.percentChange))
                    .foregroundColor(stock.percentChange < 0 ? .red : .green)
            }

            if let total = myStock?.total {
                Text("You own \(total) shares of \(stock.companyName)")
            } else {
                Text("You don't have any shares of \(stock.companyName)")
            }

            Spacer()
            Spacer()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .overlay(alignment: .bottom) {
            HStack(spacing: 16) {
                Button(action: { portfolioVM.buy(stock: stock) }) {
                    Label("Buy", systemImage: "arrow.up.circle.fill")
                        .foregroundColor(.white)
                }
                .padding(.vertical, 12)
                .padding(.horizontal)
                .frame(maxWidth: .infinity)
                .background(Color.blue)
                .cornerRadius(12)

                Button(action: { portfolioVM.sell(stock: stock) }) {
                    Label("Sell", systemImage: "arrow.down.circle.fill")
                        .foregroundColor(.white)
                }
                .padding(.vertical, 12)
                .padding(.horizontal)
                .frame(maxWidth: .infinity)
                .background(Color.red)
                .cornerRadius(12)
            }
            .padding(16)
            .frame(maxWidth: .infinity)
        }
        .background(.thickMaterial)
        .navigationTitle(stock.companyName)
    }
}

struct StockView_Previews: PreviewProvider {
    static var previews: some View {
        StockView(stock: .mockedStock())
            .environmentObject(PortfolioViewModel())
    }
}
