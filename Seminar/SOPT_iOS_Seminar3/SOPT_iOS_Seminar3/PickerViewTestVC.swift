//
//  PickerViewTestVC.swift
//  SOPT_iOS_Seminar3
//
//  Created by 이유진 on 2020/10/31.
//

import UIKit

class PickerViewTestVC: UIViewController {

    @IBOutlet weak var partImgView: UIImageView!
    @IBOutlet weak var partNameLabel: UILabel!
    @IBOutlet weak var partPickerView: UIPickerView!
    
    var parts: [Part] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setPartDate()
        initLayout()
        partPickerView.dataSource = self
        partPickerView.delegate = self
    }
    
    func setPartDate() {
        parts.append(contentsOf: [
            Part(imageName: "plan", partName: "Plan"),
            Part(imageName: "design", partName: "Design"),
            Part(imageName: "server", partName: "Server"),
            Part(imageName: "ios", partName: "iOS"),
            Part(imageName: "android", partName: "Android"),
            Part(imageName: "web", partName: "Web")
        ])
    }
    
    func initLayout() {
        let initPart = parts[0]
        partImgView.image = initPart.makeImage()
        partNameLabel.text = initPart.partName
        
    }

}

extension PickerViewTestVC: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView,
                    titleForRow row: Int,
                    forComponent component: Int) -> String? {
        // PickerView의 각 행(row)의 title을 지정해주는 메소드
        
        return parts[row].partName
    }
    func pickerView(_ pickerView: UIPickerView,
                    didSelectRow row: Int,
                    inComponent component: Int) {
        // PickerView에서 행(row)를 선택했을 때 수행할 동작을 지정해 주는 메소드
        let selectPart = parts[row] // 이미지 지정
        self.partImgView.image = selectPart.makeImage() // 라벨 지정
        self.partNameLabel.text = selectPart.partName
    }
}

extension PickerViewTestVC: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
    // PickerView의 컴포넌트 숫자를 지정해 주는 메소드
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
    // PickerView의 각 컴포넌트에서 행의 개수를 지정해 주는 메소드
        return parts.count
    }
}

