//
//  ContentView.swift
//  Wallet
//
//  Created by Sameer Mungole on 8/16/23.
//

import SwiftUI

struct ContentView: View {
    @State private var name: String = ""
    @State private var bank: String = ""
    @State private var cardType: CardType = .visa
    @State private var cardNumber: String = ""
    @State private var secureCode: String = ""
    @State private var date = Date()
    
    let cardTypes = ["VISA", "Mastercard", "Amex", "Discover"]
    
    let colors: [Color] = [.blue, .pink, .green, .gray]
    @State private var selectedColorIndex = 0
    
    var body: some View {
        NavigationView{
            Form{
                Section("Signature"){
                    TextField("Card Holder Name", text: $name)
                    TextField("Bank", text: $bank)
                    Picker("Card Type", selection: $cardType){
                        ForEach(CardType.allCases, id: \.self){ cardType in
                            Text(cardType.rawValue).tag(cardType)
                        }
                    }.pickerStyle(.automatic)
                }
                Section("Details"){
                    TextField("Card Number", text: $cardNumber)
                    TextField("Secure Code", text: $secureCode)
                    DatePicker(
                        "Valid Through",
                        selection: $date,
                        displayedComponents: [.date]
                    ).datePickerStyle(.compact)
                }
                Section("Card Color"){
                    HStack {
                        ForEach(0..<colors.count) { index in
                            Circle()
                                .fill(self.colors[index])
                                .onTapGesture {
                                    self.selectedColorIndex = index
                                }
                                .overlay(
                                    Circle()
                                        .stroke(Color.black, lineWidth: self.selectedColorIndex == index ? 2 : 0)
                                )
                                .padding()
                        }
                    }
                }
                NavigationLink(destination: CardDisplayView(cardDetails: CardDetails(holderName: name, bank: bank, type: cardType, number: cardNumber, validity: date, secureCode: secureCode, color: colors[selectedColorIndex]))) {
                        Text("Add Card to Wallet")
                    }
            }
        }.navigationTitle("Add Card")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
