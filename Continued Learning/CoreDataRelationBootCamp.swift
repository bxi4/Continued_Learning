//
//  CoreDataRelationBootCamp.swift
//  Continued Learning
//
//  Created by Muhammed Ahaj on 01/09/2024.
//

import SwiftUI
import CoreData

class CoreDataMager {
    static let instance = CoreDataMager()
    let continer: NSPersistentContainer
    let contex: NSManagedObjectContext
    init() {
        continer = NSPersistentContainer(name: "")
        continer.loadPersistentStores { descripe, error in
            if let error = error {
                print("Error \(error)")
            }
        }
        contex = continer.viewContext
    }
    func saveData() {
        do {
           try contex.save()
        } catch let error {
            print("error \(error)")
        }
    }
}
class CoreDataRelationViewModel: ObservableObject {
    let manger = CoreDataMager.instance
}

struct CoreDataRelationBootCamp: View {
    @StateObject var vm = CoreDataRelationViewModel()
    var body: some View {
        Text("Hello, World!")
    }
}

#Preview {
    CoreDataRelationBootCamp()
}
