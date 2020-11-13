//
//  LoginVC.swift
//  SOPT_iOS_HW3
//
//  Created by 이유진 on 2020/11/13.
//

import UIKit

class LoginVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func loginBut(_ sender: Any) {
        guard let loginVC = self.storyboard?.instantiateViewController(identifier: "LoginAniVC") else {
            return
        }
        loginVC.modalPresentationStyle = .fullScreen
        self.present(loginVC, animated: true, completion: nil)
    }
}
