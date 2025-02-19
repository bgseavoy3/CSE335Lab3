//
//  ContentView.swift
//  Wallet
//
//  Created by Sameer Mungole on 8/16/23.
//

import SwiftUI

struct ContentView: View {
    @State private var cardDetails = CardDetails()
    @State var card: String = ""
    var body: some View {
        VStack
        {
            Text("Add Card")
                .padding()
            Form
            {
                Section(header: Text("Info On Card"))
                {
                    TextField("Cardholder Name: ", text: $cardDetails.holderName)
                    TextField("Bank: ", text: $cardDetails.bank)
                    Picker("Card Type: ", selection: $cardDetails.type)
                    {
                        ForEach(CardType.allCases, id: \.self)
                        { type in
                            Text(type.rawValue).tag(type)
                        }
                    }
                }
            }
                .padding()
            Form
            {
                Section(header: Text("Card Details"))
                {
                    TextField("Card Number: ", text: $cardDetails.number)
                    TextField("Secure Code: ", text: $cardDetails.secureCode)
                    DatePicker("Valid Through: ", selection: $cardDetails.validity, displayedComponents: .date)
                }
            }
                .padding()
            Picker("Card Color:",selection: $cardDetails.color)
            {
                ForEach(CardColor.allCases, id: \.self)
                { color in
                    HStack
                    {
                        Circle().fill(color.color)
                        Text(color.rawValue)
                    }.tag(color)
                }
            }
            Spacer()
            ZStack(alignment: .top)
            {
                Rectangle().fill(cardDetails.color.color)
                VStack(alignment: .leading)
                {
                    HStack(alignment: .top)
                    {
                        Text(cardDetails.bank).font(.title).foregroundStyle(.white)
                            Spacer()
                        Text(cardDetails.type.rawValue).font(.title2).foregroundStyle(.white)
                    }
                    Spacer()
                    VStack(alignment: .leading)
                    {
                        Text(cardDetails.holderName).foregroundStyle(.white).font(.title3)
                        HStack
                        {
                            Text("VALID THRU: \(cardDetails.formattedValidity)     ").foregroundStyle(.white)
                            Text("SECURE CODE: \(cardDetails.secureCode)").foregroundStyle(.white)
                        }
                        Text(cardDetails.number).foregroundStyle(.white)
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View{
        ContentView()
    }
}
