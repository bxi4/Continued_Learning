//
//  DownloadWithCombinePage.swift
//  Continued Learning
//
//  Created by Muhammed Ahaj on 28/09/2024.
//

import SwiftUI
import Combine

struct PostModell: Identifiable, Codable {
    let userId: Int
    let id: Int
    let title: String
    let body: String
}

class DownloadWithCombineViewModel: ObservableObject {
    @Published var posts: [PostModell] = []
    var  cancellable = Set<AnyCancellable>()
    
    init() {
        getPosts()
    }
    func getPosts() {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts") else { return }
        URLSession.shared.dataTaskPublisher(for: url)
            .subscribe(on: DispatchQueue.global(qos: .background))
            .receive(on: DispatchQueue.main)
            .tryMap(handleOutput)
            .decode(type: [PostModell].self, decoder: JSONDecoder())
            .sink {  completion in
                print("Completion: \(completion)")
            } receiveValue: { [weak self] returnedPosts in
                self?.posts = returnedPosts
            }
            .store(in: &cancellable)
    }
    
    func handleOutput(output: URLSession.DataTaskPublisher.Output) throws -> Data {
        guard let response = output.response as? HTTPURLResponse,
        response.statusCode >= 200 && response.statusCode < 300 else {
            throw URLError(.badServerResponse)
        }
        return output.data
    }
}

struct DownloadWithCombinePage: View {
    @StateObject var vm = DownloadWithCombineViewModel()
    var body: some View {
        List(vm.posts) { post in
            VStack(alignment: .leading){
                Text(post.title).font(.headline)
                Text(post.body).foregroundStyle(.gray)
            }
        }
    }
}

#Preview {
    DownloadWithCombinePage()
}
