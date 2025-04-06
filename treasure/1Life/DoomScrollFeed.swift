import SwiftUI

struct DoomScrollFeed: View {
    let videoMetaDatas: [VideoMetaData]
    @State private var currentIndex: Int = 0
    
    var body: some View {
        GeometryReader { geometry in
            TabView(selection: $currentIndex) {
                ForEach(0..<videoMetaDatas.count, id: \.self) { index in
                    DoomScroll(videoMetadata: videoMetaDatas[index])
                        .frame(width: geometry.size.width, height: geometry.size.height)
                        .tag(index)
                        .rotationEffect(.degrees(-90)) // Rotate content
                        .frame(width: geometry.size.height, height: geometry.size.width) // Swap dimensions
                }
            }
            .frame(width: UIScreen.main.bounds.height, height: UIScreen.main.bounds.width)
            .rotationEffect(.degrees(90)) // Counter-rotate entire TabView
            .offset(x: ((geometry.size.width - geometry.size.height) / 2) - 40,
                               y: ((geometry.size.height - geometry.size.width) / 2) - 8)
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
        }
    }
}

/*#Preview {
    DoomScrollContainer()
}*/
