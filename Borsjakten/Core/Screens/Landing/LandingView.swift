import SwiftUI

struct LandingView: View {    

    var body: some View {
        VStack(alignment: .leading) {
            Text("Börsjakten")
                .font(.largeTitle)
                .fontWeight(.semibold)
            
            Text("Jakten efter ekonomisk frihet")
                .font(.title)
                .padding(.bottom)
            
            VStack(alignment: .center) {
                NavigationLink("Create an account", destination: EmailView())
                    .foregroundColor(.primary)
                    .font(.subheadline)
                    .padding(.vertical)
                    .frame(maxWidth: .infinity)
                    .shadow(color: .white, radius: 1, x: 0, y: 0)
                    .background()
                    .cornerRadius(24)
                    .padding(.horizontal, 32)
                    .padding(.bottom)
                
                NavigationLink("Or sign in", destination: EmailView(isLoginEmail: true))
                    .font(.subheadline)
            }
            Spacer()
        }
        .padding(.horizontal)
    }
}
