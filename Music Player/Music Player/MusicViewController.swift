//
//  ViewController.swift
//  Music Player
//
//  Created by DohyunKim on 2021/03/10.
//

import UIKit

class MusicViewController: UIViewController {
    
    @IBOutlet weak var musicTableView: UITableView!
    
    let musicArr = ["파티피플","너무해","FedexxGirl"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        musicTableView.delegate = self
        musicTableView.dataSource = self
        
    }
    
    
}

extension MusicViewController: UITableViewDelegate, UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return musicArr.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = musicTableView.dequeueReusableCell(withIdentifier: "MusicCell", for: indexPath) as! MusicCell
        
        cell.musicImageView.image = UIImage(named: musicArr[indexPath.row])
        cell.musicTItleLabel.text = musicArr[indexPath.row]
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        musicTableView.deselectRow(at: indexPath, animated: true)
        
        let position = indexPath.row
        
        guard let viewController = storyboard?.instantiateViewController(withIdentifier: "MusicDetailViewController") as? MusicDetailViewController else { return }
        
        viewController.position = position
        viewController.musicArr = musicArr
    }
}

