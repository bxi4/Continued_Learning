//
//  BackgroundThreadBootcamp.swift
//  Continued Learning
//
//  Created by Muhammed Ahaj on 01/09/2024.
//

import SwiftUI

class BackgroundThreadViewModel: ObservableObject {
    @Published var dataArray: [String] = []
    func fetchData() {
        dataArray = downloadData()
    }
    private func downloadData() -> [String]{
        var data: [String] = []
        for x in 1..<100 {
            data.append("\(x)")
            
        }
        print(data)
        return data
    }
    
    
}

struct BackgroundThreadBootcamp: View {
    @StateObject var vm = BackgroundThreadViewModel()
    var body: some View {
        ScrollView{
            VStack{
                Text("Load Data")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .onTapGesture {
                        vm.fetchData()
                    }
                ForEach(vm.dataArray, id: \.self) { item in
                    
                     Text(item)
                }
            }
        }
    }
}

#Preview {
    BackgroundThreadBootcamp()
}
