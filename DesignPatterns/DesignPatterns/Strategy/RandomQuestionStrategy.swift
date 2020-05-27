//
//  RandomQuestionStrategy.swift
//  DesignPatterns
//
//  Created by Fabian Romero Sotelo on 26/05/20.
//  Copyright © 2020 Fabian Romero Sotelo. All rights reserved.
//

import GameplayKit.GKRandomSource

class RandomQuestionStrategy: QuestionStrategy {
    
    // MARK: - Properties
    var correctCount: Int = 0
    var incorrectCount: Int = 0
    private let questionGroup: QuestionGroup
    private var questionIndex = 0
    private let questions: [Question]
    
    init(questionGroup: QuestionGroup) {
        self.questionGroup = questionGroup
        let randomSource = GKRandomSource.sharedRandom()
        guard let randomQuestions = randomSource.arrayByShufflingObjects(in: questionGroup.questions) as? [Question] else {  questions = [Question]()
            return
        }
        self.questions = randomQuestions
    }
    
    // MARK: - QuestionStrategy
    var title: String {
        return questionGroup.title
    }
    
    func currentQuestion() -> Question {
        return questions[questionIndex]
    }
    
    func advanceToNextQuestion() -> Bool {
        guard questionIndex + 1 < questions.count else {
            return false
        }
        questionIndex += 1
        return true
    }
    
    func markQuestionCorrect(_ question: Question) {
        correctCount += 1
    }
    
    func markQuestionIncorrect(_ question: Question) {
        incorrectCount += 1
    }
    
    func questionIndexTitle() -> String {
        return "\(questionIndex + 1)/\(questions.count)"
    }
}

