## ⏺ 1차 세미나

##### **iOS/Swift 기초, Xcode 기본 사용법, View 전환 방법**



#### **📍swift 기초 문법**

- **옵셔널 **이란? <u>안전성</u>을 대표하는 문법. 있을수도, 없을수도 있음을 나타냄.

  Int와 Int?는 철저하게 다른 타입 

- **옵셔널 바인딩**이란? 옵셔널에 값이 있는지 확인할 때 사용 

- ```swift
  var optVar1: Int? = nil
  var optVar2: Int? = 1
  var normalVar: Int? = 1
  
  if var unwrappedVar = optVar2 {
    unwrappedVar = 2
  }
  else {
    optVar2 = 1
  }
  //옵셔널에서 추출한 값을 일정 블록 안에서 사용할 수 있는 상수나 변수로 할당
  //예외사항만을 빠르게 처리하고 싶다면 guard 구문 사용
  ```

  

- **클로저(Closure)** 란? 함수 이름이 없는 익명함수

  ```swift
  /*
  { (매개변수 목록) -> 반환타입 in   .. 반환타입이 없다면 void
      실행 코드
  }
  */
  var optVar1: Int? = nil
  
  var doSomething2 = { (number: Int?) -> Int in
                     guard let unwrappedVar1 = number else {
                       return -1
                     }
                     return unwrappedVar1
  }
  
  doSomething2(optVar1) // -1
  //변수에 할당하여 사용할 수 있다.
  ```



#### **📍View 전환**

- **VC이동**

  ```swift
  //present
  self.present(dvc, animated: true, completion: nil)
  //dismiss
  self.dismiss(animated: true, completion: nil)
  //push
  self.navigationController?.pushViewController(dvc, animated: true)
  //pop
  self.navigationController?.popViewController(animated: true)
  ```

- **VC 데이터 전달**

  ```swift
  @IBAction func touchUpSubmit(_ sender: Any) {
          guard let dvc = self.storyboard?.instantiateViewController(identifier: "ResultViewController") as? ResultViewController else { return
          }
          // 결과 화면에 데이터를 전달
          dvc.email = self.emailTextField.text
          dvc.isAutoUpdate = self.updateStateSwitch.isOn
          dvc.updateInterval = Int(self.updateIntervalStepper.value)
          dvc.modalPresentationStyle = .fullScreen
          self.present(dvc, animated: true, completion: nil)
   }
  ```

  

