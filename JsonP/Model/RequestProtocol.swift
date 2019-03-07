import Alamofire

typealias HTTPMethod = Alamofire.HTTPMethod

protocol RequestProtocol {
  associatedtype Response

  var method: HTTPMethod { get }
  var path: String { get }

  func call(_ result: @escaping (Response) -> Void)
}

extension RequestProtocol where Response: Decodable {
  var method: HTTPMethod {
    return .get
  }

  func call(_ result: @escaping (Response) -> Void) {
    Alamofire.request("https://jsonplaceholder.typicode.com\(path)", method: method).responseJSON { (response) in
      guard let data = response.data else {
        fatalError("body is nil")
      }

      let decoder = JSONDecoder()
      let dateFormatter = DateFormatter()
      dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
      decoder.dateDecodingStrategy = .formatted(dateFormatter)

      guard let users = try? decoder.decode(Response.self, from: data) else {
        fatalError("cannot parse json")
      }

      result(users)
    }
  }
}
