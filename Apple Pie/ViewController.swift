//
//  ViewController.swift
//  Apple Pie
//
//  Created by Barbara Feinstein on 2/14/19.
//  Copyright © 2019 Barbara Feinstein. All rights reserved.
//

import UIKit

var listOfWords = ["jump", "run", "swim", "cycle", "hike"]

let incorrectMovesAllowed = 7

var totalWins = 0
var totalLosses = 0

class ViewController: UIViewController {
    @IBOutlet weak var correctWordLabel: UILabel!
    
    @IBOutlet weak var treeImageView: UIImageView!
    
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet var letterButtons: [UIButton]!
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        sender.isEnabled = false
    }
    override func viewDidLoad() {
        super.viewDidLoad()
       newRound()
        
    }
    var currentGame: Game!

    func newRound(){
        let newWord = listOfWords.removeFirst()
        currentGame = Game(word: newWord, incorrectMovesRemaining: incorrectMovesAllowed)
        updateUI()
    }
    
    func updateUI() {
        scoreLabel.text = "Wins: \(totalWins), Losses: \(totalLosses)"
        treeImageView.image = UIImage(named: "Tree \(currentGame.incorrectMovesRemaining)")
    }
}

