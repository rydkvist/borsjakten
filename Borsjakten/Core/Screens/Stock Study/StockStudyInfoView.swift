import SwiftUI

struct StockStudyInfoView: View {
    var body: some View {
        VStack(spacing: 16) {
            Divider()
                .padding(.horizontal, 16)

            Text("Through simple, educational and fun levels, you will learn everything you need to do your best on the stock market.")
                .multilineTextAlignment(.center)
                .padding(.horizontal, 24)
                .font(.body)
                .foregroundColor(.secondary)
        }
        .padding(.vertical, 24)
    }
}

struct StockStudyInfoView_Previews: PreviewProvider {
    static var previews: some View {
        StockStudyInfoView()
    }
}
