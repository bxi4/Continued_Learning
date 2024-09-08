//
//  ContentView.swift
//  Continued Learning
//
//  Created by Muhammed Ahaj on 20/08/2024.
//

import SwiftUI

struct ContentView: View {
    @State var isCompleate: Bool = false
    @State var isFinish: Bool = true
    var body: some View {
        VStack{
            Rectangle()
                .fill(isCompleate ? .green : .blue)
                .frame(maxWidth: isCompleate ? .infinity : 0)
                .frame(height: 55)
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(Color.red)
            
            HStack{
                Text("Load")
                    .foregroundStyle(.white)
                    .font(.headline)
                    .padding()
                    .background(Color.black)
                    .cornerRadius(10)
                    .onLongPressGesture(minimumDuration: 1.0, maximumDistance: 50) { ispressing in
                        if ispressing {
                            withAnimation(.easeIn(duration: 1.0)){
                                isCompleate = true
                            }
                        } else {
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                                if !isFinish {
                                    withAnimation(.easeInOut) {
                                        isCompleate = false
                                    }
                                }
                                
                            }
                        }
                    } perform: {
                        withAnimation(.easeInOut) {
                            isFinish = true
                    }

                    }
                
                Text("Reset")
                    .foregroundStyle(.white)
                    .font(.headline)
                    .padding()
                    .background(Color.black)
                    .cornerRadius(10)
                    .onTapGesture {
                        isCompleate = false
                        isFinish = false
                    }
            }
        }
    }
}

#Preview {
    ContentView()
}
