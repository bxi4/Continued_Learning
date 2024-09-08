//
//  GeometryReaderPage.swift
//  Continued Learning
//
//  Created by Muhammed Ahaj on 22/08/2024.
//

import SwiftUI

struct GeometryReaderPage: View {
    var body: some View {
        GeometryReader { geo in
            HStack(alignment: .bottom, spacing: 0){
                Text("Green")
                    .font(.largeTitle)
                    .frame(width: geo.size.width * 0.33)
//                    .frame(width: UIScreen.main.bounds.width * 0.33)
                    .background(.green)
                
                Text("Orange")
                    .font(.largeTitle)
//                    .frame(width: UIScreen.main.bounds.width * 0.67)

                    .frame(width: geo.size.width * 0.67)
                    .background(.orange)
            }
        }
        .frame(height: 50)
       
    }
}

#Preview {
    GeometryReaderPage()
}
