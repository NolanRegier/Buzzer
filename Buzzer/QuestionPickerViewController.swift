//
//  QuestionPickerViewController.swift
//  Buzzer
//
//  Created by Nolan Regier on 2016-05-09.
//  Copyright © 2016 Nolan Regier. All rights reserved.
//

import UIKit

let NumberOfCategories = 4
let QuestionsPerCategory = 5

class QuestionPickerViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {

    @IBOutlet weak var questionCollectionView: UICollectionView!
    
    var game: Game?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        game?.loadCategoriesForNewGame()

    }
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    //Manditory
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return NumberOfCategories * QuestionsPerCategory
    }
    
    //Manditory
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCellWithReuseIdentifier("QuestionPicker", forIndexPath: indexPath) as? QuestionPickerCell {
            let price = priceFromIndexPath(indexPath)
            cell.priceLbl.text = "$\(price)"
            
            let categoryIndex = categoryFromIndexPath(indexPath)
            if categoryIndex < game?.categories.count {
                let category = game?.categories[categoryIndex]
                cell.answered = category?.answeredQuestions[price] != nil
            }
            
            return cell
        }
        
        return UICollectionViewCell(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        if let layout = questionCollectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            let interItemSpacing = layout.minimumInteritemSpacing
            let totalSpace: CGFloat = CGFloat(NumberOfCategories - 1) * interItemSpacing
            let dimension = floor((questionCollectionView.bounds.width - totalSpace) / CGFloat(NumberOfCategories))
            return CGSize(width: dimension, height: dimension)
        }
        
        return CGSize(width: 50, height: 50)
    }
    

    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        let selectedPrice = priceFromIndexPath(indexPath)
        let selectedCategory = categoryFromIndexPath(indexPath)
        
        if let category = game?.categories[selectedCategory] {
            if category.answeredQuestions[selectedPrice] != nil {
                return
            }
            
//            do {
//                let question = try Question.loadQuestion(category, price: selectedPrice)
//                game?.currentQuestion = question
//                performSegueWithIdentifier("ShowQuestionBuzzSeque", sender: nil)
//            }
//            catch let error {
//                print("Error trying to load question: \(error)")
//            }
            Question.loadQuestion(category, price: selectedPrice, responseHandler: { (error, question) -> () in
                
                if error == nil {
                    
                    self.game?.currentQuestion = question
                    
                    dispatch_async(dispatch_get_main_queue(),{
                        self.performSegueWithIdentifier("ShowQuestionBuzzSegue", sender: nil)
                    })
                    
                } else {
                    print("Error trying to load question: \(error)")
                }
                
            })
        }
        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
                if segue.identifier == "ShowQuestionBuzzSegue" {
                    if let destinationViewController = segue.destinationViewController as? QuestionBuzzViewController {
                        destinationViewController.game = game
                    }
                }
    }

    

    private func priceFromIndexPath(indexPath: NSIndexPath) -> Int {
        let row = indexPath.item / NumberOfCategories
        let price = (row + 1) * 200
        return price
    }
    
    private func categoryFromIndexPath(indexPath: NSIndexPath) -> Int {
        let column = indexPath.item % NumberOfCategories
        return column
        
    }
}
