//
//  ViewController.swift
//  SOPT_iOS_First Seminar
//
//  Created by 이유진 on 2020/10/10.
//

import UIKit

class ViewController: UIViewController {


    @IBOutlet weak var helloLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func actionClick(_ sender: Any) {
        helloLabel.text = "안녕하세요"
        helloLabel.sizeToFit() // 텍스트 크기만큼 라벨의 크기가 변경됨.
    }
    @IBAction func toSecondVC(_ sender: Any) {
        guard let dvc = self.storyboard?.instantiateViewController(identifier: "SecondViewController") else {
            return
        }
//        self.present(dvc, animated: true, completion: nil)
        self.navigationController?.pushViewController(dvc, animated: true)
    }
    
}

