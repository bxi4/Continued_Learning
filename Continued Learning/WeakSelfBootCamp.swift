//
//  WeakSelfBootCamp.swift
//  Continued Learning
//
//  Created by Muhammed Ahaj on 08/09/2024.
//

import SwiftUI

class WeakSelfSeccondScreenViewModel: ObservableObject {
    @Published var data: String? = nil
    
    init() {
        print("init")
        let currentCount = UserDefaults.standard.integer(forKey: "count")
        UserDefaults.standard.set(currentCount + 1, forKey: "count")
        getData()
    }
    deinit {
        print("dinit")
        let currentCount = UserDefaults.standard.integer(forKey: "count")
        UserDefaults.standard.set(currentCount - 1, forKey: "count")
    }
    
    func getData() {
        data = "NEW data"
    }
}

struct WeakSelfBootCamp: View {
    
    @AppStorage("count") var count: Int?
    var body: some View {
        NavigationView {
            NavigationLink("Go To", destination: WeakSeccondScreen())
            .navigationTitle("Screen 1")
        }
        .overlay(
            Text("\(count ?? 0)")
                .font(.title)
                .padding()
                .background(Color.green.cornerRadius(10))
         
            ,alignment: .topTrailing
            )
    
    }
}

struct WeakSeccondScreen: View {
    @StateObject var vm = WeakSelfSeccondScreenViewModel()
    
    var body: some View {
        VStack {
            Text("Screen 2")
                .navigationTitle("Screen two.")
            
            if let data = vm.data {
                Text(data)
            }
        }
    }
}


#Preview {
    WeakSelfBootCamp()
}
