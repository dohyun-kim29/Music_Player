//
//  MusicDetailViewController.swift
//  Music Player
//
//  Created by DohyunKim on 2021/03/10.
//

import UIKit
//음악 플레이어 기능을 쓰기 위해 임포트해줍니다.
import AVFoundation


class MusicDetailViewController: UIViewController {
    
    //Avaudio 객체 사용을 위한 변수 지정
    var player: AVAudioPlayer?
    
    //스토리보드에서 IBOutlet변수 지정
    @IBOutlet weak var musicImageView: UIImageView!
    @IBOutlet weak var musicTitleLabel: UILabel!
    @IBOutlet weak var musicPlayPauseButton: UIButton!
    @IBOutlet weak var musicSlider: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // 뷰가 올라올 때 실행되는 함수들입니다.
        UIBind()
        configure()
        
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        //뷰가 사라질 때 실행되는 함수들입니다.
        if let player = player {
            player.stop()
        }
        
        
    }
    
    func configure() {
        
        //모델에서 음악 정보를 가져옵니다.
        let music = musicArr[position]
        
        //음악 경로를 지정해줍니다.
        let musicUrl = Bundle.main.url(forResource: music, withExtension: "mp3")!
        
        //음악을 실행해줍니다.
        do {
            try AVAudioSession.sharedInstance().setMode(.default)
            try AVAudioSession.sharedInstance().setActive(true, options: .notifyOthersOnDeactivation)

            
            player = try AVAudioPlayer(contentsOf: musicUrl)
            guard let player = player else { return }
            
            player.volume = 0.5
            player.prepareToPlay()
            player.play()
            
        } catch {
            print("error")
        }
        
    }
    
    func UIBind() {
        
        //UI에 이미지와 텍스트 정보를 모델에서 받아와 바인드 해줍니다.
        musicImageView.image = UIImage(named: "\(musicArr[position]).jpg")
        musicTitleLabel.text = musicArr[position]
        
        musicSlider.addTarget(self, action: #selector(adjustVolume(_:)), for: .valueChanged)
        musicPlayPauseButton.addTarget(self, action: #selector(playAndPauseButton), for: .touchDown)
        

    }

    
}

extension MusicDetailViewController {
    
    //음악 재생 버튼을 누를 때 버튼사진과 애니메이션을 주고 음악재생 상태를 바꾸어줍니다.
    @objc func playAndPauseButton() {
        if player?.isPlaying == true {
            print("음악이 멈춥니다")
            player?.pause()
            musicPlayPauseButton.setBackgroundImage(UIImage(systemName: "play.fill"), for: .normal)
            
            UIView.animate(withDuration: 0.2, animations: {
                self.musicImageView.frame = CGRect(x: 30, y: 30, width: self.view.frame.size.width - 60, height: self.view.frame.size.height - 60)
            })
        } else {
            print("음악이 실행됩니다")
            player?.play()
            musicPlayPauseButton.setBackgroundImage(UIImage(systemName: "pause.fill"), for: .normal)
            
            UIView.animate(withDuration: 0.2, animations: {
                self.musicImageView.frame = CGRect(x: 10, y: 10, width: self.view.frame.size.width - 20, height: self.view.frame.size.height - 20)
            })
        }
    }
    
    //볼륨 슬라이더를 위한 함수입니다.
    @objc func adjustVolume( _ slider: UISlider) {
        let value = slider.value
        player?.volume = value
    }
    

    
}
