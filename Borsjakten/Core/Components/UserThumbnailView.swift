import SwiftUI

struct UserThumbnailView: View {
    var size: CGFloat
    var urlString: String
    
    var body: some View {
        if let url = URL(string: urlString) {
            AsyncImage(url: url) { image in
                image.resizable()
            } placeholder: {
                ProgressView()
            }
            .frame(width: size, height: size)
            .background(Color.black)
            .clipShape(Circle())
        } else {
            Image("NiklasFaceVaxholm")
                .resizable()
                .frame(width: size, height: size)
                .background(Color.black).clipShape(Circle())
        }
    }
}

struct UserThumbnailView_Previews: PreviewProvider {
    static var previews: some View {
        UserThumbnailView(size: 64, urlString: "https://picsum.photos/200")
    }
}
