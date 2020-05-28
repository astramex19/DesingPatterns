//
//  BaseQuestionStrategy.swift
//  DesignPatterns
//
//  Created by Fabian Romero Sotelo on 27/05/20.
//  Copyright © 2020 Fabian Romero Sotelo. All rights reserved.
//

import Foundation

class BaseQuestionStrategy: QuestionStrategy {
    
    // MARK: - Properties
    var correctCount: Int {
        get { return questionGroup.score.correctCount }
        set { questionGroup.score.correctCount = newValue }
    }
    var incorrectCount: Int {
        get { return questionGroup.score.incorrectCount }
        set { questionGroup.score.incorrectCount = newValue }
    }
    private var questionGroupCaretaker: QuestionGroupCaretaker
    
    private var questionGroup: QuestionGroup {
        return questionGroupCaretaker.selectedQuestionGroup
    }
    private var questionIndex = 0
    private let questions: [Question]
    
    // MARK: - Object Lifecycle
    init(questionGroupCaretaker: QuestionGroupCaretaker,
         questions: [Question]) {
        self.questionGroupCaretaker = questionGroupCaretaker
        self.questions = questions
        
        self.questionGroupCaretaker.selectedQuestionGroup.score =
            QuestionGroup.Score()
    }
    
    // MARK: - QuestionStrategy
    var title: String {
        return questionGroup.title
    }
    
    func currentQuestion() -> Question {
        return questions[questionIndex]
    }
    
    func advanceToNextQuestion() -> Bool {
        try? questionGroupCaretaker.save()
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
