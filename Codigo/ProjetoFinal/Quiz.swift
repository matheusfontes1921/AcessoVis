//
//  Quiz.swift
//  ProjetoFinal
//
//  Created by Student23 on 25/04/23.
//

import SwiftUI

struct Quiz: View {
    @State private var alternativas = ["a)","b)", "c)","d)"]
    //@State private var num = [0,1,2,3]
    @State var resposta : String
    @State var opcoes : [String] = []
    @State private var showingAlert = false
    @State private var acertou = false
    
    var digitos = ["a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z","0","1","2","3","4","5","6","7","8","9",]
    
    var body: some View {
        let columnLayout = Array(repeating:  GridItem() , count: 2)
        VStack
        {
            Spacer()
            TableBrailleTeste(letra: $resposta)
            Spacer()
            
            Text("Qual é a resposta?")
                .font(.title)
                .fontWeight(.semibold)
                .padding(.bottom, 15.0)
                .foregroundColor(.blue)
            
            LazyVGrid(columns: columnLayout){
                
                ForEach(Array(alternativas.enumerated()), id: \.offset){ index, element in
                    Button {
                        if(opcoes[index] == resposta){
                            acertou = true
                        }
                        else{
                            acertou = false
                        }
                        
                        showingAlert = true
                        
                    }
                label: {
                    Text("\(element) \(opcoes[index])")
                        .font(.title)
                        .foregroundColor(Color.white)
                        .frame(width: 100.0, height: 50.0)
                        .background(Color.blue)
                        .cornerRadius(10.0)
                }
                .alert(acertou ? "Parabés, você acertou" : "Errou", isPresented: $showingAlert) {
                            Button("OK", role: .cancel) {
                                if acertou
                                {
                                    GerarQuestao()
                                }
                                
                            }
                        }
                }
            }
            
            Spacer()
            
        }
        .onAppear(){
            GerarQuestao()
        }
        
    }
    
    func GerarQuestao()
    {
        var possiveisRespostas = digitos
        opcoes.removeAll()
        
        resposta = digitos[Int.random(in: 0..<digitos.count)]
        
        
        for i in 0...2{

                let ind = Int.random(in: 0..<possiveisRespostas.count)
                opcoes.append(possiveisRespostas[ind])
                
                possiveisRespostas.remove(at: ind)
            
        }
        
        opcoes.append(resposta)
        opcoes.shuffle()
    }
    
    
}

struct Quiz_Previews: PreviewProvider {
    static var previews: some View {
        Quiz(resposta: "a", opcoes: ["a","e","g","o"])
    }
}
