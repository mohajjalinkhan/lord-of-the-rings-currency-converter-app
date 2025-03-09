//
//  CurrencyTip.swift
//  LOTR-App
//
//  Created by Mohajjalin Khan on 08/03/25.
//

import TipKit

struct CurrencyTip:Tip {
    var title = Text("Change Currency")
    var message: Text? = Text("You can select Currency by Tapping left or righ currency logo.")
    var image: Image? = Image(systemName: "hand.tap.fill")
    
    
}
