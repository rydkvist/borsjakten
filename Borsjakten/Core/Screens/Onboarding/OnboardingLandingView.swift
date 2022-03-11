import SwiftUI

struct OnboardingLandingView: View {
    @State private var scale: CGFloat = 1

    var body: some View {
        OnboardingScreenView(isLandingView: true) {
            Image(systemName: "globe.americas.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 200, height: 200)
                .foregroundColor(.white)
                .padding(.bottom, 20)
                .scaleEffect(scale)
                .animation(.spring().speed(0.25) .repeatForever(autoreverses: true), value: scale)

            Text("Börsjakten")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundColor(.white)

            Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus eget viverra tellus. Vestibulum suscipit elementum lacinia.")
                .fontWeight(.medium)
                .foregroundColor(.white)
        }
        .onAppear(perform: { UIApplication.shared.endEditing() })
        .onAppear(perform: { scale = 1.2 })
    }
}

struct LandingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingLandingView()
            .background(Color.blue)
    }
}
