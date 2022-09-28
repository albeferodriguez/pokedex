//
//  PokedexItemList.swift
//  imdb
//
//  Created by Alberto Fernandez-Baillo Rodriguez on 26/9/22.
//

import SwiftUI
import Kingfisher
import SVGKit

struct PokedexItemList: View {

    var pokedexList: [PokemonEntity]?
    @ObservedObject var presenter = PokedexPresenter()

    let columns = [
        GridItem(.fixed(160), spacing: 20),
        GridItem(.fixed(160), spacing: 20)
    ]

    var body: some View {
            ScrollView {
                LazyVGrid(columns: columns) {
                    if let list = pokedexList {
                            ForEach(list) { pokemon in
                                NavigationLink(destination: PokemonDetailView(pokemon: pokemon)) {
                                    VStack {
                                        if let url = pokemon.sprites?.other?.artWork?.frontImage, let name = pokemon.name {
                                            KFImage(URL(string: url))
                                                .resizable()
                                                .aspectRatio(contentMode: .fit)
                                            Text(name)
                                        } //: IF LET
                                    }//: VSTACK
                                    .padding(.bottom, 10)
                                    .background(Color.red)
                                    .cornerRadius(8)
                                }//: NAV LINK
                                .foregroundColor(.white)
                        }//: FOR EACH
                    }//: IF LET
                }//: LAZYVGRID
            }//: SCROLLVIEW
    }
}

struct PokedexItemList_Previews: PreviewProvider {
    static var previews: some View {
        PokedexItemList(pokedexList: [PokemonEntity(id: UUID(), name: "bulbasaur", sprites: nil, types: nil, forms: nil)])
    }
}
