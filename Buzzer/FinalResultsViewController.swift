//
//  FinalResultsViewController.swift
//  Buzzer
//
//  Created by Nolan Regier on 2016-06-13.
//  Copyright © 2016 Nolan Regier. All rights reserved.
//

import UIKit
import CoreData

class FinalResultsViewController: UIViewController {
    
    @IBOutlet var playerName: [UILabel]!

    
    @IBOutlet weak var playerNames: UILabel!
    
    var game: Game?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    func configureUI() {
        var players: [Player] = [Player]()

        
        if let player1 = game?.player1 {
            players.append(player1)
        }
        if let player2 = game?.player2 {
            players.append(player2)
        }
        if let player3 = game?.player3 {
            players.append(player3)
        }
        
        players.sortInPlace {$0.score > $1.score}
        
        for i in 0...2 {
            playerName[i].text = "\(players[i].name)  \(players[i].score)"
//           playerNames.tag(NSInteger(i)).text
        }
        saveHighScore(players[0])
    }
    
    func saveHighScore(player: Player) {
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        
        let highScore = NSEntityDescription.insertNewObjectForEntityForName("HighScore", inManagedObjectContext: appDelegate.managedObjectContext) as! HighScore
        
        highScore.playerName = player.name
        highScore.playerScore = player.score
        
        appDelegate.saveContext()
    }
    
    @IBAction func playAgain(sender: UIButton) {
        
        
    }
    
    @IBAction func returnToMenuAction(sender: UIButton) {
        performSegueWithIdentifier("unwindToMenuVC", sender: nil)
        
    }
    
    @IBAction func shareHighScore(sender: UIButton) {
        
        
    }
    
  
    
}
