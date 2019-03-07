struct UserRequest: RequestProtocol {
  typealias Response = [User]

  let path = "/users"
}
