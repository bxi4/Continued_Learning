//
//  TypealiasBootCamp.swift
//  Continued Learning
//
//  Created by Muhammed Ahaj on 08/09/2024.
//

import SwiftUI

typealias Dollar = Double
typealias Ye = Double

struct Receipt {
    let totalCosts: Dollar
}

extension Dollar {
    func toYe() -> Ye {
        return self * 530
    }
}

struct TypealiasBootCamp: View {
    @State var count: Double = 0
    @State var result: Double?
//    let newMoney = Receipt(totalCosts: 100)
    
    
    var body: some View {
        
        VStack{
            TextField("How Much", value: $count, formatter: NumberFormatter())
                .textFieldStyle(.roundedBorder)
            
            Button("Change") {
                
                let newMoney = Receipt(totalCosts: count)
                result = newMoney.totalCosts.toYe()
            }
            
            Group {
                Text("\(result ?? 0, specifier: "%.f")") // with comma,
                Text(String(format: "%.f", result ?? 0)) // withount Comma
            }
                .padding()
                .background(.gray)
        }
        
    }
}

#Preview {
    TypealiasBootCamp()
    
}
