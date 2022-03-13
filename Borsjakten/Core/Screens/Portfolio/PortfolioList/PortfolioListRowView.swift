import SwiftUI

struct PortfolioListRowView: View {
    var item: StockResponse

    var body: some View {
        HStack(spacing: 32) {
            HStack(spacing: 8) {
                if let imageString = item.imageString {
                    Image(imageString)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 32, height: 32)
                } else {
                    Image(systemName: "network")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .foregroundColor(.blue)
                        .frame(width: 32, height: 32)
                }

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
                Text("$" + String(format: "%.2f", item.value))
                    .foregroundColor(.black)

                Text(String(format: "%.2f", item.percentChange) + "%")
                    .foregroundColor(item.percentChange < 0 ? .red : .green)
            }
            .lineLimit(1)
            .frame(maxWidth: .infinity, alignment: .trailing)
        }
    }
}

struct PortfolioListRowView_Previews: PreviewProvider {
    static var previews: some View {
        PortfolioListRowView(item: .mockedStock())
    }
}
