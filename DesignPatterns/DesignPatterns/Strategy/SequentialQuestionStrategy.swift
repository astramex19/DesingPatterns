//
//  SequentialQuestionStrategy.swift
//  DesignPatterns
//
//  Created by Fabian Romero Sotelo on 26/05/20.
//  Copyright © 2020 Fabian Romero Sotelo. All rights reserved.
//

class SequentialQuestionStrategy: QuestionStrategy {
    
    // MARK: - Properties
    var correctCount = 0
    var incorrectCount = 0
    private let questionGroup: QuestionGroup
    private var questionIndex = 0
    
    init(questionGroup: QuestionGroup) {
        self.questionGroup = questionGroup
    }
    
    // MARK: - QuestionStrategy
    var title: String {
        return questionGroup.title
    }
    
    func currentQuestion() -> Question {
        return questionGroup.questions[questionIndex]
    }
    
    func advanceToNextQuestion() -> Bool {
        guard questionIndex + 1 < questionGroup.questions.count else { return false }
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
        return "\(questionIndex + 1)\(questionGroup.questions.count)"
    }
}
