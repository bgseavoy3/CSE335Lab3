//
//  ContentView.swift
//  Wallet
//
//  Created by Sameer Mungole on 8/16/23.
//

import SwiftUI

struct ContentView: View {
    @State public var cardDetails = CardDetails()
    @State var card: String = ""
    var body: some View {
        VStack
        {
            Text("Add Card")
            Form
            {
                Section(header: Text("Info On Card"))
                {
                    TextField("Cardholder Name: ", text: $cardDetails.holderName)
                    TextField("Bank: ", text: $cardDetails.bank)
                    Picker("Bank: ", selection: $cardDetails.type)
                    {
                        ForEach(CardType.allCases, id: \.self)
                        { type in
                            Text(type.rawValue).tag(type)
                        }
                    }
                }
            }
            Form
            {
                Section(header: Text("Card Details"))
                {
                    TextField("Card Number: ", text: $cardDetails.number)
                    TextField("Secure Code: ", text: $cardDetails.secureCode)
                    DatePicker("Valid Through: ", selection: $cardDetails.validity,displayedComponents: .date)
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
