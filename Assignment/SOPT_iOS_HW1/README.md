## ⏺ 1차 과제

##### **Present, Push, Pop 사용해보기 + 도전과제**

![](<img src="../../img/week1_1.png" width="30%" height="30%">)![](<img src="../../img/week1_2.png" width="30%" height="30%">)![](<img src="../../img/week1_3.png" width="30%" height="30%">)



##### **📍**Present, Push, Pop 사용해보기

```swift
//MainVC 로그인 버튼(MainVC -> LoginVC) present
self.present(loginVC, animated: true, completion: nil)

//LoginVC 로그인 버튼(LoginVC -> MainVC) dismiss
self.presentingViewController?.dismiss(animated: true)

//LoginVC 회원가입 버튼(LoginVC -> SignupVC) push
self.navigationController?.pushViewController(signupVC, animated: true)

//SignupVC 회원가입 버튼(SignupVC -> LoginVC) pop
self.navigationController?.popViewController(animated: true)
```



**📍도전과제 - 로그인 후 메인화면 업데이트**  

![](<img src="../../img/week1_4.png" width="30%" height="30%">)![](<img src="../../img/week1_5.png" width="30%" height="30%">)

- **LoginVC**

  ```swift
  @IBAction func loginButton(_ sender: Any) {
          let preVC = self.presentingViewController //이전(MainVC) 뷰컨트롤러
          
          guard let mainVC = preVC as? MainVC else { return }
          
          mainVC.part = self.partTextField.text
          mainVC.name = self.nameTextField.text
          
          self.presentingViewController?.dismiss(animated: true)
      }
  ```

  **🔹presentingViewController** 는 자신을 호출한 ViewController

  

- **MainVC**

  ```swift
  override func viewWillAppear(_ animated: Bool) { 
    setLabel()
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
  ```

  **🔹메인화면 업데이트를 위해 **viewDidLoad가 아닌 viewWillAppear에서 호출**해줘야만 한다! 

  **🔹viewDidLoad() 메소드를 사용하지 않는 이유는 **화면이 생성되고 최초 한번만 호출**되기 때문이다.