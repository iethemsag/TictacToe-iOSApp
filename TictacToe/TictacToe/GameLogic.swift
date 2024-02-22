//
//  GameLogic.swift
//  TictacToe
//
//  Created by Ibrahim Ethem Sag on 4.01.2024.
//

import Foundation

enum Player {
    case X
    case O
}

class TicTacModel:ObservableObject{
    
    @Published var board:[Player?] = Array(repeating: nil, count: 9)
    @Published var activePlayer:Player = .X
    @Published var winner:Player? = nil
    
    //Button pressed
    func ButtonTap(i:Int){
        
        guard board[i] == nil && winner == nil else{
            return
        }
        
        board[i] = activePlayer
        
        if checkWinner() {
            //There is a winner
            winner = activePlayer
            print("\(activePlayer) has won the game")
        } else {
            activePlayer = (activePlayer == .X) ? .O : .X
        }
    }
    
    //Label of button
    func buttonLabel(i:Int) -> String {
        if let player = board[i] {
            return player == .X ? "X" : "O"
        }
        return ""
    }
    
    //Reset game
    func resetGame() {
        board = Array(repeating: nil, count: 9)
        activePlayer = .X
        winner = nil
    }
    
    //CHECK FOR WİNNER
    func checkWinner() -> Bool {
        
        
        //Rows
        for i in stride(from: 0, to: 9, by: 3) {
            if board[i] == activePlayer && board[i+1] == activePlayer && board[i+2] == activePlayer{
                return true
            }
        }
        
        //Columns
        for i in 0..<3 {
            if board[i] == activePlayer && board[i+3] == activePlayer && board[i+6] == activePlayer{
                return true
            }
        }
        
        //Diagonals
        if board[0] == activePlayer && board[4] == activePlayer && board[8] == activePlayer {
            return true
        }
        
        if board[2] == activePlayer && board[4] == activePlayer && board[6] == activePlayer {
            return true
        }
        
        return false
    }
    
}
