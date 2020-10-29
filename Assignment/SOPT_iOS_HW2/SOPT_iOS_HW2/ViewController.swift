//
//  ViewController.swift
//  SOPT_iOS_HW2
//
//  Created by 이유진 on 2020/10/29.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavi()
    }
    
    func setupNavi(){
        guard let navigationBar = self.navigationController?.navigationBar else { return }
        
        navigationBar.isTranslucent = true
        navigationBar.backgroundColor = UIColor.black
        navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        navigationBar.shadowImage = UIImage()

        let leftButton: UIBarButtonItem = {
            let button = UIBarButtonItem(image: UIImage(named: "soptLogo"), style: .plain, target: self, action: nil)
            return button
        }()
        
        let rightButton: UIBarButtonItem = {
            let button = UIBarButtonItem(title: "프로필 작성하기", style: .done, target: self, action: nil)
            button.setTitleTextAttributes([
                                            NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 13),
                                                NSAttributedString.Key.foregroundColor: UIColor.white], for: .normal)
            button.setBackgroundImage(UIImage(named: "profileBtn"), for: .normal, barMetrics: UIBarMetrics.default)

            return button
        }()
        
        navigationItem.leftBarButtonItem = leftButton
        navigationItem.rightBarButtonItem = rightButton
    }
    
}


