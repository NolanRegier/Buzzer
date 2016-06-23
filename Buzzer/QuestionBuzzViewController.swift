//
//  QuestionBuzzViewController.swift
//  Buzzer
//
//  Created by Nolan Regier on 2016-05-29.
//  Copyright © 2016 Nolan Regier. All rights reserved.
///Volumes/Macintosh HDD/Docs/Documents/School/App Coding/Sait iOS/Buzzer/Buzzer/PlayerInputViewController.swift

import UIKit

class QuestionBuzzViewController: UIViewController {

    
    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var questionTextView: UITextView!
    
    @IBOutlet weak var player1Button: UIButton!
    @IBOutlet weak var player2Button: UIButton!
    @IBOutlet weak var player3Button: UIButton!
    
    var game: Game?
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureUIElements()
        // Do any additional setup after loading the view.
    }
    
    
    func configureUIElements() {
        
        categoryLabel.text = game?.currentQuestion?.category?.title
        priceLabel.text = game?.currentQuestion?.formattedPrice()
        questionTextView.text = game?.currentQuestion?.question
        
        player1Button.setTitle(game?.player1?.name, forState: UIControlState.Normal)
        player2Button.setTitle(game?.player2?.name, forState: UIControlState.Normal)
        player3Button.setTitle(game?.player3?.name, forState: UIControlState.Normal)
    }
    
    func showAnswerInputWithPlayer(player: Player) {
        game?.currentPlayer = player
        performSegueWithIdentifier("ShowAnswerInputSegue", sender: nil)
    }
    
    // #pragma mark - Segues
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
                if segue.identifier == "ShowAnswerInputSegue" {
                    if let destinationViewController = segue.destinationViewController as? AnswerInputViewController {
                        destinationViewController.game = game
                    }
                }
    }
    
    // #pragma mark - IBActions
    
    @IBAction func player1ButtonPressed(sender: UIButton) {
        if let player = self.game?.player1 {
            showAnswerInputWithPlayer(player)
        }
    }
    
    @IBAction func player2ButtonPressed(sender: UIButton) {
        if let player = self.game?.player2 {
            showAnswerInputWithPlayer(player)
        }
    }
    
    @IBAction func player3ButtonPressed(sender: UIButton) {
        if let player = self.game?.player3 {
            showAnswerInputWithPlayer(player)
        }
    }
    
}
    
    

