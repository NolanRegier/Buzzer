//
//  AnswerVerificationViewController.swift
//  Buzzer
//
//  Created by Nolan Regier on 2016-06-01.
//  Copyright © 2016 Nolan Regier. All rights reserved.
//

import UIKit

class AnswerVerificationViewController: UIViewController {

    var game: Game?
    
    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var questionTextView: UITextView!
    @IBOutlet weak var answerTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUIElements()
        // Do any additional setup after loading the view.
    }

    func configureUIElements() {
        
        categoryLabel.text = game?.currentQuestion?.category?.title
        priceLabel.text = game?.currentQuestion?.formattedPrice()
        questionTextView.text = game?.currentQuestion?.answer
        answerTextView.text = game?.currentQuestion?.playerAnswer
    }
    

    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "FinalResultsSeque" {
            if let destinationViewController = segue.destinationViewController as? FinalResultsViewController {
                destinationViewController.game = game
            }
        }
    }
    
    @IBAction func endGame(sender: AnyObject) {
        
        performSegueWithIdentifier("FinalResultsSeque", sender: nil)
    }
    
    @IBAction func correctPushed(sender: AnyObject) {
        game?.currentPlayerGotItRight()
        let alert = UIAlertController(title: "Yeh!!", message: "You got it write", preferredStyle: .Alert)
        alert.addAction(UIAlertAction(title: "OK", style: .Destructive, handler: {alert in print("What now?")}))
        
        presentViewController(alert, animated: true, completion: nil)
    }
    
    @IBAction func wrongPushed(sender: AnyObject) {
        game?.currentPlayerGotItWrong()
        
    }

}
