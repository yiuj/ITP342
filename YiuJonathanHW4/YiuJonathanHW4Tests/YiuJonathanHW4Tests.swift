//
//  YiuJonathanHW4Tests.swift
//  YiuJonathanHW4Tests
//
//  Created by Jonathan Yiu on 10/19/18.
//  Copyright © 2018 yiuj. All rights reserved.
//

import XCTest
@testable import YiuJonathanHW4

class YiuJonathanHW4Tests: XCTestCase {
    
    private var flashcards: FlashcardsModel!
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        flashcards = FlashcardsModel()
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testInit() {
        XCTAssertEqual(flashcards.flashcards[0].answer, "Stephen Curry")
        XCTAssertEqual(flashcards.flashcards[1].answer, "Yes")
        XCTAssertEqual(flashcards.flashcards[2].answer, "Yiddish")
        XCTAssertEqual(flashcards.flashcards[3].answer, "1972")
        XCTAssertEqual(flashcards.flashcards[4].answer, "The bat")
    }
    
    func testNumberOfFlashcards() {
        XCTAssertEqual(flashcards.numberOfFlashcards(), 5)
    }
    
    func testRandomFlashcard() {
        var flash1: Flashcard!
        var flash2: Flashcard!
        flash1 = flashcards.currentFlashcard()
        flash2 = flashcards.randomFlashcard()
        XCTAssertNotEqual(flash1.question, flash2.question)
    }
    
    func testCurrentFlashcard() {
        XCTAssertEqual(flashcards.currentFlashcard()?.question, flashcards.currentFlashcard()?.question)
    }
    
    func testFlashcard() {
        XCTAssertEqual(flashcards.flashcard(atIndex: 4)?.answer, "The bat")
    }
    
    func testNextFlashcard() {
        XCTAssertEqual(flashcards.nextFlashcard()?.answer, "Yes")
    }
    
    func testPreviousFlashcard() {
        XCTAssertEqual(flashcards.previousFlashcard()?.answer, "The bat")
    }
    
    func testInsertWithoutIndex() {
        flashcards.insert(question: "Is this a question?", answer: "Answer", favorite: false)
        XCTAssertEqual(flashcards.flashcards[flashcards.flashcards.count-1].answer, "Answer")
    }
    
    func testInsertWithIndex() {
        flashcards.insert(question: "Is this also a question?", answer: "Also answer", favorite: false, atIndex: 0)
        XCTAssertEqual(flashcards.flashcards[0].answer, "Also answer")
    }
    
    func testRemoveFlashcardWithoutIndex() {
        var original: String!
        var new: String!
        original = flashcards.currentFlashcard()?.answer
        flashcards.removeFlashcard()
        new = flashcards.currentFlashcard()?.answer
        XCTAssertNotEqual(original, new)
    }
    
    func testRemoveFlashcardWithIndex() {
        var original: String!
        var new: String!
        original = flashcards.flashcards[0].answer
        flashcards.removeFlashcard(atIndex: 0)
        new = flashcards.flashcards[0].answer
        XCTAssertNotEqual(original, new)
    }
    
    func testToggleFavorite() {
        var original: Bool!
        var new: Bool!
        original = flashcards.currentFlashcard()?.isFavorite
        flashcards.toggleFavorite()
        new = flashcards.currentFlashcard()?.isFavorite
        XCTAssertNotEqual(original, new)
    }
    
    func testFavoriteFlashcards() {
        var favs: [Flashcard]!
        favs = flashcards.favoriteFlashcards()
        XCTAssertEqual(favs.contains(where: {$0.isFavorite == false}), false)
    }
    
}
