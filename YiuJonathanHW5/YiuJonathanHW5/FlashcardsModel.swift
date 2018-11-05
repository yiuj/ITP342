//
//  FlashcardsModel.swift
//  YiuJonathanHW4
//
//  Created by Jonathan Yiu on 10/19/18.
//  Copyright © 2018 yiuj. All rights reserved.
//

import Foundation

class FlashcardsModel: FlashcardsDataModel {
    static let sharedInstance = FlashcardsModel()
    
    var flashcards: [Flashcard]!
    private(set) var currentIndex: Int!
    
    
    
    init() {
        flashcards = []
        
        currentIndex = 0
        
        
        do {
            let paths = NSSearchPathForDirectoriesInDomains(.documentDirectory,
                                                            .userDomainMask, true)
            let documentsDirectory = paths.first!
            let filePath = "\(documentsDirectory)/Flashcards.plist"
            print(filePath)
            
            let data = try String(contentsOfFile: filePath, encoding: .utf8)
            let myStrings = data.components(separatedBy: .newlines)
            for line in myStrings {
                if line.contains(":") {
                    let attributes = line.split(separator: ":")
                    let flashcard = Flashcard(question: String(attributes[0]),
                                              answer: String(attributes[1]))
                    flashcards.append(flashcard)
                }
            }
        } catch {
            print("Could not read file")
            flashcards.append(Flashcard(question: "Who is the best shooter in NBA history?", answer: "Stephen Curry"))
            flashcards.append(Flashcard(question: "Is USC better than UCLA?", answer: "Yes"))
            flashcards.append(Flashcard(question: "The expression “oy vey” comes from what language?", answer: "Yiddish"))
            flashcards.append(Flashcard(question: "In what year did McDonald’s start serving breakfast with the introduction of the Egg McMuffin?", answer: "1972"))
            flashcards.append(Flashcard(question: "What is the only mammal that can truly fly?", answer: "The bat"))
        }
    }
    
    func save() {
        let paths = NSSearchPathForDirectoriesInDomains(.documentDirectory,
                                                        .userDomainMask, true)
        let documentsDirectory = paths.first!
        let filePath = "\(documentsDirectory)/Flashcards.plist"
        print(filePath)
        
        var cardsString:String = String()
        for item in flashcards {
            let desc: String! = item.description
            cardsString.append(desc)
        }
        do {
            try cardsString.write(toFile: filePath,
                                   atomically: true, encoding: .utf8)
        } catch {
            print("Could not save to file")
        }
    }
    
    func numberOfFlashcards() -> Int {
        return flashcards.count
    }
    
    func randomFlashcard() -> Flashcard? {
        var temp: Int!
        temp = currentIndex
        while temp == currentIndex {
            temp = Int(arc4random_uniform(UInt32(flashcards.count)))
        }
        currentIndex = temp
        return flashcards[currentIndex]
    }
    
    func currentFlashcard() -> Flashcard? {
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
    
    func previousFlashcard() -> Flashcard? {
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
