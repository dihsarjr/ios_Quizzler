//
//  QuizBrain.swift
//  Quizzier
//
//  Created by Rashid on 19/03/21.
//

import Foundation

struct QuizBrain {
    let list = [
        Question(names: "1+3=5", answers: "False"),
        Question(names: "1+4=5", answers: "True"),
        Question(names: "1+8=5", answers: "False"),
        Question(names: "1+3=9", answers: "False")
    ]
    var index = 0
    var mark: Float = 0.00
    
    func check(sender: String){
        
    }
}
