import SwiftUI
import AVFoundation

struct DoomScroll: View {
    let videoMetadata: VideoMetaData
    @State private var player: AVPlayer?

    var body: some View {
        ZStack {
            if let player = player {
                VideoPlayerView(player: player)
                    //.padding(EdgeInsets(top: -50, leading: 0, bottom: 0, trailing: 0))
                    .frame(width: UIScreen.main.bounds.width + 10, height: UIScreen.main.bounds.height + 10)
                    .ignoresSafeArea()
            }

            VStack(alignment: .leading, spacing: 16) {
                Button("", systemImage: "arrowshape.backward") {
                    ViewManager.endDoomScrolling()
                }
                .font(.system(size: 32))
                .padding(.top, 60)
                .padding(.leading, 15)

                Spacer()

                Text(videoMetadata.caption)
                    .font(Font.custom("Cochin", size: 32).weight(.semibold))
                    .lineSpacing(10)
                    .foregroundColor(.white)

                Text(videoMetadata.author)
                    .font(Font.custom("Cochin", size: 20))
                    .lineSpacing(10)
                    .foregroundColor(.white)
            }
            .padding(.bottom, 50)
            .padding(.trailing, 100)
        }
        .background(Color.black)
        .onAppear {
            guard let videoURL = videoMetadata.makeURL() else { return }
            let p = createLoopingPlayer(url: videoURL)
            player = p
            p.play()
        }
        .onDisappear {
            player?.pause()
        }
    }
}


struct VideoPlayerView: UIViewRepresentable {
    let player: AVPlayer

    func makeUIView(context: Context) -> UIView {
        let view = UIView(frame: .zero)
        let playerLayer = AVPlayerLayer(player: player)
        playerLayer.frame = UIScreen.main.bounds.insetBy(dx: -50, dy: -50)
        playerLayer.videoGravity = .resizeAspectFill
        view.layer.addSublayer(playerLayer)
        return view
    }

    func updateUIView(_ uiView: UIView, context: Context) {}
}

func createLoopingPlayer(url: URL) -> AVPlayer {
    let player = AVPlayer(url: url)
    player.actionAtItemEnd = .none
    NotificationCenter.default.addObserver(
        forName: .AVPlayerItemDidPlayToEndTime,
        object: player.currentItem,
        queue: .main
    ) { _ in
        player.seek(to: .zero)
        player.play()
    }
    return player
}
