//
//  Game.swift
//  Apple Pie
//
//  Created by Barbara Feinstein on 2/15/19.
//  Copyright © 2019 Barbara Feinstein. All rights reserved.
//

import Foundation

struct Game {
    
    //manages how many moves are remaining and adds a collection of characters(guessedLetters) and keeps track of selected letters.
    var word: String
    var incorrectMovesRemaining: Int
    var guessedLetters: [Character]
    //formattedWord - if the character is in guessedLetters, convert it to a string, then append the letter onto the variable, otherwise append _ onto variable
 
    var formattedWord: String {
        var guessedWord = ""
        for letter in word {
            if guessedLetters.contains(letter) {
                guessedWord += "\(letter)"
            } else {
                guessedWord += "_"
            }
        }
        print(guessedWord)
        return guessedWord
    }
    mutating func playerGuessed(letter: Character) {
        guessedLetters.append(letter)
        if !word.contains(letter) {
            incorrectMovesRemaining -= 1
        }
    }
    
}
