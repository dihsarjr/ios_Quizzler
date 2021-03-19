//
//  question.swift
//  Quizzier
//
//  Created by Rashid on 19/03/21.
//

import Foundation
struct Question {
    var name: String
    var answer: String
    
    init(names: String, answers: String) {
        self.name = names
        self.answer = answers
    }
}
