//
//  CardDetails.swift
//  Wallet
//
//  Created by Sameer Mungole on 7/28/23.
//

import SwiftUI

struct Colors {
    static let black = Color(red: 38 / 255, green: 40 / 255, blue: 41 / 255)
    static let blue = Color(red: 44 / 255, green: 116 / 255, blue: 179 / 255)
    static let red = Color(red: 240 / 255, green: 84 / 255, blue: 84 / 255)
    static let green = Color(red: 47 / 255, green: 93 / 255, blue: 98 / 255)
    
    static var all: [Color] {
        [Self.blue, Self.red, Self.green, Self.black]
    }
}

enum CardType: String, CaseIterable {
    case visa = "VISA"
    case mastercard = "Mastercard"
    case amex = "Amex"
    case discover = "Discover"
}

struct CardDetails {
    static private let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "MM/yy"
        return formatter
    }()

    var holderName: String = ""
    var bank: String = ""
    var type: CardType = .visa
    var number: String = ""
    var validity: Date = .now
    var secureCode: String = ""
    var color: Color = Colors.blue
    
    var formattedValidity: String {
        Self.dateFormatter.string(from: validity)
    }
}
