import SwiftUI

class PortfolioViewModel: ObservableObject {
    @Published var balance: Float = 382.53
    @Published var stocks: [StockResponse] = [
        .init(companyName: "Apple", ticketSymbol: .appl, value: 154.73, percentChange: 1.55),
        .init(companyName: "Microsoft", ticketSymbol: .msft, value: 280.07, percentChange: 2.35),
        .init(companyName: "Tesla", ticketSymbol: .tsla, value: 870.96, percentChange: -1.37),
        .init(companyName: "NVIDIA", ticketSymbol: .nvda, value: 221.00, percentChange: 2.46),
        .init(companyName: "Airbnb", ticketSymbol: .abnb, value: 145.14, percentChange: 4.39),
        .init(companyName: "GameStop Corp.", ticketSymbol: .gme, value: 92.69, percentChange: -7.83),
        .init(companyName: "Amazon.com, Inc.", ticketSymbol: .amzn, value: 2910.49, percentChange: -0.88),
    ]
}

struct StockResponse: Identifiable, Decodable, Equatable {
    var companyName: String
    var ticketSymbol: TrendingStockSymbols
    var value: Float
    var percentChange: Float

    var id: String { ticketSymbol.rawValue }

    var imageString: String? {
        switch ticketSymbol {
        case .appl:
            return "Apple"
        case .msft:
            return "Microsoft"
        case .tsla:
            return "Tesla"
        case .nvda:
            return "Nvidia"
        case .abnb:
            return "Airbnb"
        case .gme:
            return "Gamestop"
        case .amzn:
            return "Amazon"
        default:
            return nil
        }
    }

    static func mockedStock() -> StockResponse {
        return .init(companyName: "Apple", ticketSymbol: .appl, value: 160.4, percentChange: 0.55)
    }
}

enum TrendingStockSymbols: String, Decodable {
    case appl, msft, tsla, nvda, abnb, gme, amzn
}
