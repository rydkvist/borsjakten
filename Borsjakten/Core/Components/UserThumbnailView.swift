import SwiftUI

struct UserThumbnailView: View {
    var size: CGFloat
    var url: URL
    
    var body: some View {
        AsyncImage(url: url) { image in
            image.resizable()
        } placeholder: {
            ProgressView()
        }
        .frame(width: size, height: size)
        .background(Color.black)
        .clipShape(Circle())
    }
}

struct UserThumbnailView_Previews: PreviewProvider {
    static var previews: some View {
        UserThumbnailView(size: 64, url: URL(string: "https://picsum.photos/200")!)
    }
}
