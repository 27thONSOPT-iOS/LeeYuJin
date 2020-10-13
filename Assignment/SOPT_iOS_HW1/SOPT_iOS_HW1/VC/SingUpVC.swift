//
//  SingUpVC.swift
//  SOPT_iOS_HW1
//
//  Created by 이유진 on 2020/10/13.
//

import UIKit

class SingUpVC: UIViewController {
    
    @IBOutlet weak var signupButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setButtonUI()
        setNavi()
    }
    
    @IBAction func signupButton(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    func setButtonUI(){
        let width = UIScreen.main.bounds.width/2
        
        signupButton.backgroundColor = UIColor.black
        signupButton.titleLabel?.tintColor = UIColor.yellow
        signupButton.frame = CGRect(x: width - 100, y: 400, width: 200, height: 40)
    }
    
    func setNavi(){
        self.navigationItem.title = "Sign Up"
    }
}
