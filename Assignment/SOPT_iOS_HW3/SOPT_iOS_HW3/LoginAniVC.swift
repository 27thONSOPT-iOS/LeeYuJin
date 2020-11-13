//
//  LoginAniVC.swift
//  SOPT_iOS_HW3
//
//  Created by 이유진 on 2020/11/13.
//

import UIKit

class LoginAniVC: UIViewController {

    @IBOutlet weak var sunImg: UIImageView!
    @IBOutlet weak var partLabel: UILabel!
    @IBOutlet weak var partTextfield: UITextField!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var nameTextfield: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        partTextfield.delegate = self
        nameTextfield.delegate = self
        // Do any additional setup after loading the view.
    }
    
    func setupAni(){
        UIView.animate(withDuration: 0.3, animations: {
            self.sunImg.frame.origin.y -= 70
            self.partTextfield.frame.origin.y -= 70
            self.partLabel.frame.origin.y -= 70
            self.nameTextfield.frame.origin.y -= 70
            self.nameLabel.frame.origin.y -= 70
            
        })
    }
    func setdownAni(){
        UIView.animate(withDuration: 0.3, animations: {
            self.sunImg.frame.origin.y += 70
            self.partTextfield.frame.origin.y += 70
            self.partLabel.frame.origin.y += 70
            self.nameTextfield.frame.origin.y += 70
            self.nameLabel.frame.origin.y += 70
        })
    }
}

extension LoginAniVC: UITextFieldDelegate{
    func textFieldDidBeginEditing(_ textField: UITextField) {
        setupAni()
    }
    
    func textFieldDidEndEditing(_ textField: UITextField, reason: UITextField.DidEndEditingReason) {
        setdownAni()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {   //delegate method
        textField.resignFirstResponder()
        return true
    }
}
