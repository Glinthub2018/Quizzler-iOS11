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
        scoreLabel.text = "Score :" + scoreLabel.text! + "%"
        progressLabel.text = "\(questionNumber+1)/ \(totalNoOfQuestions)"
        
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
      
    }
    

    func nextQuestion() {
        
        
        
        if questionNumber < totalNoOfQuestions  {
            questionLabel.text = allQuestions.listOfQuestions[questionNumber].question
            progressLabel.text = "\(questionNumber+1)/ \(totalNoOfQuestions)"

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
            print("You are right !!")
             currentScore = currentScore + 1*100/Float(totalNoOfQuestions)
        
            print("Current Score :\(currentScore)")
            
            scoreLabel.text = String(format : "%.2f", currentScore)
            scoreLabel.text = "Score : " + scoreLabel.text! + "%"
            
        }
        else {
            print("Sorry you are wrong. Please move to next Question.")
        }
        questionNumber = questionNumber + 1
       
    }
    
    
    func startOver() {
       questionNumber = 0
        nextQuestion()
        
    }
    

    
}
