import SwiftUI

struct ExDivider: View {
    var color: Color = .gray
    var width: CGFloat = 2
    var body: some View {
        Rectangle()
            .fill(color)
            .frame(height: width)
            .edgesIgnoringSafeArea(.horizontal)
    }
}

