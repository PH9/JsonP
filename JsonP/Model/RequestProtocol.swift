protocol RequestProtocol {
  associatedtype Response

  var path: String { get }

  func call(_ result: @escaping (Response) -> Void)
}
