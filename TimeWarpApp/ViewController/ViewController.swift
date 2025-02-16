//
//  ViewController.swift
//  TimeWarpApp
//
//  Created by Thad Aldridge on 2/15/25.
//

import UIKit



class ViewController: UIViewController {
 
    @IBOutlet weak var background: UIImageView!

    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var questionLabel: UILabel!
    
    @IBOutlet weak var optionOne: UIButton!
    
    @IBOutlet weak var optionTwo: UIButton!
    
    var adventurelogic = AdventureLogic()

    override func viewDidLoad() {
        super.viewDidLoad()
        loadUI()
    }
    
    
    @IBOutlet weak var scoreLabel: UILabel!
    
    @IBAction func answerSubmitted(_ sender: UIButton) {
        switch sender.tag {
            
        case 1:
        
            let answerSubmitted = sender.titleLabel!.text!
            if adventurelogic.loadUserAnswer(answerSubmitted) {
                load80sUI()
            } else {
                loadPresentUI()
            }
        case 2:
            let answerSubmitted = sender.titleLabel!.text!
            let isCorrect = adventurelogic.compare80sAnswer(answerSubmitted)
            if isCorrect {
                adventurelogic.score += 1
            }
            if adventurelogic.questionIndex < 4 {
                increase80sIndex()
                load80sUI()
            } else {
                stayIn80s()
            }
            
        case 3:
            loadUI()
        
        case 4:
            let answerSubmitted = sender.titleLabel!.text!
            let isCorrect = adventurelogic.comparePresentAnswer(answerSubmitted)
            if isCorrect {
                adventurelogic.score += 1
            }
            if adventurelogic.questionIndex < 3 {
                increasePresentIndex()
                loadPresentUI()
            } else {
                backToPresent()
            }
            
            
        default:
            print("Whatever")
        }
        
    }

    
    func loadUI() {
        optionTwo.isHidden = false
        imageView.image = UIImage(named: "80s_background")
        background.image = UIImage(named: "timewarp2")
        questionLabel.text = adventurelogic.loadquestion.questionLoad
        optionOne.setTitle(adventurelogic.loadquestion.option_oneLoad, for: .normal)
        optionOne.tag = 1
        optionTwo.setTitle(adventurelogic.loadquestion.option_twoLoad, for: .normal)
        optionTwo.tag = 1
    }
    
    
    func load80sUI() {
        scoreLabel.text = "Score: \(adventurelogic.score)"
        questionLabel.text = adventurelogic.questionEighties[adventurelogic.questionIndex].question80s
        imageView.image = UIImage(named: adventurelogic.imageArray80s[adventurelogic.questionIndex])
        background.image = UIImage(named: "80s_background")
        optionOne.tag = 2
        optionOne.setTitle(adventurelogic.questionEighties[adventurelogic.questionIndex].option_one80s, for: .normal)
        optionTwo.tag = 2
        optionTwo.setTitle(adventurelogic.questionEighties[adventurelogic.questionIndex].option_two80s, for: .normal)
        
    }
    
    func loadPresentUI() {
        scoreLabel.text = "Score: \(adventurelogic.score)"
        questionLabel.text = adventurelogic.presentQuestion[adventurelogic.questionIndex].questionPresent
        imageView.image = UIImage(named: adventurelogic.imageArrayPresent[adventurelogic.questionIndex])
        background.image = UIImage(named: "present_background")
        optionOne.tag = 4
        optionOne.setTitle(adventurelogic.presentQuestion[adventurelogic.questionIndex].option_onePresent, for: .normal)
        optionTwo.tag = 4
        optionTwo.setTitle(adventurelogic.presentQuestion[adventurelogic.questionIndex].option_twoPresent, for: .normal)
        
    }
    
    func stayIn80s() {
        optionOne.tag = 3
        optionOne.setTitle("Go back to time warp", for: .normal)
        optionTwo.isHidden = true
        if adventurelogic.score > 2 {
            questionLabel.text = adventurelogic.outcomeSuccessArray[0]
            background.image = UIImage(named: "80s_background")
            imageView.image = UIImage(named: adventurelogic.imageArray80s[adventurelogic.questionIndex])

        } else {
            questionLabel.text = adventurelogic.outcomeFailureArray[0]
            imageView.image = UIImage(named: adventurelogic.imageArray80s[adventurelogic.questionIndex])
            background.image = UIImage(named: "timewarp2")
    
        }
        adventurelogic.score = 0
        adventurelogic.questionIndex = 0
        scoreLabel.text = "Score: \(adventurelogic.score)"
    }
    
    func backToPresent() {
        optionOne.tag = 3
        optionOne.setTitle("Go back to time warp", for: .normal)
        optionTwo.isHidden = true
        if adventurelogic.score > 2 {
            questionLabel.text = adventurelogic.outcomeSuccessArray[1]
            background.image = UIImage(named: "present_background")
            imageView.image = UIImage(named: adventurelogic.imageArrayPresent[adventurelogic.questionIndex])

        } else {
            questionLabel.text = adventurelogic.outcomeFailureArray[1]
            imageView.image = UIImage(named: adventurelogic.imageArrayPresent[adventurelogic.questionIndex])
            background.image = UIImage(named: "timewarp2")
    
        }
        adventurelogic.score = 0
        adventurelogic.questionIndex = 0
        scoreLabel.text = "Score: \(adventurelogic.score)"
    }
    
    func increase80sIndex() {
        if adventurelogic.questionIndex < adventurelogic.questionEighties.count - 1 {
            adventurelogic.questionIndex += 1
        } else {
            adventurelogic.questionIndex = 0
            stayIn80s()
        }
    }
    
    func increasePresentIndex() {
        if adventurelogic.questionIndex < adventurelogic.presentQuestion.count - 1 {
            adventurelogic.questionIndex += 1
        } else {
            adventurelogic.questionIndex = 0
            stayIn80s()
        }
    }
    
}


