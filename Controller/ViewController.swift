

import UIKit
import SwiftUI

class ViewController: UIViewController {
    var quizBrain=QuizBrain()

    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var trueButton: UIButton!
    @IBOutlet weak var falseButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    
    @IBAction func answerButtonPressed(_ sender: UIButton) {
        let userAnswer=sender.currentTitle!
        let result=quizBrain.checkAnswer(userAnswer)
//        let actualAnswer=quiz[questionNumber].answer
        if result{
            sender.backgroundColor=UIColor.green
        }else{
            sender.backgroundColor=UIColor.red
        }
        quizBrain.nextQuestion()
      Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
//      updateUI()
    }
    
    
    @objc func updateUI(){
        questionLabel.text=quizBrain.getQuestionText()
        progressBar.progress=quizBrain.getProgress()
        scoreLabel.text="Score: \(quizBrain.getScore())"
        trueButton.backgroundColor=UIColor.clear
        falseButton.backgroundColor=UIColor.clear
        
    }
    
    
    
}

