//
//  AnimationonTestVC.swift
//  SOPT_iOS_Seminar4
//
//  Created by 이유진 on 2020/11/07.
//

import UIKit

class AnimationonTestVC: UIViewController {
    
    @IBOutlet weak var cloudImg: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func touchUpStart(_ sender: Any) {
        //        UIView.animate(withDuration: 3.0, animations: { self.cloudImg.alpha = 0})
        //        { finished in
        //            UIView.animate(withDuration: 1.0) {
        //            self.cloudImg.alpha = 1 }
        //        }
        //        let newPosition = CGRect(x: 100, y: 100, width: 300, height: 200)
        //
        //        UIView.animate(withDuration: 3.0,
        //                       animations: {
        //                        self.cloudImg.frame = newPosition
        //        }) { finished in
        //            UIView.animate(withDuration: 2.0) {
        //            self.initPosition() }
        //        }
        let scale = CGAffineTransform(scaleX: 2.0, y: 2.0)
        let rotate = CGAffineTransform(rotationAngle: .pi / 4)
        let move = CGAffineTransform(translationX: 200, y: 200)
        let combine = scale.concatenating(move).concatenating(rotate)
        
        UIView.animate(withDuration: 1.0, animations: {
            self.cloudImg.transform = combine
        }) { finished in
            UIView.animate(withDuration: 1.0) {
            self.cloudImg.transform = .identity }
        }
//        UIView.animate(withDuration: 1.0, delay: 0) {
//            self.cloudImg.transform = combine
//
//            UIView.animate(withDuration: 3.0,
//                           animations: {
//                            //                        self.cloudImg.transform = CGAffineTransform(scaleX: 2.0, y: 0.5)
//                            //                        self.cloudImg.transform = CGAffineTransform(translationX: 100, y: 300)
//                            self.cloudImg.transform = CGAffineTransform(rotationAngle: .pi/2)
//                           })
//        }
//
//        func initPosition() {
//            cloudImg.frame = CGRect(x: 0, y: 0, width: 150, height: 100)
//        }
    }
}
