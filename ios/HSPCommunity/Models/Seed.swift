import Foundation

struct Seed: Decodable, Identifiable {
    let id: Int
    let username: String
    let text: String
    let favorite: Int
    let comment: Int
    let tag: Tag
}

enum Tag: String, Decodable {
    case help = "help"
    case tweet = "tweet"
}
