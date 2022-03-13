import SwiftUI
import Foundation

struct PortfolioView: View {
    @StateObject private var portfolioVM = PortfolioViewModel()
    
    var body: some View {
        NavigationView {
            ScrollView(.vertical, showsIndicators: false) {
                VStack(alignment: .leading, spacing: 24) {
                    PortfolioSummaryView(portfolioVM: portfolioVM)
                    PortfolioListView(portfolioVM: portfolioVM)
                }
                .padding(.horizontal, 16)
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

