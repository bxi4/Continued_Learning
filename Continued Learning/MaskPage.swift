//
//  MaskPage.swift
//  Continued Learning
//
//  Created by Muhammed Ahaj on 25/08/2024.
//

import SwiftUI

struct MaskPage: View {
   @State var rating: Int = 3
    var body: some View {
        starViews.overlay(overlayView.mask(starViews))

        Text("\(rating)")
            .font(.title)
            .fontWeight(.bold)
            .foregroundStyle(.red)
    
//        Button("Sound"){
//        SoundManger.instance.playSound(sound: .Tada)
//        }
    }
    
    private var overlayView: some View {
        GeometryReader{ geometry in
            ZStack(alignment: .leading){
                Rectangle()
                    .foregroundColor(.yellow)
                    .frame(width: CGFloat(rating) / 5 * geometry.size.width)
                
            }
        }
        .allowsHitTesting(false)
    }
    
    private var starViews: some View {
        HStack{
            ForEach(1..<6) { index in
                Image(systemName: "star.fill")
                    .foregroundColor(rating >= index ? .yellow : .gray)
                    .font(.title)
                    .onTapGesture {
                        withAnimation(.spring()) {
                            rating = index
                            if rating == 5 {
                                SoundManger.instance.playSound(sound: .Tada)
                            }
                        }
                    }
            }
        }
    }
}

#Preview {
    MaskPage()
}
