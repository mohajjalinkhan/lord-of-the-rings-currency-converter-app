//
//  ExchangeRate.swift
//  LOTR-App
//
//  Created by Mohajjalin Khan on 05/03/25.
//
import SwiftUI
// created reuseble View
struct ExchangeRate: View {
    let leftImage: ImageResource
    let text:String
    let rightImage: ImageResource
    var body: some View {
        HStack{
            // left currency Image
            Image(leftImage).resizable().scaledToFit().frame(height: 35)
            // currency info exchange rate text
            Text(text)
            // right currency Image
            Image(rightImage).resizable().scaledToFit().frame(height: 35)
        }
    }
}

