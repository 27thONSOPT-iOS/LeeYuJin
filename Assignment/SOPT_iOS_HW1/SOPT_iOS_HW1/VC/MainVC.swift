//
//  MainVC.swift
//  SOPT_iOS_HW1
//
//  Created by 이유진 on 2020/10/13.
//

import UIKit

class MainVC: UIViewController {

    @IBOutlet weak var partLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    
    var part: String?
    var name: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        setLabel()
    }
    
    @IBAction func toLogin(_ sender: Any) {
        guard let loginVC = self.storyboard?.instantiateViewController(identifier: "NaviVC") else {
            return
        }
        
        loginVC.modalPresentationStyle = .fullScreen
        self.present(loginVC, animated: true, completion: nil)
    }
    
    func setLabel(){
        if let part = self.part,
           let name = self.name{
            self.partLabel.text = part
            self.nameLabel.text = "\(name)님 안녕하세요!"
        }
        self.partLabel.sizeToFit()
        self.nameLabel.sizeToFit()
        self.nameLabel.textAlignment = .center
    }
    

}
