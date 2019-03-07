struct User: Encodable {
  let id: Int
  let name: String
  let address: Address
}

struct Address: Encodable {
  let street: String
  let geo: Geo
}

struct Geo: Encodable {
  let lat: String
  let lng: String
}
