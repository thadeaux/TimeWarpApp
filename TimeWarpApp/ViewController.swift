//
//  ViewController.swift
//  TimeWarpApp
//
//  Created by Thad Aldridge on 2/15/25.
//

import UIKit

struct QuestionLoad {
    
    init(_ quesL: String, _ o_oneL:String, _ o_twoL: String, _ ansL: String) {
        questionLoad = quesL
        option_oneLoad = o_oneL
        option_twoLoad = o_twoL
        answerLoad = ansL
    }
    
    var questionLoad: String
    var answerLoad: String
    var option_oneLoad: String
    var option_twoLoad: String
    
}

struct Question80s {
    
    init(_ quesE: String, _ o_oneE:String, _ o_twoE: String, _ ansE: String) {
        question80s = quesE
        option_one80s = o_oneE
        option_two80s = o_twoE
        answer80s = ansE
    }
    
    var question80s: String
    var answer80s: String
    var option_one80s: String
    var option_two80s: String
    
}

struct QuestionPresent {
    
    init(_ quesP: String, _ o_oneP:String, _ o_twoP: String, _ ansP: String) {
        questionPresent = quesP
        option_onePresent = o_oneP
        option_twoPresent = o_twoP
        answerPresent = ansP
    }
    
    var questionPresent: String
    var answerPresent: String
    var option_onePresent: String
    var option_twoPresent: String
    
}

class ViewController: UIViewController {
 
    @IBOutlet weak var background: UIImageView!

    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var questionLabel: UILabel!
    
    @IBOutlet weak var optionOne: UIButton!
    
    @IBOutlet weak var optionTwo: UIButton!
    
    var questionIndex : Int = 0
    var score : Int = 0
    let imageArray80s = ["80s_music", "80s_movie", "80s_slang", "80s_games", "80s_tv"]
    
    let outcomeSuccessArray = ["Your 80s knowledge has paid off! You can stay!","You scored high enough to go back to the future!"]
    
    let outcomeFailureArray = ["You didn't score high enough to stay!","You didn't score high enough to come back. You're stuck here for a while."]
    
    
    let loadquestion = QuestionLoad("You've entered a time warp to the 1980's! It's up to you to try to remain in the 80's or go back to the future!","Stay in the 80s", "Go back to the future","Whichever")
    
    let questionEighties = [
        Question80s("The tour for the artist/album shown above broke the record for highest grossing with sales of how much?",
                    "$85 million",
                    "124 million",
                    "124 million"),
        Question80s("Who directed the movie shown above?",
                    "John Hughes",
                    "Steven Speilberg",
                    "John Hughes"),
        Question80s("What 80s phrase was used to indicate approval?",
                    "As if",
                    "Totally",
                    "Totally"),
        Question80s("What color is the ghost named Blinky in Pac-Man?",
                    "Orange",
                    "Red",
                    "Red"),
        Question80s("What is the name of the car shown above?",
                    "CARR",
                    "KITT",
                    "KITT")
    ]
    
    let presentQuestion = [
            QuestionPresent("What band is pictured above?",
                         "Foo Fighters",
                         "Nirvana",
                         "Nirvana"),
            QuestionPresent("Who starred in the movie above?",
                         "Tom Cruise",
                         "Jeremy Renner",
                         "Tom Cruise"),
            QuestionPresent("What video game franchise did Black Ops belong to?",
                         "Halo",
                         "Call of Duty",
                         "Call of Duty"),
            QuestionPresent("What color is the ghost named Blinky in Pac-Man?",
                         "Orange",
                         "Red",
                         "Red"),
            QuestionPresent("What Lee Child inspired series debuted in 2022?",
                         "Reacher",
                         "Tracker",
                         "Reacher")
            ]

    override func viewDidLoad() {
        super.viewDidLoad()
        loadUI()
    }
    
    
    @IBOutlet weak var scoreLabel: UILabel!
    
    @IBAction func answerSubmitted(_ sender: UIButton) {
        switch sender.tag {
            
        case 1:
        
            let answerSubmitted = sender.titleLabel!.text!
            if loadUserAnswer(answerSubmitted) {
                load80sUI()
            }
        case 2:
            let answerSubmitted = sender.titleLabel!.text!
            let isCorrect = compare80sAnswer(answerSubmitted)
            if isCorrect {
                score += 1
            }
            
            increaseIndex()
            load80sUI()
        default:
            print("unknown")
        }
        
    }

    
    func loadUI() {
        questionLabel.text = loadquestion.questionLoad
        optionOne.setTitle(loadquestion.option_oneLoad, for: .normal)
        optionOne.tag = 1
        optionTwo.setTitle(loadquestion.option_twoLoad, for: .normal)
        optionTwo.tag = 1
    }
    
    
    
    func loadUserAnswer(_ response: String) -> Bool {
        if response == loadquestion.option_oneLoad {
            return true
        } else {
            return false
        }
    }
    
    func load80sUI() {
        scoreLabel.text = "Score: \(score)"
        questionLabel.text = questionEighties[questionIndex].question80s
        imageView.image = UIImage(named: imageArray80s[questionIndex])
        background.image = UIImage(named: "80s_background")
        optionOne.tag = 2
        optionOne.setTitle(questionEighties[questionIndex].option_one80s, for: .normal)
        optionTwo.tag = 2
        optionTwo.setTitle(questionEighties[questionIndex].option_two80s, for: .normal)
            
    }
    
    func compare80sAnswer(_ response: String) -> Bool {
        if response == questionEighties[questionIndex].answer80s {
            return true
        } else {
            return false
        }
    }
    
    func increaseIndex() {
        if questionIndex < questionEighties.count - 1 {
            questionIndex += 1
        } else {
            questionIndex = 0
            score = 0
            stayIn80s()
        }
    }
    
    func stayIn80s() {
        if score > 2 {
            questionLabel.text = outcomeSuccessArray[0]
            background.image = UIImage(named: "80s_background")
            imageView.image = UIImage(named: imageArray80s[questionIndex])
        } else {
            questionLabel.text = outcomeFailureArray[0]
            imageView.image = UIImage(named: imageArray80s[questionIndex])
            background.image = UIImage(named: "timewarp2")
        }
    }
}


