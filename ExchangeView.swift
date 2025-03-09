//
//  ExchangeView.swift
//  LOTR-App
//
//  Created by Mohajjalin Khan on 04/03/25.
//

import SwiftUI

struct ExchangeView: View {
    @Environment(\.dismiss) var dismiss
    var body: some View {
        ZStack{
           //background
            Image(.parchment)
                .resizable()
                .ignoresSafeArea()
                .background(.brown)
            VStack{
                // Title
                Text("Exchange Rate")
                    .font(.largeTitle)
                    .tracking(5)
                // Discription
                Text("Here at the Prancing Pony, we are happy to offer you a place where you can exchange all the known currencies in the entire world except one. We used to take Brandy Bucks, but after finding out that it was a person instead of a piece of paper, we realized it had no value to us. Below is a simple guide to our currency exchange rates:")
                    .font(.title3)
                    .padding()
                // 1 exchange rate
                ExchangeRate(leftImage: .goldpiece, text: "1 Gold Piece = 4 Gold Pennies", rightImage: .goldpenny)
                // 2 exchage rate
                ExchangeRate(leftImage: .goldpenny, text: "1 Gold Penny = 4 Silver Pieces", rightImage: .silverpiece)
                // 3 exchange rate
                ExchangeRate(leftImage: .silverpiece, text: "1 Silver Piece = 4 Silver Pennies", rightImage: .silverpenny)
                // 4 exchange rate
                ExchangeRate(leftImage: .silverpiece, text: "1 Silver Penny = 4 Copper Pennies", rightImage: .copperpenny)
                // Done Button
                Button("Done")
                {
                    //code
                    dismiss()
                }
                .buttonStyle(.borderedProminent)
                .tint(.brown.mix(with: .black, by: 0.3))
                .font(.title)
                .foregroundStyle(.white)
                .padding(50)
            }.foregroundStyle(.black)
        }
    }
}

#Preview {
    ExchangeView()
}


