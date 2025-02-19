//
//  CardDetails.swift
//  Wallet
//
//  Created by Sameer Mungole on 7/28/23.
//

import SwiftUI

enum CardColor: String, CaseIterable {
    case black, blue, green, red
    
    var color: Color
    {
        switch self
        {
            case .black: return Color.black
            case .blue: return Color.blue
            case .red: return Color.red
            case .green: return Color.green
        }
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
    var color: CardColor = .blue
    
    var formattedValidity: String {
        Self.dateFormatter.string(from: validity)
    }
}
