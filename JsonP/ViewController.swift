import UIKit

class ViewController: UIViewController {

  override func viewDidLoad() {
    super.viewDidLoad()
    UserRequest().call { (users) in
      print(users)
    }
  }
}

