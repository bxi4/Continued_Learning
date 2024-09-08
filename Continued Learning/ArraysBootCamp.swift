import SwiftUI

struct UserModel: Identifiable {
    let id = UUID().uuidString
    let name: String
    let points: Int
    let isVer: Bool
}

class UserViewModel: ObservableObject {
    @Published var userArray: [UserModel] = []
    
    init() {
        getData()
    }
    
    func getData() {
        let user1 = UserModel(name: "Mohammed", points: 20, isVer: true)
        let user2 = UserModel(name: "Ahmed", points: 31, isVer: false)
        let user3 = UserModel(name: "Abdo", points: 19, isVer: false)
        let user4 = UserModel(name: "Alwrafi", points: 11, isVer: true)
        let user5 = UserModel(name: "Osama", points: 7, isVer: false)
        let user6 = UserModel(name: "Afnan", points: 3, isVer: true)
        let user7 = UserModel(name: "Amgd", points: 2, isVer: false)
        let user8 = UserModel(name: "Ibrahim", points: 9, isVer: true)
        let user9 = UserModel(name: "Hothaefa", points: 19, isVer: false)
        let user10 = UserModel(name: "Hasan", points: 11, isVer: true)
        
        userArray.append(contentsOf: [user1, user2, user3, user4, user5, user6, user7, user8, user9, user10])
    }
    
    func deleteUser(_ user: UserModel) {
        userArray.removeAll { $0.id == user.id }
    }
}

struct ArraysBootCamp: View {
    @StateObject var vm = UserViewModel()
    @State var text: String = ""
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack {
                    ForEach(text.isEmpty ? vm.userArray : vm.userArray.filter { $0.name.localizedCaseInsensitiveContains(text) }) { item in
                        VStack(alignment: .leading) {
                            Text(item.name)
                                .font(.headline)
                            
                            HStack {
                                Text("\(item.points)")
                                Spacer()
                                if item.isVer {
                                    Image(systemName: "flame.fill")
                                }
                            }
                        }
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.blue.cornerRadius(10))
                        .padding(.horizontal)
                        .swipeActions {
                            Button(role: .destructive) {
                                vm.deleteUser(item)
                            } label: {
                                Label("Delete", systemImage: "trash")
                            }
                        }
                    }
                }
            }
            .navigationTitle("Names")
            .searchable(text: $text)
            .toolbar {
                EditButton()
            }
        }
    }
}

#Preview {
    ArraysBootCamp()
}
