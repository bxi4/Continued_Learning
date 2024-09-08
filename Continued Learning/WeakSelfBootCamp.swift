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
        getData()
    }
    deinit {
        print("dinit")
    }
    
    func getData() {
        data = "NEW data"
    }
}

struct WeakSelfBootCamp: View {
    var body: some View {
        NavigationView {
            NavigationLink("Go To", destination: WeakSeccondScreen())
            .navigationTitle("Screen 1")
        }
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
