//
//  ContentView.swift
//  ProjetoFinal
//
//  Created by Student23 on 25/04/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View
    {
        NavigationStack
        {
                VStack
                {
                    Text("")
                    Text("")
                    Text("AcessoVis")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(.blue)
                    Spacer()
                    
                    ImgByUrl(url : "https://i.pinimg.com/736x/8b/c9/72/8bc972bfd4ce98ffcafab17bd6353a36.jpg", width: 200.0, height: 150.0)
                    Text(" ")
                    NavigationLink(destination: Tradutor())
                    {
                        Text("Sou Deficiente Visual")
                    }
                    .frame(width: 360, height: 60.0)
                    .background(.blue)
                    .foregroundColor(.white)
                    .font(.title)
                    .bold()
                    .cornerRadius(10.0)
                    
                    NavigationLink(destination: NavBar())
                    {
                        Text("Quero aprender")
                    }
                    .frame(width: 360, height: 60.0)
                    .background(.blue)
                    .foregroundColor(.white)
                    .font(.title)
                    .bold()
                    .cornerRadius(10.0)
                    
                    Spacer()
                }

            }
            
        }
    
        
    }

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
