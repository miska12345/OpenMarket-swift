import SwiftUI
import SwipeableView

struct Example {
    static var leftActions = [
        Action(title: "Note", iconName: "pencil", bgColor: .yellow, action: {}),
        Action(title: "Edit doc", iconName: "doc.text", bgColor: .blue, action: {}),
        Action(title: "New doc", iconName: "doc.text.fill", bgColor: .green, action: {}),
    ]
    
    static var leftActions2 = [
        Action(title: "Note", iconName: "pencil", bgColor: .yellow, action: {}),
        Action(title: "Edit doc", iconName: "doc.text", bgColor: .yellow, action: {}),
    ]
    
    static var rightActions = [
        Action(title: "Delete", iconName: "trash", bgColor: .yellow, action: {})
    ]
    static var rightActions2 = [
        Action(title: "New doc", iconName: "doc.text.fill", bgColor: .yellow, action: {}),
        Action(title: "Delete", iconName: "trash", bgColor: .yellow, action: {})
    ]
}


struct SwipableCellDemo: View {
    var container = SwManager()
    var body: some View {
        NavigationView {
        GeometryReader { reader in
            ScrollView {
                VStack (alignment: .center, spacing: 10){
                    Spacer()
                    HStack {
                        Text("Independed view")
                            .font(.title)
                            .bold()
                        Spacer()
                    }
                    HStack {
                        Text("Rectangular style")
                            .font(.callout)
                        Spacer()
                    }
                    SwipeableView(content: {
                        Text("Swipe to see actions")
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                            .background(Color.gray)
                        
                    },
                    leftActions: Example.leftActions,
                    rightActions: Example.rightActions,
                    rounded: false)
                    .frame(height: 90)
                    
                    HStack {
                        Text("Views in a container")
                            .font(.title2)
                            .bold()
                        Spacer()
                    }
                    
                    HStack {
                        Text("Rounded style")
                            .font(.callout)
                        Spacer()
                    }
                    
                    
                    ForEach(0 ..< 10) { number in
                        
                        SwipeableView(content: {
                            HStack {
                                Spacer()
                                Text("Swipe to see actions \(number)")
                                
                                Spacer()
                            }
                            .frame(maxHeight: .infinity)
                            .background(Color.gray)
                            .cornerRadius(10)
                            
                        },
                        leftActions: [Action(title: "New doc", iconName: "doc.text.fill", bgColor: .green, action: {
                            print(number)
                        })],
                        rightActions: Example.rightActions,
                        rounded: true,
                        container: container)
                        .frame(height: 100)
                        
                    }
                    
                    
                    
                    
                    
                    
                    Spacer()
                }.padding()
            }
            
        }
        //.background(Color.white)
        
        .navigationTitle("Swipeable-View")
        
        }
    }
}


struct SwipableCellDemo_Preview: PreviewProvider {
    static var previews: some View {
        SwipableCellDemo()
    }
}
