//
//  TableBraille.swift
//  ProjetoFinal
//
//  Created by Student03 on 28/04/23.
//

import SwiftUI

struct TableBraille: View {
    @State var letra : String
    @State private var dict = Dict()
    var body: some View {
        let columnLayout = Array(repeating:  GridItem() , count: 2)
        
        if(letra == "" || letra == " " ){
            Text("")
        }else{
            
            let temp = dict.textToBraille[letra.lowercased()]
            let size = temp?.count ?? 0
            
            
            
            VStack{
                if(size > 0){
                    HStack{
                        LazyVGrid(columns: columnLayout){
                            ForEach(0 ... 5, id: \.self) { index in
                                if(temp![index] == 1){
                                    Circle()
                                        .frame(width: 15.0, height: 15.0)
                                }else{
                                    Circle()
                                        .strokeBorder(.black, lineWidth: 3)
                                        .frame(width: 15.0, height: 15.0)
                                    
                                }
                                
                                
                            }
                            .padding(.leading, 5.0)
                        }.padding(0.0).frame(width: 50, height: 150)
                        
                        if(size  > 6){
                            LazyVGrid(columns: columnLayout) {
                                
                                ForEach( 6 ... 11, id: \.self) { index in
                                    if(temp![index] == 1){
                                        Circle()
                                            .frame(width: 15.0, height: 15.0)
                                    }else{
                                        Circle()
                                            .strokeBorder(.black, lineWidth: 3)
                                            .frame(width: 15.0, height: 15.0)
                                        
                                    }
                                    
                                    
                                }
                            }.frame(width: 50, height: 150)
                            
                            
                        }
                        
                    }
                    .padding(.trailing)
                }
            }
            
        }
            
        }
    
}

struct TableBrailleTeste: View {
    @Binding var letra : String
    @State private var dict = Dict()
    var body: some View {
        let columnLayout = Array(repeating:  GridItem() , count: 2)
        
        if(letra == "" || letra == " " ){
            Text("")
        }else{
            
            let temp = dict.textToBraille[letra.lowercased()]
            let size = temp?.count ?? 0
            
            
            
            VStack{
                if(size > 0){
                    HStack{
                        LazyVGrid(columns: columnLayout){
                            ForEach(0 ... 5, id: \.self) { index in
                                if(temp![index] == 1){
                                    Circle()
                                        .frame(width: 15.0, height: 15.0)
                                }else{
                                    Circle()
                                        .strokeBorder(.black, lineWidth: 3)
                                        .frame(width: 15.0, height: 15.0)
                                    
                                }
                                
                                
                            }
                            .padding(.leading, 5.0)
                        }.padding(0.0).frame(width: 50, height: 150)
                        
                        if(size  > 6){
                            LazyVGrid(columns: columnLayout) {
                                
                                ForEach( 6 ... 11, id: \.self) { index in
                                    if(temp![index] == 1){
                                        Circle()
                                            .frame(width: 15.0, height: 15.0)
                                    }else{
                                        Circle()
                                            .strokeBorder(.black, lineWidth: 3)
                                            .frame(width: 15.0, height: 15.0)
                                        
                                    }
                                    
                                    
                                }
                            }.frame(width: 50, height: 150)
                            
                            
                        }
                        
                    }
                    .padding(.trailing)
                }
            }
            
        }
            
        }
    
}

struct TableBraille_Previews: PreviewProvider {
    static var previews: some View {
        TableBraille(letra : "8")
    }
}
