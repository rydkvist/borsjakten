import Foundation

func getTextFor(stockPercentage: Double) -> String {
    let percentageString = String(format: "%.2f", stockPercentage) + "%"
    if stockPercentage > 0 {
        return "+" + percentageString
    } else {
        return percentageString
    }
}

func getTextFor(stockPrice: Double) -> String {
    let priceString = String(format: "%.2f", stockPrice)
    return "$" + priceString
}
