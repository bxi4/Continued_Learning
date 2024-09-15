//
//  EscapingBootcamp.swift
//  Continued Learning
//
//  Created by Muhammed Ahaj on 10/09/2024.
//

import SwiftUI

class EscapingViewModel: ObservableObject {
    @Published var text: String = "Hello "
    @Published var age: Int = 20
    
    func getData() {
        donwloadData4 {[weak self] DonwloadResult in
            self?.text = DonwloadResult.data
            self?.age = DonwloadResult.age
        }
    }
    func downloadData() -> String {
        return "New Data!"
    }
    func downloadData2(completionHandler: (_ data: String) -> ()) {
        completionHandler("New Data!")
    }
    func donwloadData3(compleationHandler: @escaping (_ data: String) -> () ) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            compleationHandler("New Data Async")
        }
        
    }
    func donwloadData4(compleationHandler: @escaping DonwloadCompleate) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            let result = DonwloadResult(data: "New Data!!!.", age: 30)
            compleationHandler(result)
        }
        
    }
}

typealias DonwloadCompleate = (DonwloadResult) -> ()

struct DonwloadResult {
    let data: String
    let age: Int
}

struct EscapingBootcamp: View {
    @StateObject var vm = EscapingViewModel()
    var body: some View {
        VStack {
            Text(vm.text)
            Text("\(vm.age)")
        }
        .onTapGesture {
            vm.getData()
    }
    }
}

#Preview {
    EscapingBootcamp()
}
