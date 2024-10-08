import Foundation

@Observable
class StateController {
    var pokemon: Pokemon?
    
    init() {
        //guard let url = URL(string: "https://pokeapi.co/api/v2/pokemon/charmander") else {return}
        //initFetch(from: url)
        fetchPokemon(name: "charmander")
    }
    
    func fetchPokemon(name pokemon: String) {
        Task(priority: .low) {
            guard let url = URL(string: "https://pokeapi.co/api/v2/pokemon/\(pokemon.lowercased())") else {return}
            print(url)
            if let rawData = await NetworkService.getData(from: url) {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                do {
                    let jsonResult = try decoder.decode(Pokemon.self, from: rawData)
                    Task {@MainActor in
                        self.pokemon = jsonResult}
                } catch {
                    fatalError("Konverteringen gik ikke så godt")
                }
            }
        }
    }
}

