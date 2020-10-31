//
//  Part.swift
//  SOPT_iOS_Seminar3
//
//  Created by 이유진 on 2020/10/31.
//

import Foundation
import UIKit

struct Part {
    var imageName: String
    var partName: String
    
    func makeImage() -> UIImage? {
        return UIImage(named: imageName)
    }
}
