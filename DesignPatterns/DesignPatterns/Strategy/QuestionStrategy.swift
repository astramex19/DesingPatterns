//
//  QuestionStrategy.swift
//  DesignPatterns
//
//  Created by Fabian Romero Sotelo on 26/05/20.
//  Copyright © 2020 Fabian Romero Sotelo. All rights reserved.
//

protocol QuestionStrategy: class {
    var correctCount: Int { get }
    var incorrectCount: Int { get }
    var title: String { get }
    func currentQuestion() -> Question
    func advanceToNextQuestion() -> Bool
    func markQuestionCorrect(_ question: Question)
    func markQuestionIncorrect(_ question: Question)
    func questionIndexTitle() -> String
}
