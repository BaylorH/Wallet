//
//  CardDisplayView.swift
//  Wallet
//
//  Created by Baylor Harrison on 2/11/24.
//

import SwiftUI

struct CardDisplayView: View {
    var cardDetails: CardDetails

    var body: some View {
        VStack {
            Rectangle()
                    .fill(cardDetails.color)
                    .frame(width: 300, height: 200)
                    .overlay(
                        VStack(alignment: .leading, spacing: 5) {
                            HStack{
                                Text("\(cardDetails.bank)")
                                Spacer()
                                Text("\(cardDetails.type.rawValue)")
                            }
                            Spacer()
                            Text("\(cardDetails.holderName)")
                            HStack{
                                Text("\(cardDetails.formattedValidity)")
                                Text("\(cardDetails.secureCode)")
                            }
                            Text("\(cardDetails.number)")
                        }
                        .padding()
                    )
                    .cornerRadius(10)
        }
        .navigationBarTitle("Card Details")
    }
}

#Preview {
    CardDisplayView(cardDetails: CardDetails())
}
