//
//  IconGrid.swift
//  LOTR-App
//
//  Created by Mohajjalin Khan on 07/03/25.
//

import SwiftUI

struct IconGrid: View {
    @Binding var currency: Currency
    
    var body: some View {
        // currency logo
        LazyVGrid(columns: [GridItem(),GridItem(),GridItem()]){
            // using currency enum
            ForEach(Currency.allCases){ currency in
                if self.currency == currency {
                    CurrencyIcon(currrencyImage: currency.image, currencyName: currency.name).shadow(color: .black, radius: 12)
                        .overlay(
                            RoundedRectangle(cornerRadius: 25)
                                .stroke(lineWidth: 3)
                                .opacity(0.5)
                        )
                }else{
                    CurrencyIcon(currrencyImage: currency.image, currencyName: currency.name)
                        .padding(5)
                        .onTapGesture {
                            self.currency = currency
                        }
                }
                
            }
        }
    }
}

#Preview {
    @Previewable @State var sCurrency: Currency = .goldPenny
    IconGrid(currency: $sCurrency)
}
