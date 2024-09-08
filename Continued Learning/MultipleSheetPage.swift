//
//  MultipleSheetPage.swift
//  Continued Learning
//
//  Created by Muhammed Ahaj on 24/08/2024.
//

import SwiftUI

struct RandomModel: Identifiable {
    let id = UUID().uuidString
    let title: String
}
struct MultipleSheetPage: View {
    
    @State var selectedModel: RandomModel? = nil
    
    var body: some View {
        VStack{
            ScrollView {
                ForEach(1..<20) { i in
                    Button("Button \(i)") {
                        selectedModel = RandomModel(title: "\(i)")
                    }
                    .padding()
                }
            }
            
//            Button("Button 2") {
//                selectedModel = RandomModel(title: "Two Button")
//            }
            
        }
        .sheet(item: $selectedModel) { model in
            newScreen(selectedModel: model)
        }
    }
}

struct newScreen: View {
    let selectedModel: RandomModel
    var body: some View {
        ZStack{
            Color.orange.ignoresSafeArea()
            VStack{
                Text(selectedModel.title)
                    .font(.title)
                    .fontWeight(.bold)
            }
        }
    }
}

#Preview {
    MultipleSheetPage()
}
