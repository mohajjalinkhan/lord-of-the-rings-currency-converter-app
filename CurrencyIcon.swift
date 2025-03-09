//
//  CurrencyIcon.swift
//  LOTR-App
//
//  Created by Mohajjalin Khan on 05/03/25.
//

import SwiftUI

struct CurrencyIcon: View {
    // currency Img
    var currrencyImage : ImageResource
    let currencyName: String
    var body: some View {
        ZStack(alignment: .bottom){
            //currency Iamge
            Image(currrencyImage)
                .resizable()
                .scaledToFit()
                
            //currency name
            Text(currencyName).padding(3).font(.caption).frame(maxWidth: .infinity).background(.brown.opacity(0.8))
        }.padding(3)
            .frame(width: 100, height: 100)
            .background(.brown)
            .clipShape(.rect(cornerRadius: 25))
    }
}

#Preview {
    CurrencyIcon(currrencyImage: .goldpenny, currencyName: "gold peny")
}
