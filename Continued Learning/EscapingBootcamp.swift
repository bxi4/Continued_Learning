//
//  EscapingBootcamp.swift
//  Continued Learning
//
//  Created by Muhammed Ahaj on 10/09/2024.
//

import SwiftUI

class EscapingViewModel: ObservableObject {
    @Published var text: String = "Hello "
    
    func getData() {
        text = downloadData()
    }
    func downloadData() -> String {
        return "New Data!"
    }
}

struct EscapingBootcamp: View {
    @StateObject var vm = EscapingViewModel()
    var body: some View {
        Text(vm.text)
            .onTapGesture {
                vm.getData()
            }
    }
}

#Preview {
    EscapingBootcamp()
}
