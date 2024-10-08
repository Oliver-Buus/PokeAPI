//
//  ContentView.swift
//  PokeAPI
//
//  Created by dmu mac 24 on 18/09/2024.
//

import SwiftUI

struct ContentView: View {
    @Environment(StateController.self) var stateController: StateController

    @State private var pokemonToSearchFor: String = ""

    var body: some View {
        VStack {
            TextField("Pokemon name", text: $pokemonToSearchFor)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
                .textInputAutocapitalization(.never)
                .autocorrectionDisabled()

            Button(
                action: {
                    stateController.fetchPokemon(name: pokemonToSearchFor)
                },
                label: {
                    Text("GO")
                        .foregroundStyle(.white)
                        .padding()
                        .background(Color.blue)
                        .clipShape(Capsule())
                })

            if let pokemon = stateController.pokemon {
                VStack {
                    Text(pokemon.name.capitalized)
                        .font(.largeTitle)
                        .padding()

                    AsyncImage(url: pokemon.sprites.frontDefault) { image in
                        image
                            .resizable()
                            .scaledToFit()
                            .frame(maxWidth: 200)
                    } placeholder: { ProgressView() }
                }
            }
            Spacer()
        }
    }
}

#Preview {
    ContentView().environment(StateController())
}
