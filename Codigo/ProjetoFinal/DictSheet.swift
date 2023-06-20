//
//  DictSheet.swift
//  ProjetoFinal
//
//  Created by Student03 on 28/04/23.
//

import SwiftUI

struct DictSheet: View {
    @State var matriz = [1,0,0,0, 0,0]
    @Binding var letra : String
   @State private var dict = Dict()
    var body: some View {
        let columnLayout = Array(repeating:  GridItem() , count: 2)
        if(letra != ""){
            let temp = dict.textToBraille[letra]
            
            VStack {
                HStack{
                    LazyVGrid(columns: columnLayout) {
                        
                        ForEach(0 ... 5, id: \.self) { index in
                            if(temp![index] == 1){
                                Circle()
                                    .frame(width: 30.0, height: 30.0)
                            }else{
                                Circle()
                                    .strokeBorder(.black, lineWidth: 3)
                                    .frame(width: 30.0, height: 30.0)
                                
                            }
                            
                            
                        }
                        
                    }.frame(width: 100, height: 150)
                    
                        .padding()
                    if(temp!.count   > 6){
                        LazyVGrid(columns: columnLayout) {
                            
                            ForEach( 6 ... 11, id: \.self) { index in
                                if(temp![index] == 1){
                                    Circle()
                                        .frame(width: 30.0, height: 30.0)
                                }else{
                                    Circle()
                                        .strokeBorder(.black, lineWidth: 3)
                                        .frame(width: 30.0, height: 30.0)
                                    
                                }
                                
                                
                            }
                        }.frame(width: 100, height: 150)
                        
                            .padding()
                    }
                }
                
                
                Text("\(letra)")
                    .fontWeight(.bold)
                    .multilineTextAlignment(.center)
                    .font(.system(size: 64))
                
//                if(temp!.count == 6){
//                    Button{
//                       
//                    }
//                label:{
//                    Text("Projetar")
//                        .font(.title)
//                        .foregroundColor(Color.white)
//                        .frame(width: 120.0, height: 50.0)
//                        .background(Color.secondary)
//                        .cornerRadius(10.0)
//                }
//                }
                
                
            }
            .padding()
        }
        
    }
}

