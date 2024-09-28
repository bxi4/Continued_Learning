//
//  DownloadJSONWithEscapingBootCamp.swift
//  Continued Learning
//
//  Created by Muhammed Ahaj on 21/09/2024.
//

import SwiftUI

struct PostModel: Identifiable, Codable {
    let userId: Int
    let id: Int
    let title: String
    let body: String
}

class DownloadJSONWithEscapingViewModel: ObservableObject {
    @Published var posts: [PostModel] = []
    init() {
        getPosts()
    }
    func getPosts() {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts/1") else { return }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data,
                  error == nil,
                  let response = response as? HTTPURLResponse,
                  response.statusCode >= 200 &&  response.statusCode < 300 else {
                print("Error Downloading Data.")
                return
            }
            
            guard let newPost = try? JSONDecoder().decode(PostModel.self, from: data) else { return }
            DispatchQueue.main.async { [weak self] in
                self?.posts.append(newPost)
            }
            
        }.resume()
    }

    
    
}

struct DownloadJSONWithEscapingBootCamp: View {
    @StateObject var vm = DownloadJSONWithEscapingViewModel()
    var body: some View {
        NavigationView {
            List{
                ForEach(vm.posts) { post in
                    Text(post.title)
                    Text(post.body)
                }
            }
            .navigationTitle("List Titles:")
        }
    }
}

#Preview {
    DownloadJSONWithEscapingBootCamp()
}
