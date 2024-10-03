//
//  AnotherTestApi.swift
//  Continued Learning
//
//  Created by Muhammed Ahaj on 28/09/2024.
//

import SwiftUI

struct ApiModel: Identifiable, Codable {
    let userId: Int
    let id: Int
    let title: String
    let body: String
}

class ApiViewModel: ObservableObject {
    @Published var apiArray: [ApiModel] = []
    
    init() {
        getData()
    }
    func getData() {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts") else { return }
        downloadData(fromURL: url) { returndata in
            if let data = returndata {
                guard let newapi = try? JSONDecoder().decode([ApiModel].self, from: data) else { return }
                DispatchQueue.main.sync { [ weak self ] in
                    self?.apiArray = newapi
                }
            } else {
                print("Not Data returned")
            }
        }
        
    }
    
    func downloadData(fromURL url: URL, completionHandler: @escaping (_ data: Data?) -> ()) {
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data,
                  error == nil,
                  let response = response as? HTTPURLResponse,
                  response.statusCode >= 200 && response.statusCode < 300 else {
                print("error Data Fetching...")
                completionHandler(nil)
                return
            }
            
            completionHandler(data)
            
        }.resume()
    }
}

struct AnotherTestApi: View {
    @StateObject var vm = ApiViewModel()
    var body: some View {
       
            List(vm.apiArray) { item in
                VStack(alignment: .leading) {
                    Text(item.title).font(.headline)
                    Text(item.body).foregroundStyle(.gray)
                }
            
        }
    }
}

#Preview {
    AnotherTestApi()
}
