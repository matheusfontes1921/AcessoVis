//
//  NavBar.swift
//  ProjetoFinal
//
//  Created by Student23 on 26/04/23.
//

import SwiftUI

struct NavBar: View {
    @State private var selection = 0
    var body: some View {
        TabView(selection: $selection)
        {
            Dicionario()
                .tabItem()
            {
                VStack{
                    Image(systemName: "books.vertical.fill")
                    Text("Dicionário")
                }
            }.tag(1)
            
            TradutorGeral()
                .tabItem()
                {
                    VStack{
                        Image(systemName: "t.bubble")
                            
                        Text("Tradutor")
                            
                    }
                }.tag(0)
            
            Quiz(resposta: "a", opcoes: ["a","e","g","o"])
                .tabItem()
                {
                    VStack{
                        Image(systemName: "pencil")
                        Text("Quiz")
                    }
                }.tag(2)
            
        }.foregroundColor(.gray)
        
    }
    
}

struct NavBar_Previews: PreviewProvider {
    static var previews: some View {
        NavBar()
    }
}
