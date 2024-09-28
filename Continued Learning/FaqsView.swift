//
//  FaqsView.swift
//  FustekaIceCream
//
//  Created by Muhammed Ahaj on 07/09/2024.
//

import SwiftUI

struct FaqsView: View {
    @State private var expandedIndex: Int? = nil

    let faqs = [
        "How can I earn points?",
        "How much reward can I earn daily?",
        "How to play games?",
        "How to participate in Fusteka competition?",
        "How to participate in Fusteka competition?",
        "How to participate in Fusteka competition?",
        "How to participate in Fusteka competition?"
    ]
    
    var body: some View {

            VStack {
                // Top Bar
                ZStack {
                    HStack {
                        Button(action: {
                            // Back button action
                        }) {
                            Image("Group 34803")
                                .padding(.leading)
                        }
                        Spacer()
                    }
                    
                    Image("faqsimage")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 140)
                        .offset(y: 20)
                }
//                    Text("FAQs")
//                        .font(.headline)
//                        .foregroundColor(.white)
//                        .padding()
//                        .padding(.horizontal, 30)
//                        .background(RoundedRectangle(cornerRadius: 12)
//                                        .fill(Color.yellow))
//
//                }
//
                
                // FAQ List
                ScrollView {
                    VStack(spacing: 0) {
                        ForEach(faqs.indices, id: \.self) { index in
                            FAQItem(
                                question: faqs[index],
                                isExpanded: expandedIndex == index,
                                action: {
                                    withAnimation {
                                        expandedIndex = expandedIndex == index ? nil : index
                                    }
                                }
                            )
                            Divider()
                                .background(Color.white.opacity(0.9))
//                                .padding(.horizontal)
                        }
                    }
                    .padding(.top)
                }
                
                .cornerRadius(25)
                .padding()
            }
            .padding(.top, 60)
            .background(Image("background_faqs")) // Background color from your image
//            .overlay(
//                        RoundedRectangle(cornerRadius: 25)
//                            .stroke(Color.white, lineWidth: 2)// Border color and width
//                            .padding()
//                            .padding(.top, 140)
//            )
    
            .edgesIgnoringSafeArea(.all)
        }
        
}

struct FAQItem: View {
    let question: String
    let isExpanded: Bool
    let action: () -> Void
    
    var body: some View {
        VStack(spacing: 10) {
            Button(action: action) {
                HStack {
                    Text(question)
                        .foregroundColor(.white)
//                        .font(.subheadline)
                        .font(.system(size: 14.6))
                        .fontWeight(.bold)
                        .multilineTextAlignment(.leading)
                    Spacer()
                    Image(systemName: "chevron.right")
                        .rotationEffect(.degrees(isExpanded ? 90 : 0))
                        .foregroundColor(.white)
                }
            }
            
            if isExpanded {
                Text("Simply, tap on games banner, and you will enter into game menu. Choose your favorite game and have unlimited fun.")
                    .foregroundColor(.white)
                    .font(.subheadline)
                    .fontWeight(.light)
            }
        }
        .padding()
    }
}

#Preview {
    FaqsView()
}
