//
//  SelectCurrency.swift
//  LOTR-App
//
//  Created by Mohajjalin Khan on 05/03/25.
//

import SwiftUI

struct SelectCurrency: View {
    @Environment(\.dismiss) var dismiss
    @Binding var topCurrency : Currency
    @Binding var bottomCurrency : Currency
    var body: some View {
        ZStack{
            //background
            Image(.parchment)
                .resizable()
                .ignoresSafeArea()
                .background(.brown)
            
            VStack{
                //text
                Text("Select the currency your are starting with: ")
                    .fontWeight(.bold)
                    .font(.title2)
                // Icons
                IconGrid(currency: $topCurrency)
               
                Text("Select the currency you would like to convert to:").font(.title3).padding(.top).fontWeight(.bold)
                // Icons
                IconGrid(currency: $bottomCurrency)
                
                // done button
                Button("Done")
                {
                    //code
                    dismiss()
                }
                .buttonStyle(.borderedProminent)
                .tint(.brown.mix(with: .black, by: 0.3))
                .font(.title)
                .foregroundStyle(.white)
                .padding()
            }.padding()
                .multilineTextAlignment(.center)
        }
    }
}

#Preview {
    @Previewable @State var topCurrency : Currency = .silverPenny
    @Previewable @State var bottomCurrency : Currency = .copperPenny
    SelectCurrency(topCurrency:$topCurrency, bottomCurrency: $bottomCurrency)
}
