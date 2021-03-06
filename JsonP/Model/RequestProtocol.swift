import Alamofire

typealias HTTPMethod = Alamofire.HTTPMethod

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
    Alamofire.request("\(Constant.endpoint)\(path)", method: method).responseJSON { (response) in
      guard let data = response.data else {
        result(.failure(.bodyIsNil))
        return
      }

      let decoder = JSONDecoder()
      let dateFormatter = DateFormatter()
      dateFormatter.dateFormat = Constant.dateFormat
      decoder.dateDecodingStrategy = .formatted(dateFormatter)

      guard let object = try? decoder.decode(Response.self, from: data) else {
        result(.failure(.cannotParseJSON))
        return
      }

      result(.success(object))
    }
  }
}
