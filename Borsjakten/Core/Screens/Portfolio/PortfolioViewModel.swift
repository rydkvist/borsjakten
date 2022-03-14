import SwiftUI
import Foundation

class PortfolioViewModel: ObservableObject {
    @AppStorage("portfolioBalance") var balance: Double = 1000
    @AppStorage("portfolioMyStocks") var myStocks: [BoughtStockResponse] = []

    @Published var trendingStocks: [StockResponse] = [
        .init(companyName: "Tesla", ticketSymbol: .tsla, price: 870.96, percentChange: -1.37),
        .init(companyName: "Microsoft", ticketSymbol: .msft, price: 280.07, percentChange: 2.35),
        .init(companyName: "Apple", ticketSymbol: .appl, price: 154.73, percentChange: 1.55),
        .init(companyName: "Airbnb", ticketSymbol: .abnb, price: 145.14, percentChange: 4.39),
        .init(companyName: "NVIDIA", ticketSymbol: .nvda, price: 221.00, percentChange: 2.46),
        .init(companyName: "Alphabet Inc.", ticketSymbol: .goog, price: 2609.51, percentChange: -1.66),
        .init(companyName: "Spotify Technology S.A.", ticketSymbol: .spot, price: 124.29, percentChange: -6.32),
        .init(companyName: "Bitcoin USD", ticketSymbol: .btc, price: 38751.42, percentChange: -0.83),
        .init(companyName: "Ethereum USD", ticketSymbol: .eth, price: 2561.85, percentChange: -0.96),
        .init(companyName: "GameStop Corp.", ticketSymbol: .gme, price: 92.69, percentChange: -7.83),
        .init(companyName: "Amazon.com, Inc.", ticketSymbol: .amzn, price: 2910.49, percentChange: -0.88),
    ]

    @MainActor
    func depositBalance(amount: Double) {
        balance += amount
    }

    @MainActor
    func withdrawBalance(amount: Double) {
        guard balance > 0, balance - amount >= 0 else {
            // TODO: Add snackbars / toasts when handling error like this
            print("Can't withdraw less than 0")
            return
        }

        // TODO: Add snackbars / toasts when adding new money etc
        balance -= amount
    }

    @MainActor
    func buy(stock: StockResponse, amount: Int = 1) {
        let totalCost = stock.price * Double(amount)
        if balance >= totalCost {
            // TODO: Add snackbars / toasts when adding new money etc

            balance -= stock.price

            if let alreadyBoughtStock = myStocks.firstIndex(where: { $0.stock.id == stock.id }) {
                myStocks[alreadyBoughtStock].total += amount
            } else {
                let newBoughtStock = BoughtStockResponse(stock: stock, total: amount)
                myStocks.append(newBoughtStock)
            }
        } else {
            // TODO: Add snackbars / toasts when handling error like this
            print("Not enough balance")
        }
    }

    @MainActor
    func sell(stock: StockResponse, amount: Int = 1) {
        if let hasStockToSell = myStocks.firstIndex(where: { $0.stock.id == stock.id }) {
            if myStocks[hasStockToSell].total < amount {
                print("The user only has \(myStocks[hasStockToSell].total) stocks, can't try to sell \(amount)")
            } else if myStocks[hasStockToSell].total == amount {
                // Will sell everything
                let totalProfit = myStocks[hasStockToSell].stock.price * Double(amount)

                myStocks.removeAll(where: { $0.stock.id == stock.id })
                balance += totalProfit
            } else if myStocks[hasStockToSell].total > amount {
                let totalProfit = myStocks[hasStockToSell].stock.price * Double(amount)

                myStocks[hasStockToSell].total -= amount
                balance += totalProfit
            }
        } else {
            print("Doesn't own the stock")
        }
    }
}

struct BoughtStockResponse: Equatable, Identifiable, Codable {
    var stock: StockResponse
    var total: Int

    var id: String { "\(stock.id)-\(total)" }
}

struct StockResponse: Identifiable, Codable, Equatable {
    var companyName: String
    var ticketSymbol: TrendingStockSymbols
    var price: Double
    var percentChange: Double

    var id: String { ticketSymbol.rawValue }

    var imageString: String {
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
        case .goog:
            return "Google"
        case .spot:
            return "Spotify"
        case .btc:
            return "Bitcoin"
        case .eth:
            return "Ethereum"
        }
    }

    static func mockedStock() -> StockResponse {
        return .init(companyName: "Apple", ticketSymbol: .appl, price: 160.4, percentChange: 0.55)
    }
}

enum TrendingStockSymbols: String, Codable {
    case appl, msft, tsla, nvda, abnb, gme, amzn, goog, btc, eth, spot
}
