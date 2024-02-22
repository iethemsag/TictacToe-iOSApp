//
//  ContentView.swift
//  TictacToe
//
//  Created by Ibrahim Ethem Sag on 4.01.2024.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var TicTac = TicTacModel()
    
    var body: some View {
        VStack {
            Text("TIC TAC TOE")
                .font(.system(size: 45,weight: .heavy))
            
            let col = Array(repeating: GridItem(.flexible()), count: 3)
            
            LazyVGrid(columns: col, content: {
                ForEach(0..<9) { i in
                    Button(action: {
                        TicTac.ButtonTap(i: i)
                    }, label: {
                        Text(TicTac.buttonLabel(i: i))
                            .frame(width: 100, height: 100)
                            .background(.blue)
                            .foregroundStyle(.white)
                            .font(.system(size: 45,weight: .heavy))
                    })
                }
            })
            .padding(.bottom)
            
            Button(action: {
                TicTac.resetGame()
            }, label: {
                Text("RESTART GAME")
                    .frame(width: 200, height: 50)
                    .background(.blue)
                    .foregroundStyle(.white)
                    .font(.system(size: 20,weight: .heavy))
                    .clipShape(.capsule)
            })
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
