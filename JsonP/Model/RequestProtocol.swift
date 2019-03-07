import Alamofire

typealias HTTPMethod = Alamofire.HTTPMethod

enum RequestError: Error {
  case bodyIsNil
  case cannotParseJSON
}

protocol RequestProtocol {
  associatedtype Response

  var method: HTTPMethod { get }
  var path: String { get }

  func call(_ result: @escaping (Result<Response>) -> Void)
}

extension RequestProtocol where Response: Decodable {
  var method: HTTPMethod {
    return .get
  }

  func call(_ result: @escaping (Result<Response>) -> Void) {
    Alamofire.request("https://jsonplaceholder.typicode.com\(path)", method: method).responseJSON { (response) in
      guard let data = response.data else {
        result(.failure(.bodyIsNil))
        return
      }

      let decoder = JSONDecoder()
      let dateFormatter = DateFormatter()
      dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
      decoder.dateDecodingStrategy = .formatted(dateFormatter)

      guard let object = try? decoder.decode(Response.self, from: data) else {
        result(.failure(.cannotParseJSON))
        return
      }

      result(.success(object))
    }
  }
}
