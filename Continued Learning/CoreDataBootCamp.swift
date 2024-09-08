//
//  CoreDataBootCamp.swift
//  Continued Learning
//
//  Created by Muhammed Ahaj on 29/08/2024.
//

import SwiftUI
import CoreData


class CoreDateViewModel: ObservableObject {
    let continer: NSPersistentContainer
    @Published var savedEntity: [FruitEntity] = []
    
    init() {
        continer = NSPersistentContainer(name: "FruitsContiner")
        continer.loadPersistentStores { description, error in
            if let error = error {
                print("Erorr Fetcing Date \(error)")
            }
        }
        fetchFruits()
    }
    func fetchFruits() {
        let request = NSFetchRequest<FruitEntity>(entityName: "FruitEntity")
        
        do {
          savedEntity =  try continer.viewContext.fetch(request)
        } catch let error {
                print("Error Fetching \(error)")
            }
        }
    func addFruit(text: String) {
        let newFruit = FruitEntity(context: continer.viewContext)
        newFruit.name = text
        saveData()
    }
    func saveData() {
        do {
            try continer.viewContext.save()
            fetchFruits()
        } catch let error {
            print("error \(error)")
        }
       
    }
    func deleteFruit(indexSet: IndexSet) {
        guard let index = indexSet.first else { return }
        let entity = savedEntity[index]
        continer.viewContext.delete(entity)
        saveData()
    }
    func updateFruit(fruit: FruitEntity) {
        let newName = (fruit.name ?? "Not Found") + "!"
        fruit.name = newName
        saveData()
    }
}

struct CoreDataBootCamp: View {
    @StateObject var vm = CoreDateViewModel()
    @State var textintextfield: String = ""
    @State var alertShow: Bool = false
    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                TextField("Name Fruits...", text: $textintextfield)
                    .padding()
                    .background(Color.gray.opacity(0.5))
                    .cornerRadius(10)
                Button("Add") {
                    guard !textintextfield.isEmpty && textintextfield.count > 3 else { return alertShow = true }
                    vm.addFruit(text: textintextfield)
                    textintextfield = ""
                    
                }
                .alert("Is Empty or < 3 letters.", isPresented: $alertShow , actions: {
                    TextField("Text...", text: $textintextfield)
                        .foregroundColor(.black)
                })
                .foregroundColor(.white)
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color.blue)
                .cornerRadius(10)
                
                List{
                    ForEach(vm.savedEntity) { item in
                        Text(item.name ?? "Not Found")
                            .onTapGesture {
                                vm.updateFruit(fruit: item)
                            }
                    }
                    .onDelete(perform: vm.deleteFruit)
                }
                .listStyle(.plain)
            }
            .padding(.horizontal)
            .navigationTitle("Fruits")
        }
    }
}

#Preview {
    CoreDataBootCamp()
}
