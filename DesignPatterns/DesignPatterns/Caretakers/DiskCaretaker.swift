//
//  DiskCaretaker.swift
//  DesignPatterns
//
//  Created by Fabian Romero Sotelo on 27/05/20.
//  Copyright © 2020 Fabian Romero Sotelo. All rights reserved.
//

import Foundation

class QuestionGroupCaretaker {
    // MARK: - Properties
    let fileName = "QuestionGroupData"
    var questionGroups: [QuestionGroup] = []
    var selectedQuestionGroup: QuestionGroup!
    
    // MARK: - Object Lifecycle
    init() {
        loadQuestionGroups()
    }
    
    private func loadQuestionGroups() {
        if let questionGroups = try? DiskCaretaker.retrieve([QuestionGroup].self, from: fileName) {
            self.questionGroups = questionGroups
            return
        }
        
        let bundle = Bundle.main
        let url = bundle.url(forResource: fileName, withExtension: "json")!
        self.questionGroups = try! DiskCaretaker.retrieve([QuestionGroup].self, from: url)
        try! save()
    }
    
    // MARK: - Instance Methods
    func save() throws {
        try DiskCaretaker.save(questionGroups, to: fileName)
    }
}
