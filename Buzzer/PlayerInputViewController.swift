//
//  PlayerInputViewController.swift
//  Buzzer
//
//  Created by Nolan Regier on 2016-05-09.
//  Copyright © 2016 Nolan Regier. All rights reserved.
//

import UIKit

class PlayerInputViewController: UIViewController, UIGestureRecognizerDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet weak var playerTxt1: UITextField!
    @IBOutlet weak var playerTxt2: UITextField!
    @IBOutlet weak var playerTxt3: UITextField!
    
    @IBOutlet var playerImgs: [UIImageView]!
    var selectedImageView: UIImageView?
    let imagePicker = UIImagePickerController()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addGestureRecognizer()
    }
    
    func addGestureRecognizer() {
        for imageView in playerImgs {
            let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(PlayerInputViewController.playerImageTapped(_:)))
            gestureRecognizer.delegate = self
            imageView.addGestureRecognizer(gestureRecognizer)
        }
    }
    
    func playerImageTapped(sender: UITapGestureRecognizer) {
        selectedImageView = sender.view as? UIImageView
        showImagePicker()
    }
    
    func showImagePicker() {
        if UIImagePickerController.isSourceTypeAvailable(.PhotoLibrary) {
            imagePicker.delegate = self
            imagePicker.sourceType = .PhotoLibrary
            imagePicker.allowsEditing = false
        }
        presentViewController(imagePicker, animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(picker: UIImagePickerController) {
        print("Cancelled")
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingImage image: UIImage, editingInfo: [String : AnyObject]?) {
        print("Did finish picking image")
    }
    
    @IBAction func playButtonPressed(sender: UIButton!) {
        performSegueWithIdentifier("ShowQuestionPickerSegue", sender: nil)
        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "ShowQuestionPickerSegue" {
            if let destinationViewController = segue.destinationViewController as? QuestionPickerViewController {
                // TODO: Add verification of names in text fields.
                
                let player1 = Player()
                if let enteredName = playerTxt1.text where enteredName.characters.count > 0 {
                    player1.name = enteredName
                }
                else {
                    player1.name = "Player 1"
                }
                
                let player2 = Player()
                if let enteredName = playerTxt2.text where enteredName.characters.count > 0 {
                    player2.name = enteredName
                }
                else {
                    player2.name = "Player 2"
                }
                
                let player3 = Player()
                if let enteredName = playerTxt3.text where enteredName.characters.count > 0 {
                    player3.name = enteredName
                }
                else {
                    player3.name = "Player 3"
                }
                
                //                player1.image = player1ImageView.image
                //                player2.image = player2ImageView.image
                //                player3.image = player3ImageView.image
                //
                let game = Game()
                game.player1 = player1
                game.player2 = player2
                game.player3 = player3
                
                game.loadCategoriesForNewGame(NumberOfCategories, responseHandler: { (error) -> () in
                    
                    if error == nil {
                        // TODO: Load UI
                    } else {
                        print("Error trying to load categories: \(error)")
                    }
                    
                })
                game.currentPlayer = player1
                
                destinationViewController.game = game
            }
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
