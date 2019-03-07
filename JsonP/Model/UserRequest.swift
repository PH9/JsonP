import Alamofire

struct UserRequest: RequestProtocol {
  typealias Response = [User]

  let path = "/users"

  func call(_ result: @escaping ([User]) -> Void) {
    Alamofire.request("https://jsonplaceholder.typicode.com/users").responseJSON { (response) in
      guard let data = response.data else {
        fatalError("body is nil")
      }

      guard let users = try? JSONDecoder().decode([User].self, from: data) else {
        fatalError("cannot parse json")
      }

      result(users)
    }
  }
}
