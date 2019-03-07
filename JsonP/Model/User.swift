struct User: Decodable {
  let id: Int
  let name: String
  let address: Address
}

struct Address: Decodable {
  let street: String
  let geo: Geo
}

struct Geo: Decodable {
  let lat: String
  let lng: String
}
