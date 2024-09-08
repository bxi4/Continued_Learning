import SwiftUI

struct SwipeGestureExample: View {
    @State private var offset: CGSize = .zero
    
    var body: some View {
        Text("Swipe me!")
            .padding()
            .background(Color.blue)
            .cornerRadius(10)
            .offset(x: offset.width, y: offset.height) // Apply the offset
            .gesture(
                DragGesture()
                    .onChanged { gesture in
                        // Track the drag gesture
                        offset = gesture.translation
                    }
                    .onEnded { gesture in
                        // Determine the swipe direction
//                        if gesture.translation.width < -100 {
//                            // Left swipe action
//                            print("Swiped left!")
//                        } else if gesture.translation.width > 100 {
//                            // Right swipe action
//                            print("Swiped right!")
//                        } else if gesture.translation.height < -100 {
//                            // Up swipe action
//                            print("Swiped up!")
//                        } else if gesture.translation.height > 100 {
//                            // Down swipe action
//                            print("Swiped down!")
//                        }
                        
                        // Reset the position after the gesture ends
                        withAnimation {
                            offset = .zero
                        }
                    }
            )
            .animation(.spring(), value: offset) // Add animation for smooth transitions
    }
}

struct SwipeGestureExample_Previews: PreviewProvider {
    static var previews: some View {
        SwipeGestureExample()
    }
}
