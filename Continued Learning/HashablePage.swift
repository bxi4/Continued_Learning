//
//  HashablePage.swift
//  Continued Learning
//
//  Created by Muhammed Ahaj on 27/08/2024.
//

import SwiftUI

struct HashableModel: Hashable {
    let title: String
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(title)
    }
}

struct HashablePage: View {
    let data: [HashableModel] = [
    HashableModel(title: "Mohammed"),
    HashableModel(title: "ali"),
    HashableModel(title: "Hamod")
    
    ]
    var body: some View {
        ScrollView{
            ForEach(data, id: \.self) { item in
                Text(item.title)
                    .font(.title)
                    .fontWeight(.bold)
            }
        }
    }
}

#Preview {
    HashablePage()
}
