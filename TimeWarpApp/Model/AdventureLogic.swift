//
//  AdventureLogic.swift
//  TimeWarpApp
//
//  Created by Thad Aldridge on 2/16/25.
//
import Foundation

struct AdventureLogic {
    var questionIndex : Int = 0
    var score : Int = 0
    let imageArray80s = ["80s_music", "80s_movie", "80s_slang", "80s_games", "80s_tv"]
    
    let imageArrayPresent = ["90s_question", "2000s_movie", "2010_games", "2020s_tv"]
    
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
            QuestionPresent("What Lee Child inspired series debuted in 2022?",
                         "Reacher",
                         "Tracker",
                         "Reacher")
    ]
    
    func compare80sAnswer(_ response: String) -> Bool {
        if response == questionEighties[questionIndex].answer80s {
            return true
        } else {
            return false
        }
    }
    
    
    func comparePresentAnswer(_ response: String) -> Bool {
        if response == presentQuestion[questionIndex].answerPresent {
            return true
        } else {
            return false
        }
    }
    
    
    func loadUserAnswer(_ response: String) -> Bool {
        if response == loadquestion.option_oneLoad {
            return true
        } else {
            return false
        }
    }
}
