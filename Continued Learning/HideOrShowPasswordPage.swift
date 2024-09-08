//
//  HideOrShowPasswordPage.swift
//  Continued Learning
//
//  Created by Muhammed Ahaj on 22/08/2024.
//

import SwiftUI

struct HideOrShowPasswordPage: View {
    @State var textInText: String = ""
    @State var Password: String = ""
    @State var showPassword: Bool = false
    
    var body: some View {
        VStack{
            Group {
                TextField("Name", text: $textInText)
                    .textInputAutocapitalization(.never)
                HStack{
                    if showPassword {
                        TextField("Name", text: $Password)
                            .textInputAutocapitalization(.never)
                            .autocorrectionDisabled(true)

                    } else {
                        SecureField("Password", text: $Password)

                    }
                    Button(action: {
                        showPassword.toggle()
                    }, label: {
                        Image(systemName: showPassword ? "eye.slash" : "eye")
                            .foregroundColor(.gray)
                    })
                }
            }
           
            
            
        }.padding()
    }
}

#Preview {
    HideOrShowPasswordPage()
}
