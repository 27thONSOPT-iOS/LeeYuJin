//
//  CustomTabBarController.swift
//  SOPT_iOS_Seminar4
//
//  Created by 이유진 on 2020/11/07.
//

import UIKit

class CustomTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        setTabBar()
    }
    
    func setTabBar() {
        guard let greenVC = self.storyboard?.instantiateViewController(identifier: "GreenVC") as? GreenVC,
              let blueVC = self.storyboard?.instantiateViewController(identifier: "BlueVC") as? BlueVC
        else { return
        }
        greenVC.tabBarItem.title = "Home"
        greenVC.tabBarItem.image = UIImage(systemName: "house")
        greenVC.tabBarItem.selectedImage = UIImage(systemName: "house.fill")
        blueVC.tabBarItem.title = "Profile"
        blueVC.tabBarItem.image = UIImage(systemName: "person")
        blueVC.tabBarItem.selectedImage = UIImage(systemName: "person.fill")
        setViewControllers([greenVC, blueVC], animated: true) }
}
