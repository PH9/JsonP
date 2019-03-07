import UIKit

class ViewController: UIViewController {

  override func viewDidLoad() {
    super.viewDidLoad()
    UserRequest().call { (result) in
      switch result {
      case .success(let users):
        print(users)
      case .failure(let error):
        print(error)
      }
    }

    // SHOW LOADING DIALOG
    PostsRequest().call { (result) in
      // DISMISS LOADING DIALOG
      switch result {
      case .success(let posts):
        print(posts)
      case .failure(let error):
        print(error)
      }
    }
  }
}

