import SwiftUI

struct PortfolioListRowView: View {
    var item: StockResponse

    var body: some View {
        HStack(spacing: 32) {
            HStack {
                Image(item.imageString)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 32, height: 32)

                VStack(alignment: .leading, spacing: 4) {
                    Text(item.ticketSymbol.rawValue)
                        .fontWeight(.semibold)
                        .textCase(.uppercase)

                    Text(item.companyName)
                        .font(.subheadline)
                        .fontWeight(.medium)
                        .foregroundColor(.secondary)
                }
                .lineLimit(1)
            }
            .frame(maxWidth: .infinity, alignment: .leading)

            Text("GRAPH")

            VStack(alignment: .trailing, spacing: 4) {
                Text(getTextFor(stockPrice: item.price))
                    .foregroundColor(.primary)

                Text(getTextFor(stockPercentage: item.percentChange))
                    .foregroundColor(item.percentChange < 0 ? .red : .green)
            }
            .frame(maxWidth: .infinity, alignment: .trailing)
            .lineLimit(1)
        }
        .padding(.vertical, 12)
        .padding(.horizontal)
    }
}

struct PortfolioListRowView_Previews: PreviewProvider {
    static var previews: some View {
        PortfolioListRowView(item: .mockedStock())
            .preferredColorScheme(.dark)
    }
}
