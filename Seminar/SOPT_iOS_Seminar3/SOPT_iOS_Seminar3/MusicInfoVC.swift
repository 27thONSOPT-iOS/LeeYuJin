//
//  MusicInfoVC.swift
//  SOPT_iOS_Seminar3
//
//  Created by 이유진 on 2020/10/31.
//

import UIKit

class MusicInfoVC: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var singerLabel: UILabel!
    @IBOutlet weak var albumImageView: UIImageView!

    var music: Music?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setMusicInfo()

    }
   
    func setMusicInfo() {
        if let music = music {
            titleLabel.text = music.title
            singerLabel.text = music.singer
            titleLabel.sizeToFit()
            singerLabel.sizeToFit()
            albumImageView.image = music.makeAlbumImage()
        }
    }
    
}
