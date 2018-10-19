//
//  FlashcardsModel.swift
//  YiuJonathanHW4
//
//  Created by Jonathan Yiu on 10/19/18.
//  Copyright © 2018 yiuj. All rights reserved.
//

import Foundation

class FlashcardsModel: FlashcardsDataModel {
    
    var flashcards: [Flashcard]!
    private(set) var currentIndex: Int!
    
    init() {
        let f1 = Flashcard(question: "Question 1", answer: "Answer 1")
        let f2 = Flashcard(question: "Question 2", answer: "Answer 2")
        let f3 = Flashcard(question: "Question 3", answer: "Answer 3")
        let f4 = Flashcard(question: "Question 4", answer: "Answer 4")
        let f5 = Flashcard(question: "Question 5", answer: "Answer 5")
        flashcards.append(f1)
        flashcards.append(f2)
        flashcards.append(f3)
        flashcards.append(f4)
        flashcards.append(f5)
        currentIndex = 0
    }
    
    func numberOfFlashcards() -> Int {
        return flashcards.count
    }
    
    func randomFlashcard() -> Flashcard? {
        currentIndex = Int(arc4random_uniform(UInt32(flashcards.count)))
        return flashcards[currentIndex]
    }
    
    func flashcard(atIndex: Int) -> Flashcard? {
        currentIndex = atIndex
        return flashcards[currentIndex]
    }
    
    func nextFlashcard() -> Flashcard? {
        currentIndex! += 1
        if currentIndex >= flashcards.count {
            currentIndex! = 0
        }
        return flashcards[currentIndex]
    }
    
    internal func previousFlashcard() -> Flashcard? {
        currentIndex! -= 1
        if currentIndex < 0 {
            currentIndex! = flashcards.count - 1
        }
        return flashcards[currentIndex]
    }
    
    func insert(question: String, answer: String, favorite: Bool) {
        let flash = Flashcard(question: question, answer: answer, isFavorite: favorite)
        flashcards.append(flash)
    }
    
    func insert(question: String, answer: String, favorite: Bool, atIndex: Int) {
        let flash = Flashcard(question: question, answer: answer, isFavorite: favorite)
        if atIndex <= flashcards.count && atIndex >= 0 {
            flashcards.insert(flash, at: atIndex)
        }
    }
    
    func removeFlashcard() {
        if currentIndex < flashcards.count && currentIndex >= 0{
            flashcards.remove(at: currentIndex)
        }
    }
    
    func removeFlashcard(atIndex: Int) {
        if atIndex < flashcards.count && atIndex >= 0{
            flashcards.remove(at: atIndex)
        }
    }
    
    func toggleFavorite() {
        flashcards[currentIndex].isFavorite = !flashcards[currentIndex].isFavorite
    }
    
    func favoriteFlashcards() -> [Flashcard] {
        var favFlashcards: [Flashcard]! = []
        for flashcard in flashcards {
            if flashcard.isFavorite {
                favFlashcards.append(flashcard)
            }
        }
        return favFlashcards
    }
}
