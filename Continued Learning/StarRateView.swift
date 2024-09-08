//
//  MaskPage.swift
//  Continued Learning
//
//  Created by Muhammed Ahaj on 25/08/2024.
//

import SwiftUI

struct StarRateView: View {
    @State var rating: Int = 3
    var body: some View {
        ZStack{
            HStack{
                ForEach(1..<6) { index in
                    Image(systemName: "star.fill")
                        .font(.title)
                        .foregroundColor(rating >= index ? Color.yellow : Color.gray )
                        .onTapGesture {
                            rating = index
                        }
                        
                }
                
            }
        }
        
    }
}

#Preview {
    StarRateView()
}
