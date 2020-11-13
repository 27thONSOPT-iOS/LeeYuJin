## ⏺ 4차 과제

##### **TabbarController, Animation 사용해보기 + 도전과제**

<img src="https://user-images.githubusercontent.com/41044154/99085183-3b850080-260b-11eb-9225-6c5f5d5e0a57.png" width="30%" height="30%"><img src="https://user-images.githubusercontent.com/41044154/99085361-6e2ef900-260b-11eb-9c51-9566cf007d01.png" width="30%" height="30%">



##### **📍**TabbarController 사용해보기

```swift
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
        setViewControllers([login, home], animated: true)
    }
```





<img src="https://user-images.githubusercontent.com/41044154/99085436-86067d00-260b-11eb-8977-8bf277b26ded.png" width="30%" height="30%"><img src="https://user-images.githubusercontent.com/41044154/99085471-928ad580-260b-11eb-9988-aa64b1ea13a5.png" width="30%" height="30%">

**📍Animation 사용해보기**

```swift
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
```

```swift
extension LoginAniVC: UITextFieldDelegate{
    func textFieldDidBeginEditing(_ textField: UITextField) {
        setupAni()
    }
    
    func textFieldDidEndEditing(_ textField: UITextField, reason: UITextField.DidEndEditingReason) {
        setdownAni()
    }
    
  //리턴키
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {   //delegate method
        textField.resignFirstResponder()
        return true
    }
}
```

