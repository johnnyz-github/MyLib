//
//  LoopingPlayer.swift
//  movPlay
//
//  Created by Johnny1 on 1/2/2023.
//

import SwiftUI
import AVFoundation

struct LoopingPlayer:  UIViewRepresentable{
    func makeUIView(context: Context) -> some UIView {
        return PlayerUIView(frame: .zero)
    }
    func updateUIView(_ uiView: UIViewType, context: Context) {
        
    }
}

class PlayerUIView : UIView{
    private var playerLayer = AVPlayerLayer()
    override init(frame: CGRect){
        super.init(frame: frame)
        let fileUrl = Bundle.main.url(forResource: "earth_rotate", withExtension: "mov")!
        let playerItem = AVPlayerItem(url : fileUrl)
        
        let player = AVPlayer(playerItem: playerItem)
        playerLayer.player = player
        playerLayer.videoGravity = .resizeAspectFill
        layer.addSublayer(playerLayer)
        
        player.play()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        playerLayer.frame = bounds
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
struct LoopingPlayer_Previews: PreviewProvider {
    static var previews: some View {
        LoopingPlayer()
    }
}
