import SwiftUI

struct StockView: View {
    var stock: StockResponse

    var body: some View {
        VStack {
            Text(stock.ticketSymbol.rawValue)
            Text("\(stock.percentChange)")
            Text("\(stock.value)")
        }
        .navigationTitle(stock.companyName)
    }
}

struct StockView_Previews: PreviewProvider {
    static var previews: some View {
        StockView(stock: .mockedStock())
    }
}
