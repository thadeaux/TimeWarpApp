//
//  Questions.swift
//  TimeWarpApp
//
//  Created by Thad Aldridge on 2/16/25.
//
import Foundation

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
