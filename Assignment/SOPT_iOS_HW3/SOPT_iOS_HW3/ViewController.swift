//
//  ViewController.swift
//  SOPT_iOS_HW3
//
//  Created by 이유진 on 2020/11/03.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDataSource {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setStatus()
        collectionView.delegate = self
        collectionView.dataSource = self
//        self.navigationController?.hidesBarsOnSwipe = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        setupNavi()
    }

}

extension ViewController {
    
    func setStatus(){
        if #available(iOS 13.0, *) {
            var statusBarHeight: CGFloat = 0
            let margin = view.layoutMarginsGuide
            if let window = UIApplication.shared.windows.first(where: { $0.isKeyWindow }) {
                statusBarHeight = window.windowScene?.statusBarManager?.statusBarFrame.height ?? 0
                print(statusBarHeight)
            }
            // height를 구하고,
            
            let statusbarView = UIView()
            statusbarView.backgroundColor = UIColor.black
            
            statusbarView.frame = CGRect.zero
            view.addSubview(statusbarView)
            statusbarView.translatesAutoresizingMaskIntoConstraints = false
            // frame 선언
            
            NSLayoutConstraint.activate([
                statusbarView.topAnchor.constraint(equalTo: view.topAnchor),
                statusbarView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1.0),
                statusbarView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                statusbarView.bottomAnchor.constraint(equalTo: margin.topAnchor)
            ])
        }
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

extension ViewController: UICollectionViewDelegate {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 0{
            return 1
        } else{
            return 12
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch indexPath.section {
        case 0:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "BannerCell", for: indexPath)
            return cell
        case 1:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "InfoCell", for: indexPath)
            return cell
        default:
            assert(false, "Invaild element Type")
        }
    }
}

extension ViewController: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if indexPath.section == 0 {
            let width = self.view.bounds.width
            return CGSize(width: width, height: width)
        }
        else{
            let width = (self.view.bounds.width - 75) / 2
            let divisor = pow(10.0, CGFloat(1))
            let roundedWidth = (width * divisor).rounded() / divisor
            let roundedHeight = roundedWidth * (208 / 160)
            return CGSize(width: roundedWidth, height: roundedHeight)
            
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        if section == 0 {
            return 0
        } else{
            return 24
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        if section == 0 {
            return 0
        } else{
            return 25
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        if section == 0 {
            return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        } else{
            return UIEdgeInsets(top: 10, left: 20, bottom: 10, right: 20)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        if section == 0 {
            return CGSize.zero
        } else{
            return CGSize(width: self.view.bounds.width, height: 40)
        }
    }
}
