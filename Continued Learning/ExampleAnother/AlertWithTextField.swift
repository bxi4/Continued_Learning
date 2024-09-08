//
//  AlertWithTextField.swift
//  Continued Learning
//
//  Created by Muhammed Ahaj on 25/08/2024.
//

import SwiftUI

struct AlertWithTextField: View {
    @State var isPres: Bool = false
    @State var name: String = "Mohammed"
    var body: some View {
        VStack{
            Button("Edit") {
                isPres.toggle()
            }
                .withCustomButtonStyle()
                .alert("Edit Your Name", isPresented: $isPres) {
                    TextField("Edit name...", text: $name)
                        .autocorrectionDisabled()
//                    Button("Save"){
//                        
//                    }
                }
            Text(name)
                .font(.title)
        }
        .padding()
        
    }
}

#Preview {
    AlertWithTextField()
}
