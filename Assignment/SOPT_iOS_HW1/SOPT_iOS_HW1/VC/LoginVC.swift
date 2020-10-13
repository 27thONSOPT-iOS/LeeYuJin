//
//  LoginVC.swift
//  SOPT_iOS_HW1
//
//  Created by 이유진 on 2020/10/13.
//

import UIKit

class LoginVC: UIViewController {

    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var signupButton: UIButton!
    
    @IBOutlet weak var partTextField: UITextField!
    @IBOutlet weak var nameTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setButtonUI()
        setNavi()
    }
    
    @IBAction func loginButton(_ sender: Any) {
        let preVC = self.presentingViewController
        
        guard let mainVC = preVC as? MainVC else { return }
        
        mainVC.part = self.partTextField.text
        mainVC.name = self.nameTextField.text
        
        self.presentingViewController?.dismiss(animated: true)
    }
    
    @IBAction func signupButton(_ sender: Any) {
        guard let signupVC = self.storyboard?.instantiateViewController(identifier: "SingUpVC") else { return }
        
        self.navigationController?.pushViewController(signupVC, animated: true)
    }
    
    func setButtonUI(){
        let width = UIScreen.main.bounds.width/2
        
        loginButton.backgroundColor = UIColor.black
        loginButton.titleLabel?.tintColor = UIColor.yellow
        loginButton.frame = CGRect(x: width - 100, y: 350, width: 200, height: 40)
        
        signupButton.backgroundColor = UIColor.black
        signupButton.titleLabel?.tintColor = UIColor.yellow
        signupButton.frame = CGRect(x: width - 100, y: 400, width: 200, height: 40)
    }
    
    func setNavi(){
        self.navigationItem.title = "Login"
    }
}
