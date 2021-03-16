//
//  ViewController.swift
//  MusicPlayer_Test
//
//  Created by DohyunKim on 2021/03/11.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    @IBOutlet weak var musicPlayPauseButton: UIButton!
    
    var player: AVAudioPlayer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        configure()
       
    }
    
    @IBAction func musicPlayPauseButton(_ sender: Any) {
        playAndPauseButton()
    }
    
    func configure() {
        
        let music = musicArr[position]
        
        let musicUrl = Bundle.main.url(forResource: "파티피플", withExtension: "mp3")!
        
        do {
//            try AVAudioSession.sharedInstance().setMode(.default)
//            try AVAudioSession.sharedInstance().setActive(true, options: .notifyOthersOnDeactivation)
//
////            guard let musicUrl = musicUrl else { return }
            
            player = try AVAudioPlayer(contentsOf: musicUrl)
            guard let player = player else { return }
            
            player.volume = 0.5
            player.prepareToPlay()
            player.play()
            
        } catch {
            print("error")
            fatalError()
        }
        
    }
}

extension ViewController {
    
    @objc func playAndPauseButton() {
        
        
        if player?.isPlaying == true {
            print("음악이 멈춥니다ㅕ")
            player?.pause()
            musicPlayPauseButton.setBackgroundImage(UIImage(systemName: "play.fill"), for: .normal)
            
            UIView.animate(withDuration: 0.2, animations: {
                //                self.musicImageView.frame = CGRect(x: 30, y: 30, width: self.view.frame.size.width - 60, height: self.view.frame.size.height - 60)
            })
        } else {
            print("음악이 실행됩니다")
            player?.play()
            musicPlayPauseButton.setBackgroundImage(UIImage(systemName: "pause.fill"), for: .normal)
            
            UIView.animate(withDuration: 0.2, animations: {
                //                self.musicImageView.frame = CGRect(x: 10, y: 10, width: self.view.frame.size.width - 20, height: self.view.frame.size.height - 20)
            })
        }
    }
    
}
