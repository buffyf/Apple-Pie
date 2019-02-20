//
//  ViewController.swift
//  Apple Pie
//
//  Created by Barbara Feinstein on 2/14/19.
//  Copyright © 2019 Barbara Feinstein. All rights reserved.
//

import UIKit


class ViewController: UIViewController {
    @IBOutlet weak var correctWordLabel: UILabel!
    @IBOutlet weak var treeImageView: UIImageView!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet var letterButtons: [UIButton]!
    
//    Define Words
    var listOfWords: [String] = ["jump", "run", "swim", "cycle", "hike"]
//    Define Number of Wins/Losses
    let incorrectMovesAllowed = 7
    
    var totalWins = 0 {
        didSet{
            newRound()
        }
    }
    var totalLosses = 0 {
        didSet {
            newRound()
        }
    }
    
 
//    Begin First Round
    override func viewDidLoad() {
        super.viewDidLoad()
        newRound()
        
    }
//    New instance of Game, holds game's value so it can be updated
       var currentGame: Game!
//    newRound method that has new instance of Game. currentGame is a property that holds the current game's value so that i t can be updated.  Game takes a new word in the initializer by removing the first value from listOfWords and sets incorrectMovesRemaining to the number of moves you allow and stores in incorrectMovesAllowed.
    func newRound(){
        if !listOfWords.isEmpty{
        let newWord = listOfWords.removeFirst()
            currentGame = Game(word: newWord, incorrectMovesRemaining: incorrectMovesAllowed, guessedLetters: [])
            enableLetterButtons(true)
        updateUI()
        } else {
            enableLetterButtons(false)
        }
    }
    
    func enableLetterButtons(_ enable: Bool) {
        for button in letterButtons {
            button.isEnabled = enable
        }
    }
//    updateUI method will update UI interface to reflect a new game. the score label uses string interpolation to combine totalWins and totalLosses. images are named "Tree X" where "X" is the number of moves remaining.
    func updateUI() {
        var letters = [String]()
        for letter in currentGame.formattedWord {
            letters.append(String(letter))
        }
        //separates each letter in word with a space
        let wordWithSpacing = letters.joined(separator: " ")
        correctWordLabel.text = wordWithSpacing
        scoreLabel.text = "Wins: \(totalWins), Losses: \(totalLosses)"
        treeImageView.image = UIImage(named: "Tree \(currentGame.incorrectMovesRemaining)")
    }
    //determines if a game is won or lost. game is lost if incorrectMovesRemaining equals 0. game is won if a player has not lost and if current game's word property is equal to the formattedWord (it won't have any underscores if every letter has been guessed). when a player wins, total wins will increment.
    func updateGameState() {
        if currentGame.incorrectMovesRemaining == 0 {
            totalLosses += 1
        } else if currentGame.word ==
            currentGame.formattedWord {
            totalWins += 1
        }else {
            updateUI()
        }
    }
    //button is disabled after pressed. After button is pressed you should read the button's title and determine if that letter is a word.  First it reads button in normal state.  the letter should be lowercased  and converted from a string to character to compare it with letters in the word.
    @IBAction func buttonPressed(_ sender: UIButton) {
        sender.isEnabled = false
        let letterString = sender.title(for: .normal)!
        let letter = Character(letterString.lowercased())
        currentGame.playerGuessed(letter: letter)
        updateGameState()
    }
    
 
    
    

    
}

