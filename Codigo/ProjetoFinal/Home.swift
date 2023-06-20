//
//  Home.swift
//  ProjetoFinal
//
//  Created by Student23 on 25/04/23.
//

import SwiftUI

struct Home: View
{
    var body: some View
    {
        
        NavigationStack
        {
            ZStack
            {
                VStack
                {
                    
                    Text("Acesso Vis") 
                        .font(.largeTitle)
                        .fontWeight(.bold)
                    Spacer()
                    
                    ImgByUrl(url : "https://st4.depositphotos.com/3457475/21626/i/450/depositphotos_216264886-stock-photo-widely-open-eye-vintage-ink.jpg", width: 200.0, height: 150.0)
                    
                    NavigationLink(destination: Tradutor())
                    {
                        Text("Sou Deficiente Visual")
                    }
                    .frame(width: 360, height: 60.0)
                    .background(.gray)
                    .foregroundColor(.white)
                    .font(.title)
                    .bold()
                    
                    NavigationLink(destination: NavBar())
                    {
                        Text("Quero aprender")
                    }
                    .frame(width: 360, height: 60.0)
                    .background(.gray)
                    .foregroundColor(.white)
                    .font(.title)
                    .bold()
                    Spacer()
                }

            }
            
        }
        .padding()
        
    }
    
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
