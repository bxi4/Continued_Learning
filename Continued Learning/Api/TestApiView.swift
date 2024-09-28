//
//  TestApi.swift
//  Continued Learning
//
//  Created by Muhammed Ahaj on 19/09/2024.
//

import SwiftUI

struct FAQ: Codable, Identifiable {
    var id: Int
    var question: String
    var answer: String
    var type_file: String
    var files: [String]
}

struct FAQResponse: Codable {
    var success: Bool
    var data: [FAQ]
    var message: String
    var code: Int
}

import SwiftUI

struct TestApiView: View {
    @State private var faqs: [FAQ] = []
    
    var body: some View {
        NavigationView {
            List(faqs) { faq in
                VStack(alignment: .leading) {
                    Text(faq.question)
                        .font(.headline)
                    
                    if !faq.answer.isEmpty {
                        Text(faq.answer)
                            .font(.subheadline)
                            .foregroundColor(.gray)
                    }

                    if faq.type_file == "images", let firstImage = faq.files.first {
                        AsyncImage(url: URL(string: firstImage)) { image in
                            image
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(height: 200)
                        } placeholder: {
                            ProgressView()
                        }
                    }
                }
            }
            .navigationTitle("FAQs")
            .onAppear(perform: loadData)
        }
    }
    
    func loadData() {
        guard let url = URL(string: "https://new.fustekaice.com/api/v2/get-faqs") else {
            print("Invalid URL")
            return
        }

        let request = URLRequest(url: url)
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let data = data {
                do {
                    // تحويل JSON إلى كائن Swift باستخدام Decodable
                    let decodedResponse = try JSONDecoder().decode(FAQResponse.self, from: data)
                    DispatchQueue.main.async {
                        self.faqs = decodedResponse.data
                    }
                } catch {
                    print("Error decoding JSON: \(error)")
                }
            }
        }.resume()
    }
}

#Preview {
    TestApiView()
}
