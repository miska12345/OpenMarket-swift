import SwiftUI
import Foundation

struct ImageSlideView: View {

    @Binding var index: Int
    let maxIndex: Int
    let recommened: [Organization]
    @State private var offset = CGFloat.zero
    @State private var dragging = false
    @State private var toOrganization: Int! = -1
    @ObservedObject var session: SessionManager
    init(index: Binding<Int>, maxIndex: Int, recommened: [Organization], session: SessionManager) {
        self._index = index
        self.maxIndex = maxIndex
        self.recommened = recommened
        self.session = session
    }

    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            NavigationLink(destination: OrganizationStore(organization: recommened[index], session: session), tag: 1, selection: $toOrganization) {
                EmptyView()
            }.buttonStyle(PlainButtonStyle())
            GeometryReader { geometry in
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 0) {
                        ForEach(recommened) { organization in
                            Image(organization.organizationPicture)
                                .resizable()
                                .scaledToFill()
                        }
                        .frame(width: geometry.size.width, height: geometry.size.height)
                        .clipped()
                    }
                }
                .content.offset(x: self.offset(in: geometry), y: 0)
                .frame(width: geometry.size.width, alignment: .leading)
                .gesture(
                    DragGesture().onChanged { value in
                        self.dragging = true
                        self.offset = -CGFloat(self.index) * geometry.size.width + value.translation.width
                    }
                    .onEnded { value in
                        let predictedEndOffset = -CGFloat(self.index) * geometry.size.width + value.predictedEndTranslation.width
                        let predictedIndex = Int(round(predictedEndOffset / -geometry.size.width))
                        self.index = self.clampedIndex(from: predictedIndex)
                        withAnimation(.easeOut) {
                            self.dragging = false
                        }
                    }
                )//TODO define this closure into content that is pass in to handle different uses of this view
                .onTapGesture(count: /*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/, perform: {
                    self.toOrganization = 1
                })
                .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
            }
            .clipped()

            SlideControl(index: $index, maxIndex: maxIndex)
        }
    }

    func offset(in geometry: GeometryProxy) -> CGFloat {
        if self.dragging {
            return max(min(self.offset, 0), -CGFloat(self.maxIndex) * geometry.size.width)
        } else {
            return -CGFloat(self.index) * geometry.size.width
        }
    }

    func clampedIndex(from predictedIndex: Int) -> Int {
        let newIndex = min(max(predictedIndex, self.index - 1), self.index + 1)
        guard newIndex >= 0 else { return 0 }
        guard newIndex <= maxIndex else { return maxIndex }
        return newIndex
    }
}

struct SlideControl: View {
    @Binding var index: Int
    let maxIndex: Int

    var body: some View {
        HStack(spacing: 8) {
            ForEach(0...maxIndex, id: \.self) { index in
                Circle()
                    .fill(index == self.index ? Color.white : Color.gray)
                    .frame(width: 8, height: 8)
            }
        }
        .padding(15)
    }
}

