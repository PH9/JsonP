import XCTest
@testable import JsonP

class RequestProtocolTests: XCTestCase {

  struct DummyRequest: RequestProtocol {
    typealias Response = Bool

    let path = "/"
  }

  func test_requestProtocol() {
    let request = DummyRequest()

    XCTAssertEqual(HTTPMethod.get, request.method)
    XCTAssertEqual("/", request.path)
  }
}
