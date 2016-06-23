//
//  AnswerInputViewController.swift
//  Buzzer
//
//  Created by Nolan Regier on 2016-05-30.
//  Copyright © 2016 Nolan Regier. All rights reserved.
//

import UIKit
import CoreData

class AnswerInputViewController: UIViewController {
    
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
        questionTextView.text = game?.currentQuestion?.question
        
    }

    

 
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "ShowAnswerVerificationSegue" {
            if let destinationViewController = segue.destinationViewController as? AnswerVerificationViewController {
                destinationViewController.game = game
            }
        }

    }
    
    @IBAction func checkButtonPressed(sender: AnyObject) {
        game?.currentQuestion?.playerAnswer = answerTextView.text
        performSegueWithIdentifier("ShowAnswerVerificationSegue", sender: nil)
    }
    
   
}
