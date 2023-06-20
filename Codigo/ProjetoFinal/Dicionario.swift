//
//  Dicionario.swift
//  ProjetoFinal
//
//  Created by Student23 on 25/04/23.
//

import SwiftUI

struct Dicionario: View
{
    @State private var showingLanguage = false
    @State private var showingCredits = false
    @State private var text1 = "Alfabeto"
    @State  var letraAux = ""
    @State private var text2 = "Brainly  "
    @State private var text3 = ""
    let columns = [
        GridItem(.adaptive(minimum: 80))
    ]
    @State var letras = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v","w", "x", "y","z", "ç", "é"]
    @State var numeros = ["0","1","2","3", "4", "5", "6", "7", "8","9"]
    @State var pontuacao = [",",".","?","!", ":", ";", "-",  "(", ")", "_","@", "[", "]", "+", "&"]
    var body: some View
    
    {
        VStack
        {
            HStack{
                Spacer()
                Text(text1)
                Spacer()
                
                Button {
                    text3 = text1
                    text1 = text2
                    text2 = text3
                    showingLanguage.toggle()
                } label: {
                    Image(systemName: "repeat")
                }.foregroundColor(.gray)
                
                Spacer()
                Text(text2)
                Spacer()
            }.font(.title)
            
            
            ScrollView{
                Spacer()
                Text("Letras")
                    .font(.title)
                    .fontWeight(.semibold)
                    
                if showingLanguage {
                    LazyVGrid(columns: columns, spacing: 20) {
                        ForEach(letras, id: \.self) { letra in
                            Button {
                                showingCredits.toggle()
                                letraAux = letra
                            }
                        label: {
                            TableBraille(letra: letra)
                        }
                        .sheet(isPresented: $showingCredits) {
                            
                            DictSheet(letra: $letraAux)
                        }
                        }
                    }
                    .font(.title)
                    .foregroundColor(.gray)
                    .padding()
                    
                    Text("Números")
                        .font(.title)
                        .fontWeight(.semibold)
                    LazyVGrid(columns: columns, spacing: 20) {
                        ForEach(numeros, id: \.self) { numero in
                            Button {
                                showingCredits.toggle()
                                letraAux = numero
                            }
                        label: {
                            TableBraille(letra: numero)
                        }
                        .sheet(isPresented: $showingCredits) {
                            
                            DictSheet(letra: $letraAux)
                        }
                        }
                    }
                    .font(.title)
                    .foregroundColor(.gray)
                    .padding()
                    
                    Text("Pontuação")
                        .font(.title)
                        .fontWeight(.semibold)
                    LazyVGrid(columns: columns, spacing: 20) {
                        ForEach(pontuacao, id: \.self) { pontuacao in
                            Button {
                                showingCredits.toggle()
                                letraAux = pontuacao
                            }
                        label: {
                            TableBraille(letra: pontuacao)
                        }
                        .sheet(isPresented: $showingCredits) {
                            
                            DictSheet(letra: $letraAux)
                        }
                        }
                    }
                    .font(.title)
                    .foregroundColor(.gray)
                    .padding()
                }
                else {
                    LazyVGrid(columns: columns, spacing: 20) {
                        ForEach(letras, id: \.self) { letra in
                            Button("\(letra)") {
                                showingCredits.toggle()
                                letraAux = letra
                            }
                            .sheet(isPresented: $showingCredits) {
                                DictSheet(letra: $letraAux)
                            }
                        }
                    }
                    .font(.title)
                    .foregroundColor(.gray)
                    .padding(.horizontal)
                    
                    Text("Números")
                        .font(.title)
                        .fontWeight(.semibold)
                    LazyVGrid(columns: columns, spacing: 20) {
                        ForEach(numeros, id: \.self) { numero in
                            Button("\(numero)") {
                                showingCredits.toggle()
                                letraAux = numero
                            }
                    
                        .sheet(isPresented: $showingCredits) {
                            
                            DictSheet(letra: $letraAux)
                        }
                        }
                    }
                    .font(.title)
                    .foregroundColor(.gray)
                    .padding()
                    
                    Text("Pontuação")
                        .font(.title)
                        .fontWeight(.semibold)
                    LazyVGrid(columns: columns, spacing: 20) {
                        ForEach(pontuacao, id: \.self) { pontuacao in
                            Button ("\(pontuacao)") {
                                showingCredits.toggle()
                                letraAux = pontuacao
                            }
                        .sheet(isPresented: $showingCredits) {
                            
                            DictSheet(letra: $letraAux)
                        }
                        }
                    }
                    .font(.title)
                    .foregroundColor(.gray)
                    .padding()
                }
            }
            .padding(.top, 60.0)
            
            Spacer()
            
        }
        
        
        
        
        
    }
    
}

struct Dicionario_Previews: PreviewProvider {
    static var previews: some View {
        Dicionario()
    }
}
