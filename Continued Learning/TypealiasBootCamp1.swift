//
//  TypealiasBootCamp1.swift
//  Continued Learning
//
//  Created by Muhammed Ahaj on 10/09/2024.
//

import SwiftUI

struct MovieModel {
    let title: String
    let artName: String
    let countOfStar: Int
}

typealias TvModel = MovieModel


struct TypealiasBootCamp1: View {
    
//    @State var newMovie = MovieModel(title: "Movie 1", artName: "Mohammed", countOfStar: 20)
    
    @State var newTv = TvModel(title: "test", artName: "test1", countOfStar: 40)
    
    var body: some View {
        VStack{
            Text(newTv.title)
            Text(newTv.artName)
            Text("\(newTv.countOfStar)")
        }
    }
}

#Preview {
    TypealiasBootCamp1()
}
