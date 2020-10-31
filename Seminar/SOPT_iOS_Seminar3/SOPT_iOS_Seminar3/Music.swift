//
//  Music.swift
//  SOPT_iOS_Seminar3
//
//  Created by 이유진 on 2020/10/31.
//

import Foundation
import UIKit

struct Music {
    var title: String
    var singer: String
    var albumImageName: String
    
    func makeAlbumImage() -> UIImage? {
        return UIImage(named: albumImageName)
    }
}
