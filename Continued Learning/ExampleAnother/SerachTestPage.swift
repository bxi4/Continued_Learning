//
//  SerachTestPage.swift
//  Continued Learning
//
//  Created by Muhammed Ahaj on 26/08/2024.
//

import SwiftUI

struct SearchTestPage: View {
    @State var textInTextField: String = ""
    @State var listArray = ["Birch", "Daffodil", "Daisy", "Dandylion", "Fir", "Lily", "Oak", "Olive", "Rose", "Tulip"]

    var body: some View {
        NavigationView {
            List {
                ForEach(textInTextField.isEmpty ? listArray : listArray.filter { $0.localizedCaseInsensitiveContains(textInTextField)}, id: \.self) { i in
                    Text(i)
                }
                .onDelete(perform: deleteItems)
            }
            .navigationTitle("Search Page")
        }
        .searchable(text: $textInTextField)
        .autocorrectionDisabled()
        .textInputAutocapitalization(.never)
    }

    func deleteItems(at offsets: IndexSet) {
        listArray.remove(atOffsets: offsets)
    }
}

#Preview {
    SearchTestPage()
}
