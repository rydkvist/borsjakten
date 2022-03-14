import SwiftUI
import Foundation

struct PortfolioView: View {
    @EnvironmentObject private var portfolioVM: PortfolioViewModel

    var body: some View {
        NavigationView {
            ScrollView(.vertical, showsIndicators: false) {
                VStack(alignment: .leading, spacing: 24) {
                    VStack(alignment: .leading, spacing: 16) {
                        PortfolioSummaryView()
                        PortfolioBalanceControlsView()
                    }
                    .padding(.horizontal)

                    if !portfolioVM.myStocks.isEmpty {
                        PortfolioListView(isMyStocks: true)
                    }

                    PortfolioListView(isMyStocks: false)
                }
                .animation(.spring(), value: portfolioVM.myStocks.isEmpty)
            }
            .navigationTitle(DrawerScreens.portfolio.rawValue)
            .ignoresSafeArea(.all, edges: .bottom)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    DrawerNavigationButtonView()
                }
            }
        }
    }
}

struct PortfolioView_Previews: PreviewProvider {
    static var previews: some View {
        PortfolioView()
    }
}

