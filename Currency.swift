//
//  Currency.swift
//  LOTR-App
//
//  Created by Mohajjalin Khan on 06/03/25.
//
//  currency value
import SwiftUI
// make enum to collection useing CaseIterable for in (ForEach Loop)
enum Currency : Double, CaseIterable, Identifiable{
    case goldPiece = 1
    case goldPenny = 4
    case silverPiece = 16
    case silverPenny = 64
    case copperPenny = 6400
    // using unique values for identity
    var id: Currency { self}
    // computing porperty
    // seting currency price with currency image
    var image : ImageResource {
        switch self {
        case .copperPenny:
                .copperpenny
        case .silverPenny:
                .silverpenny
        case .goldPenny:
                .goldpenny
        case .silverPiece:
                .silverpiece
        case .goldPiece:
                .goldpiece
        }
    }
    //seting currency names
    var name: String{
        switch self {
        case .goldPiece:
            "Gold Piece"
        case .goldPenny:
            "Gold Penny"
        case .silverPiece:
            "Sliver Piece"
        case .silverPenny:
            "Silver Penny"
        case .copperPenny:
            "Copper Penny"
        }
        
    }
    // amount converstion function
    func converte(_ amountString: String,to currency : Currency) -> String {
        guard let doubleAmount = Double(amountString) else{
            return ""
        }
        let convertedDoubleAmount = (doubleAmount / self.rawValue) * currency.rawValue
        
        
        return String(format:"%.2f", convertedDoubleAmount)
    }
}
