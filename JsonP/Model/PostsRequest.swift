import Alamofire

struct PostsRequest: RequestProtocol {
  typealias Response = [Post]

  let path: String = "/posts"

  func call(_ result: @escaping (Response) -> Void) {
    Alamofire.request("https://jsonplaceholder.typicode.com\(path)").responseJSON { (response) in
      guard let data = response.data else {
        fatalError("body is nil")
      }

      guard let users = try? JSONDecoder().decode(Response.self, from: data) else {
        fatalError("cannot parse json")
      }

      result(users)
    }
  }
}
