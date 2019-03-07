struct PostsRequest: RequestProtocol {
  typealias Response = [Post]

  let path: String = "/posts"
}
