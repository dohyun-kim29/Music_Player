//
//  ViewController.swift
//  Music Player
//
//  Created by DohyunKim on 2021/03/10.
//

import UIKit

class MusicViewController: UIViewController {
    
    @IBOutlet weak var musicTableView: UITableView!
    //스토리보드에서 IBOutlet으로 연결
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        musicTableView.delegate = self
        musicTableView.dataSource = self
        //테이블 뷰 사용을 위한 델리게이트 속성 지정
        
    }
    
    
}

extension MusicViewController: UITableViewDelegate, UITableViewDataSource {
    
    //프로토콜에 따라 자동으로 생성되는 함수에 값을 넣어준다.
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        //셀의 개수를 물어보는 함수
        return musicArr.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        //셀에 뭐가 들어갈 것인지를 물어보는 함수
        
        let cell = musicTableView.dequeueReusableCell(withIdentifier: "MusicCell", for: indexPath) as! MusicCell
        
        cell.musicImageView.image = UIImage(named: "\(musicArr[indexPath.row]).jpg")
        cell.musicTItleLabel.text = musicArr[indexPath.row]
        
        return cell
        
    }
    
    //셀이 눌렸을때 해줄 작업을 물어보는 함수
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        musicTableView.deselectRow(at: indexPath, animated: true)
        
        let cellPosition = indexPath.row
        
        //모델에 값을 전달해주는 코드
        position = cellPosition
        
        //MusicDetailViewController를 호출해주는 코드
        guard let viewController = storyboard?.instantiateViewController(withIdentifier: "MusicDetailViewController") as? MusicDetailViewController else { return }
        
        self.present(viewController, animated: true, completion: nil)
        
        
        
    }
}

