//
//  TabBarCV.swift
//  SOPT_iOS_HW3
//
//  Created by 이유진 on 2020/11/13.
//

import UIKit

class TabBarCV: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setTabBar()
    }
    
    func setTabBar() {
        guard let home = self.storyboard?.instantiateViewController(identifier: "homenavi"),
              let login = self.storyboard?.instantiateViewController(identifier: "loginnavi")
        else { return
        }
        home.tabBarItem.title = "Home"
        home.tabBarItem.image = UIImage(systemName: "house")
        home.tabBarItem.selectedImage = UIImage(systemName: "house.fill")
        login.tabBarItem.title = "Profile"
        login.tabBarItem.image = UIImage(systemName: "person")
        login.tabBarItem.selectedImage = UIImage(systemName: "person.fill")
        setViewControllers([login, home], animated: true) }

}
