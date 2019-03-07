import UIKit

class ViewController: UIViewController {

  override func viewDidLoad() {
    super.viewDidLoad()
    UserRequest().call { (users) in
      print(users)
    }

    PostsRequest().call { (posts) in
      print(posts)
    }
  }
}

