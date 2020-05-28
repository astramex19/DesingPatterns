//
//  QuestionGroup.swift
//  DesignPatterns
//
//  Created by Fabian Romero Sotelo on 25/05/20.
//  Copyright © 2020 Fabian Romero Sotelo. All rights reserved.
//

class QuestionGroup: Codable {
    
    class Score: Codable {
        var correctCount = 0
        var incorrectCount = 0
        init() { }
    }
    
    
    let questions: [Question]
    var score: Score
    let title: String
    
    init(questions: [Question],
                score: Score = Score(),
                title: String) {
      self.questions = questions
      self.score = score
      self.title = title
    }
}
