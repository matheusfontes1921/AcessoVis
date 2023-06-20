//
//  ImgByUrl.swift
//  ProjetoFinal
//
//  Created by Student03 on 29/04/23.
//

import SwiftUI

struct ImgByUrl: View {
    @State var url : String?
    @State var width : Double
    @State var height : Double
    var body: some View {
        AsyncImage(url: URL(string: url!) ){ image in
            image
                .resizable()
                
        } placeholder: {
            Color.blue
        }
        .frame(width: width, height: height)
    }
}

struct ImgByUrl_Previews: PreviewProvider {
    static var previews: some View {
        ImgByUrl(url: "https://www.google.com/url?sa=i&url=https%3A%2F%2Fbr.pinterest.com%2Fpin%2F633178028846328666%2F&psig=AOvVaw1zEMniDNk_678v9wjtcGJe&ust=1683822570838000&source=images&cd=vfe&ved=0CA4QjRxqFwoTCKDU14uW6_4CFQAAAAAdAAAAABAEg", width: 100, height: 200)
    }
}
