//
//  TestDownloadJosnView.swift
//  Continued Learning
//
//  Created by Muhammed Ahaj on 21/09/2024.
//

import SwiftUI

// Model
struct TestDonwloadApi: Identifiable, Codable {
    let id: Int
    let userId: Int
    let title: String
    let body: String
}

// ViewModel
class TestDonwloadApiViewModel: ObservableObject {
    @Published var testsArray: [TestDonwloadApi] = []
    @Published var isLoding: Bool = true
    
    init() {
        getData()
    }
    func getData() {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts/7") else { return }
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data,
                  error == nil,
                  let response = response as? HTTPURLResponse,
                  response.statusCode >= 200 && response.statusCode < 300 else {
                print("Error FetchData")
                return
            }
            guard let newPost = try? JSONDecoder().decode(TestDonwloadApi.self, from: data) else { return }
            DispatchQueue.main.async { [weak self] in
                withAnimation {
                    self?.testsArray.append(newPost)
                    self?.isLoding = false
                }
                
                
            }
                  
        }.resume()
    }
    
}


struct TestDownloadJosnView: View {
    @StateObject var vm = TestDonwloadApiViewModel()
    var body: some View {
        VStack {
            if vm.isLoding {
                ProgressView("Loding Data...")
            } else {
                List(vm.testsArray) { item in
                        VStack(alignment: .leading){
                            Text(item.title).font(.headline)
                            Text(item.body)
                                .font(.subheadline)
                        }
                }
            }
        }
    }
        
}

#Preview {
    TestDownloadJosnView()
}
