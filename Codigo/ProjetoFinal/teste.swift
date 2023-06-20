//
//  teste.swift
//  ProjetoFinal
//
//  Created by Student03 on 29/04/23.
//

import SwiftUI

struct teste: View {
    @State var  palavra = "oi porta"
    var body: some View {
        HStack{
            ForEach(Array(palavra) , id: \.self){ char in
                TableBraille(letra: "\(char)")
            }
            
        }
    }
}

struct teste_Previews: PreviewProvider {
    static var previews: some View {
        teste()
    }
}
