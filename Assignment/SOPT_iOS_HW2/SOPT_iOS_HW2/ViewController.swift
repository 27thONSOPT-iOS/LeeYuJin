//
//  ViewController.swift
//  SOPT_iOS_HW2
//
//  Created by 이유진 on 2020/10/29.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var bannerImg: UIImageView!
    
    let toTopBut: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("TOP", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .systemYellow
        button.frame.size.equalTo(CGSize(width: 100, height: 100))
//        button.layer.cornerRadius =  button.frame.size.height / 2
        button.addTarget(self, action: #selector(topButton), for: .allTouchEvents)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavi()
        setTopBut()
        setStatus()
        scrollView.delegate = self
    }

    
    @objc
    func topButton(){
        self.scrollView.scrollToTop(animated: true)
    }
    
    func setStatus(){
        if #available(iOS 13.0, *) {
            let app = UIApplication.shared
            
            let statusbarView = UIView()
            statusbarView.backgroundColor = UIColor.black
            view.addSubview(statusbarView)
          
            statusbarView.translatesAutoresizingMaskIntoConstraints = false
            statusbarView.heightAnchor
                .constraint(equalToConstant: app.statusBarFrame.size.height).isActive = true
            statusbarView.widthAnchor
                .constraint(equalTo: view.widthAnchor, multiplier: 1.0).isActive = true
            statusbarView.topAnchor
                .constraint(equalTo: view.topAnchor).isActive = true
            statusbarView.centerXAnchor
                .constraint(equalTo: view.centerXAnchor).isActive = true
          
        } else {
            let statusBar = UIApplication.shared.value(forKeyPath: "statusBarWindow.statusBar") as? UIView
            statusBar?.backgroundColor = UIColor.black
        }
    }
    
    func setTopBut(){
        contentView.addSubview(toTopBut)
        
        NSLayoutConstraint.activate([
            toTopBut.bottomAnchor.constraint(equalTo: scrollView.frameLayoutGuide.bottomAnchor, constant: -30),
            toTopBut.trailingAnchor.constraint(equalTo: scrollView.frameLayoutGuide.trailingAnchor, constant: -30)
        ])
        
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

extension ViewController: UIScrollViewDelegate{
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if scrollView.contentOffset.y > bannerImg.bounds.height {
            toTopBut.isHidden = false
        }
        else{
            toTopBut.isHidden = true
        }
    }
    
}
extension UIScrollView {

    func scrollToView(view:UIView, animated: Bool) {
        if let origin = view.superview {
            let childStartPoint = origin.convert(view.frame.origin, to: self)
            self.scrollRectToVisible(CGRect(x:0, y:childStartPoint.y,width: 1,height: self.frame.height), animated: animated)
        }
    }

    func scrollToTop(animated: Bool) {
        let topOffset = CGPoint(x: 0, y: -contentInset.top)
        setContentOffset(topOffset, animated: animated)
    }

    func scrollToBottom() {
        let bottomOffset = CGPoint(x: 0, y: contentSize.height - bounds.size.height + contentInset.bottom)
        if(bottomOffset.y > 0) {
            setContentOffset(bottomOffset, animated: true)
        }
    }

}


