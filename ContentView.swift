//
//  ContentView.swift
//  LOTR-App
//  Created by Mohajjalin Khan on 03/03/25.
//

import SwiftUI
import TipKit

struct ContentView: View {
    @State var showExchangeInfo = false
    @State var showSeclectedCurrency = false
    //left input field
    @State var leftAmount = ""
    //right input field
    @State var rightAmount = ""
    @FocusState var leftTyping
    @FocusState var rightTyping
    @State var leftCurrency = Currency.goldPiece
    @State var rightCurrency : Currency = .copperPenny
    let currencyTip = CurrencyTip()
    var body: some View {
        ZStack{
            //background Image
            Image(.background)
                .resizable()
                .ignoresSafeArea()
            //currency
            VStack{
                Image(.prancingpony)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 200)
                Text("Currency Exchange")
                    .foregroundStyle(.white)
                    .font(.largeTitle)
                HStack{
                    //left text
                    VStack{
                        HStack{
                            //logo
                            Image(leftCurrency.image)
                                .resizable()
                                .scaledToFit()
                                .frame(height: 40)
                            //text
                            Text(leftCurrency.name).foregroundStyle(.white).font(.headline)
                        }.onTapGesture {
                            showSeclectedCurrency.toggle()
                            currencyTip.invalidate(reason: .actionPerformed)
                        }
                        .padding(.bottom,-5)
                        // Text Field
                        .popoverTip(currencyTip, arrowEdge: .bottom)
                        .task{
                            try? Tips.configure()
                        }
                        TextField("Amount", text: $leftAmount)
                            .textFieldStyle(.roundedBorder)
                            .focused($leftTyping)
                            
                    }
                    // Equal
                    Image(systemName: "equal")
                        .foregroundStyle(.white)
                        .font(.largeTitle)
                        .symbolEffect(.pulse)
                    
                    //right side
                    VStack{
                        HStack{
                            //text
                            Text(rightCurrency.name).foregroundStyle(.white).font(.headline)
                            //logo
                            Image(rightCurrency.image)
                                .resizable()
                                .scaledToFit()
                                .frame(height: 40)
                        }.onTapGesture {
                            showSeclectedCurrency.toggle()
                            currencyTip.invalidate(reason: .actionPerformed)
                        }
                        .padding(.bottom,-5)
                        // Text Field
                        TextField("Amount", text: $rightAmount)
                            .textFieldStyle(.roundedBorder)
                            .multilineTextAlignment(.trailing)
                            .focused($rightTyping)
                            
                    }
                }.keyboardType(.decimalPad)
                .padding()
                .background(.black.opacity(0.5))
//                .clipShape(.capsule)
                Spacer()
                //Info Button
                HStack {
                    Spacer()
                    Button{
                        showExchangeInfo.toggle()
//                        print("button value \(showExchangeInfo)")
                    }label: {
                        // info Image
                        Image(systemName: "info.circle.fill")
                            .foregroundStyle(.white)
                            .font(.largeTitle)
                    }
                }.padding(.trailing)
                    .onChange(of: leftAmount){
                        if leftTyping{
                            rightAmount = leftCurrency.converte(leftAmount, to: rightCurrency)
                        }
                    }
                    .onChange(of: rightAmount){
                        if rightTyping {
                            leftAmount = rightCurrency.converte(rightAmount, to: leftCurrency)
                        }
                    }
                    .onChange(of: leftCurrency){
                        leftAmount = rightCurrency.converte(rightAmount, to: leftCurrency)
                    }
                    .onChange(of: rightCurrency){
                        rightAmount = leftCurrency.converte(leftAmount, to: rightCurrency)
                    }
                    .sheet(isPresented: $showExchangeInfo) {
                        ExchangeView()
                    }
                    .sheet(isPresented: $showSeclectedCurrency){
                        SelectCurrency(topCurrency: $leftCurrency, bottomCurrency: $rightCurrency)
                    }
            }
            //            .border(.blue)
        }
    }
}

#Preview {
    ContentView()
}
