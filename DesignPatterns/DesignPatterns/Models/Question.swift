//
//  Question.swift
//  DesignPatterns
//
//  Created by Fabian Romero Sotelo on 25/05/20.
//  Copyright © 2020 Fabian Romero Sotelo. All rights reserved.
//

import UIKit

class Question: Codable {
    let prompt: String
    let answer: String
    let flagURL: URL?
    
    init(prompt: String, answer: String, flagURL: URL?) {
      self.answer = answer
      self.flagURL = flagURL
      self.prompt = prompt
    }
}
