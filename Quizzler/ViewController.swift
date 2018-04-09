//
//  ViewController.swift
//  Quizzler
//
//  Created by Angela Yu on 25/08/2015.
//  Copyright (c) 2015 London App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //Place your instance variables here
    let allQuestions = QuestionBank()
    var answerPicked : Bool = false
    var questionNumber : Int = 0
    var totalNoOfQuestions : Int = 0
    var currentScore : Float = 0
 //   var ABC : CGFloat = 0
    
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet var progressBar: UIView!
    @IBOutlet weak var progressLabel: UILabel!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
         totalNoOfQuestions = allQuestions.listOfQuestions.count
        print(totalNoOfQuestions)
        let firstQuestion = allQuestions.listOfQuestions[0]
        questionLabel.text = firstQuestion.question
        scoreLabel.text = String(format : "%.2f", currentScore)
        scoreLabel.text = "Score : " + scoreLabel.text! + "%"
        progressLabel.text = "\(questionNumber+1)/ \(totalNoOfQuestions)"
        
  //      ABC = view.frame.size.width / CGFloat(totalNoOfQuestions)
        
    //    print("total width :\(view.frame.size.width)")
//         print("each width: \(ABC)")
//        progressBar.frame.size.width = ABC
//
    }


    @IBAction func answerPressed(_ sender: AnyObject) {
        if sender.tag == 1 {
             answerPicked = true
            
        }
        else if sender.tag == 2 {
             answerPicked = false
        }
        
        checkAnswer()
        
        nextQuestion()
    }
    
    
    func updateUI() {
        progressLabel.text = "\(questionNumber+1)/ \(totalNoOfQuestions)"
        scoreLabel.text = String(format : "%.2f", currentScore)
        scoreLabel.text = "Score : " + scoreLabel.text! + "%"
      //  print("Question Number in Update UI: \(questionNumber + 1)")
       
        print(view.frame.size.width)
        progressBar.frame.size.width = (view.frame.size.width / CGFloat(totalNoOfQuestions)) * CGFloat(questionNumber + 1 )
        print(progressBar.frame.size.width)
    }
    

    func nextQuestion() {
    
        if questionNumber < totalNoOfQuestions  {
            questionLabel.text = allQuestions.listOfQuestions[questionNumber].question
            
        }
        else {
            print("You have reached to the end of the test")
            
            let alert = UIAlertController(title: "End of the Quiz", message: "Congratulations You completed the quiz. Do you want to restart?", preferredStyle: .alert)
            let restartAction = UIAlertAction(title: "Restart Quiz", style: .default) { (UIAlertAction) in
                self.startOver()
            }
            alert.addAction(restartAction)
            present(alert, animated: true, completion: nil)
        }
      
    }
    
    
    func checkAnswer() {
        let correctAnswer = allQuestions.listOfQuestions[questionNumber].answer
        print("Question No : \(questionNumber+1)")
        
        if (answerPicked == correctAnswer) {
             ProgressHUD.showSuccess("Correct Answer!")
             currentScore = currentScore + 1*100/Float(totalNoOfQuestions)
        
            print("Current Score :\(currentScore)")
            
        }
        else {
             ProgressHUD.showError("Incorrect Answer !")
           
        }
        updateUI()
        questionNumber = questionNumber + 1
       
    }
    
    
    func startOver() {
       questionNumber = 0
       currentScore = 0
     //   nextQuestion()
        viewDidLoad()
        
    }
    

    
}
