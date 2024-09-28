//
//  CodeableBootCamp.swift
//  Continued Learning
//
//  Created by Muhammed Ahaj on 11/09/2024.
//

import SwiftUI


struct CustomerModel: Identifiable, Decodable, Encodable {
    let id: String
    let name: String
    let age: Int
    let email: String
    let isPremium: Bool
    
    init(id: String, name: String, age: Int, email: String, isPremium: Bool) {
        self.id = id
        self.name = name
        self.age = age
        self.email = email
        self.isPremium = isPremium
    }
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(id, forKey: .id)
        try container.encode(name, forKey: .name)
        try container.encode(age, forKey: .age)
        try container.encode(email, forKey: .email)
        try container.encode(isPremium, forKey: .isPremium)
    }
    
    enum CodingKeys: CodingKey {
        case id
        case name
        case age
        case email
        case isPremium
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(String.self, forKey: .id)
        self.name = try container.decode(String.self, forKey: .name)
        self.age = try container.decode(Int.self, forKey: .age)
        self.email = try container.decode(String.self, forKey: .email)
        self.isPremium = try container.decode(Bool.self, forKey: .isPremium)
    }
}

class CustomerViewModel: ObservableObject {
    @Published var customer: CustomerModel? = nil
    
    init() {
        getData()
    }
    func getData() {
        guard let data = getJsonData() else { return }
        self.customer = try? JSONDecoder().decode(CustomerModel.self, from: data)
    }
    func getJsonData() -> Data? {
        let customer = CustomerModel(id: "1211", name: "Maria", age: 20, email: "maria@gmail.com", isPremium: false)
        
        let jsonData = try? JSONEncoder().encode(customer)
        return jsonData
    }
    
}

struct CodeableBootCamp: View {
    @StateObject var vm = CustomerViewModel()
    var body: some View {
        VStack{
            if let user = vm.customer {
                Text(user.id)
                Text(user.name)
                Text("\(user.age)")
                Text(user.email)
                Text(user.isPremium.description)

            }
            
        }
    }
}

#Preview {
    CodeableBootCamp()
}
