//
//  Flashcard.swift
//  YiuJonathanHW4
//
//  Created by Jonathan Yiu on 10/19/18.
//  Copyright © 2018 yiuj. All rights reserved.
//

import Foundation

struct Flashcard: CustomStringConvertible {
    var question: String!
    var answer: String!
    var isFavorite: Bool!
    
    init(question: String, answer: String) {
        self.question = question
        self.answer = answer
        self.isFavorite = false
    }
    init(question: String, answer: String, isFavorite: Bool) {
        self.question = question
        self.answer = answer
        self.isFavorite = isFavorite
    }
    var description: String {
        let desc = "\(question!):\(answer!)\n"
        return desc
    }
}
