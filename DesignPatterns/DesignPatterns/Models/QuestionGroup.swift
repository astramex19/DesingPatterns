//
//  QuestionGroup.swift
//  DesignPatterns
//
//  Created by Fabian Romero Sotelo on 25/05/20.
//  Copyright © 2020 Fabian Romero Sotelo. All rights reserved.
//

import Combine

class QuestionGroup: Codable {
    
    class Score: Codable {
        private enum CodingKeys: String, CodingKey {
            case correctCount
            case incorrectCount
        }
        
        var correctCount = 0 {
            didSet { updateRunningPercentage() }
        }
        var incorrectCount = 0 {
            didSet { updateRunningPercentage() }
        }
        
        @Published public var runningPercentage: Double = 0
        
        init() { }
        
        required init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.correctCount = try container.decode(Int.self, forKey: .correctCount)
            self.incorrectCount = try container.decode(Int.self, forKey: .incorrectCount)
            updateRunningPercentage()
        }
        
        func updateRunningPercentage() {
            let totalCount = correctCount + incorrectCount
            guard totalCount > 0 else {
                runningPercentage = 0
                return
            }
            runningPercentage = Double(correctCount) / Double(totalCount)
        }
        
        func reset() {
            correctCount = 0
            incorrectCount = 0
        }
    }
    
    let questions: [Question]
    private(set) var score: Score
    let title: String
    
    init(questions: [Question],
         score: Score = Score(),
         title: String) {
        self.questions = questions
        self.score = score
        self.title = title
    }
}
