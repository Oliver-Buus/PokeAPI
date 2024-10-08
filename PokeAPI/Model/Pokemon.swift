import Foundation

struct Pokemon: Codable {
    let name: String
    let sprites: Sprite
    
    struct Sprite: Codable {
        let frontDefault: URL
    }
}
