import SwiftUI

extension View {
    func navigatePush(when toggle: Binding<Bool>) -> some View {
         NavigationLink(
             destination: self,
             isActive: toggle
         ) { EmptyView() }
     }
}
