//
//  AppSettings.swift
//  DesignPatterns
//
//  Created by Fabian Romero Sotelo on 27/05/20.
//  Copyright © 2020 Fabian Romero Sotelo. All rights reserved.
//

import Foundation

class AppSettings {
    // MARK: - Keys
    private struct Keys {
        static let questionStrategy = "questionStrategy"
    }
    
    // MARK: - Static Properties
    static let shared = AppSettings()
    
    // MARK: - Instance Properties
    var questionStrategyType: QuestionStrategyType {
        get {
            let rawValue = userDefaults.integer(forKey: Keys.questionStrategy)
            return QuestionStrategyType(rawValue: rawValue)!
        } set {
            userDefaults.set(newValue.rawValue, forKey: Keys.questionStrategy)
        }
    }
    private let userDefaults = UserDefaults.standard
    
    // MARK: - Object Lifecycle
    private init() { }
    
    // MARK: - Instance Properties
    func questionStrategy(for questionGroupCaretaker: QuestionGroupCaretaker) -> QuestionStrategy {
        return questionStrategyType.questionStrategy(for: questionGroupCaretaker)
    }
}

enum QuestionStrategyType: Int, CaseIterable {
    case random
    case sequential
    
    func title() -> String {
        switch self {
        case .random:  return "Random"
        case .sequential:  return "Sequential"
        }
    }
    
    func questionStrategy(for questionGroupCaretaker: QuestionGroupCaretaker) -> QuestionStrategy {
        switch self {
        case .random: return RandomQuestionStrategy(questionGroupCaretaker: questionGroupCaretaker)
        case .sequential:  return SequentialQuestionStrategy(questionGroupCaretaker: questionGroupCaretaker)
        }
    }
}
