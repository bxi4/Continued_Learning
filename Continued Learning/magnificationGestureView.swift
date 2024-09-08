//
//  magnificationGestureView.swift
//  Continued Learning
//
//  Created by Muhammed Ahaj on 21/08/2024.
//

import SwiftUI


struct magnificationGestureView: View {
    @State var currentAmount: CGFloat = 0
    var body: some View {
        NavigationView {
            VStack{
                List{
                    Section {
                        ForEach(1..<5) { item in
                        Text("\(item)")
                        }
                    } header: {
                        Text("number")
                    }
                    
                    Section {
                        ForEach(1..<5) { item in
                            NavigationLink("\(item)") {
                             
                                    List{
                                        Section {
                                            ForEach(1..<50) { item in
                                            Text("\(item)")
                                            }
                                        } header: {
                                            Text("Settings")
                                        }
                                }
                                
                            }
                        }
                    } header: {
                        Text("Strins")
                    }

                }
            }
            .navigationTitle("HEllo Lets Do")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    magnificationGestureView()
}
