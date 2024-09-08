//
//  ScrollViewReaderPage.swift
//  Continued Learning
//
//  Created by Muhammed Ahaj on 22/08/2024.
//

import SwiftUI

struct ScrollViewReaderPage: View {
    @State var numberTo: Int = 0
    var body: some View {
        VStack{
            TextField("Number To ...", value: $numberTo, format:.number)
            ScrollViewReader{ proxy in
                ScrollView {
                    
                    Button("Jumb to 8") {
                        withAnimation {
                            proxy.scrollTo(numberTo, anchor: .top)
                        }
                         }
                    ForEach(1..<20) { item in
                        Text("hello \(item)").id(item)
                        
                        RoundedRectangle(cornerRadius: 25.0)
                            .frame(height: 100)
                    }
                }
                
                
                
            }
        }
        
    }
}

#Preview {
    ScrollViewReaderPage()
}
