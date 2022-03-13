import Foundation

struct GetStockHistoryResponse: Codable {
    var history: [StockHistoryChunkResponse]

    enum CodingKeys: String, CodingKey {
        case history
    }
}

struct StockHistoryChunkResponse: Codable {
    var close: Double
    var high: Double
    var low: Double
    var open: Double
    var volume: Double

    enum CodingKeys: String, CodingKey {
        case close, high, low, open, volume
    }
}


func getStockHistory(symbol: String, years: Int = 1) {
    let headers = [
        "x-rapidapi-host": "stock-market-data.p.rapidapi.com",
        "x-rapidapi-key": "dc740fa19cmsh33df3560df5f505p177434jsnecd4ea62b564"
    ]

    let urlString = "https://stock-market-data.p.rapidapi.com/stock/historical-prices?ticker_symbol=\(symbol)&years=\(years)&format=json"
    let request = NSMutableURLRequest(
        url: NSURL(string: urlString)! as URL,
        cachePolicy: .useProtocolCachePolicy,
        timeoutInterval: 10.0
    )

    request.httpMethod = "GET"
    request.allHTTPHeaderFields = headers

    let session = URLSession.shared
    let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
        if (error != nil) {
            print(error)
            print(error?.localizedDescription)
        } else {
            let httpResponse = response as? HTTPURLResponse
            print("response", httpResponse)
        }
    })

    dataTask.resume()

}
