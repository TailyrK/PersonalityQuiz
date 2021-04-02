//
//  QuestionViewController.swift
//  QuizGame
//
//  Created by A.M. Class on 3/24/21.
//

import UIKit

class QuestionViewController: UIViewController {
    
    @IBOutlet weak var questionLabel: UILabel!
    
    @IBOutlet weak var questionOneStackView: UIStackView!
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    @IBOutlet weak var button4: UIButton!
    
    
    @IBOutlet weak var questionTwoStackView: UIStackView!
    @IBOutlet weak var button5: UIButton!
    @IBOutlet weak var button6: UIButton!
    @IBOutlet weak var button7: UIButton!
    @IBOutlet weak var button8: UIButton!
    
    
    @IBOutlet weak var questionThreeStackView: UIStackView!
    @IBOutlet weak var button9: UIButton!
    @IBOutlet weak var button10: UIButton!
    @IBOutlet weak var button11: UIButton!
    @IBOutlet weak var button12: UIButton!
    
    @IBOutlet weak var questionProgressView: UIProgressView!
    
    var question: [Question] = [
        Question(text: "How do you handle a fight", type: .question1, answer: [
        Answer(text: "overpower the opponet with stength and intellengence", type: .Jotaro),
        Answer(text: "thinkk the battle all the way through before deciding to fight", type: .Avdol),
        Answer(text: "be overly confident and underestimate the opponet", type: .Polnareff),
        Answer(text: "predict the outcome of the match but still neeed your grandson for help", type: .Joseph)
        ]),
        Question(text: "How would you describe yourself", type: .question2, answer: [
            Answer(text: "cold but caring", type: .Jotaro),
            Answer(text: "mature basically the mentor of the group", type: .Avdol),
            Answer(text: "outgoing but stupid", type: .Joseph),
            Answer(text: "oldest of the group and the wise one", type: .Joseph)
        ]),
        Question(text: "If you had any stand power what would it be ", type: .question3, answer: [
            Answer(text: "supernatural fire abilites", type: .Avdol),
            Answer(text: "punchy ghost that literally can stop time", type: .Jotaro),
            Answer(text: "hamon stand", type: .Joseph),
            Answer(text: "super fast sword", type: .Polnareff)
        ])
    ]
    
    var questionIndex = 0
    
    var answerChosen: [Answer] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateUI()

        
    }
    
    func updateUI() {
        
        questionOneStackView.isHidden = true
        questionTwoStackView.isHidden = true
        questionThreeStackView.isHidden = true
        
        navigationItem.title = ("Question #\(questionIndex + 1)")
        
        let currentQuestion = question[questionIndex]
        let currentAnswer = currentQuestion.answer
        let totalProgress = Float(questionIndex) / Float(question.count)
        
        questionLabel.text = currentQuestion.text
        questionProgressView.setProgress(totalProgress, animated: true)
        
        switch currentQuestion.type {
        case.question1:
            updateQuestionOneStackView(using: currentAnswer)
        case.question2:
            questionTwoStackView.isHidden = false
            updateQuestionTwoStackView(using: currentAnswer)
        case.question3:
            questionThreeStackView.isHidden = false
            updateQuestionThreeStackView(using: currentAnswer)
            
        }
    }
    
    func updateQuestionOneStackView(using answers: [Answer]) {
        questionOneStackView.isHidden = false
        button1.setTitle(answers[0].text, for: .normal)
        button2.setTitle(answers[1].text, for: .normal)
        button3.setTitle(answers[2].text, for: .normal)
        button4.setTitle(answers[3].text, for: .normal)
    }
    
    func updateQuestionTwoStackView(using answers: [Answer]) {
        questionTwoStackView.isHidden = false
        button5.setTitle(answers[0].text, for: .normal)
        button6.setTitle(answers[1].text, for: .normal)
        button7.setTitle(answers[2].text, for: .normal)
        button8.setTitle(answers[3].text, for: .normal)
        
    }
    
    func updateQuestionThreeStackView(using answers: [Answer]) {
        questionThreeStackView.isHidden = false
        button9.setTitle(answers[0].text, for: .normal)
        button10.setTitle(answers[1].text, for: .normal)
        button11.setTitle(answers[2].text, for: .normal)
        button12.setTitle(answers[3].text, for: .normal)
    }
    
    @IBAction func questionOneButtonPressed(_ sender: UIButton) {
        let currentAnswers = question[questionIndex].answer
        
        switch sender {
        case button1:
            answerChosen.append(currentAnswers[0])
        case button2:
            answerChosen.append(currentAnswers[0])
        case button3:
            answerChosen.append(currentAnswers[0])
        case button4:
            answerChosen.append(currentAnswers[0])
        default:
            break
        }
        
        nextQuestion()
    }
    
    @IBAction func questionTwoButtonPressed(_ sender: UIButton){
        let currentAnswers = question[questionIndex].answer
        
        switch sender {
        case button5:
            answerChosen.append(currentAnswers[0])
        case button6:
            answerChosen.append(currentAnswers[0])
        case button7:
            answerChosen.append(currentAnswers[0])
        case button8:
            answerChosen.append(currentAnswers[0])
        default:
            break
            
        }
        
        nextQuestion()
    }
    
    @IBAction func questionThreeButtonPressed(_ sender: UIButton) {
    let currentAnswers = question[questionIndex].answer
    
    switch sender {
    case button9:
        answerChosen.append(currentAnswers[0])
    case button10:
        answerChosen.append(currentAnswers[0])
    case button11:
        answerChosen.append(currentAnswers[0])
    case button12:
        answerChosen.append(currentAnswers[0])
    default:
        break
        
    }
    
    nextQuestion()
}
    
    func nextQuestion() {
        questionIndex += 1
        
        if questionIndex < question.count {
            updateUI()
        } else {
            performSegue(withIdentifier: "ResultsSegue", sender: nil)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ResultsSegue" {
            let resultsVieewController = segue.destination as! ResultsViewController
            resultsVieewController.responses = answerChosen
        }
    }
}
