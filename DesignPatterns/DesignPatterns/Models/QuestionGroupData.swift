//
//  QuestionGroupData.swift
//  DesignPatterns
//
//  Created by Fabian Romero Sotelo on 25/05/20.
//  Copyright © 2020 Fabian Romero Sotelo. All rights reserved.
//

import UIKit

extension QuestionGroup {
    
    
    static func allGroups() -> [QuestionGroup] {
        return [americanCountries(), europeCountries(), asianCountries(), africanCountries()]
    }
    
    static func americanCountries() -> QuestionGroup {
        let questions = [
            Question(prompt: "Canada", answer: "Ottawa", flagURL: URL(string: "https://www.countryflags.io/ca/shiny/64.png")),
            Question(prompt: "USA", answer: "Washington", flagURL: URL(string: "https://www.countryflags.io/us/shiny/64.png")),
            Question(prompt: "Mexico", answer: "Cd Mex", flagURL: URL(string: "https://www.countryflags.io/mx/shiny/64.png")),
            Question(prompt: "Colombia", answer: "Bogota", flagURL: URL(string: "https://www.countryflags.io/co/shiny/64.png")),
            Question(prompt: "Brazil", answer: "Brazilia", flagURL: URL(string: "https://www.countryflags.io/br/shiny/64.png"))
        ]
        
        return QuestionGroup(questions: questions, title: "America countries")
    }
    
    static func europeCountries() -> QuestionGroup {
        let questions = [
            Question(prompt: "France", answer: "Paris", flagURL: URL(string: "https://www.countryflags.io/fr/shiny/64.png")),
            Question(prompt: "Italy", answer: "Rome", flagURL: URL(string: "https://www.countryflags.io/it/shiny/64.png")),
            Question(prompt: "Crotia", answer: "Zagreb", flagURL: URL(string: "https://www.countryflags.io/hr/shiny/64.png")),
            Question(prompt: "Greece", answer: "Athens", flagURL: URL(string: "https://www.countryflags.io/gr/shiny/64.png")),
            Question(prompt: "Spain", answer: "Madrid", flagURL: URL(string: "https://www.countryflags.io/es/shiny/64.png"))
        ]
        
        return QuestionGroup(questions: questions, title: "Europe countries")
    }
    
    static func asianCountries() -> QuestionGroup {
        let questions = [
            Question(prompt: "China", answer: "Beijing", flagURL: URL(string: "https://www.countryflags.io/cn/shiny/64.png")),
            Question(prompt: "Taiwan", answer: "Taipei", flagURL: URL(string: "https://www.countryflags.it/tw/shiny/64.png")),
            Question(prompt: "Vietnam", answer: "Hanoi", flagURL: URL(string: "https://www.countryflags.hr/vn/shiny/64.png")),
            Question(prompt: "Japan", answer: "Tokio", flagURL: URL(string: "https://www.countryflags.io/jp/shiny/64.png")),
            Question(prompt: "Korea", answer: "Seoul", flagURL: URL(string: "https://www.countryflags.io/kr/shiny/64.png"))
        ]
        
        return QuestionGroup(questions: questions, title: "Asian countries")
    }
    
    static func africanCountries() -> QuestionGroup {
        let questions = [
            Question(prompt: "Ghana", answer: "Accra", flagURL: URL(string: "https://www.countryflags.io/gh/shiny/64.png")),
            Question(prompt: "Guyana", answer: "Georgetown", flagURL: URL(string: "https://www.countryflags.io/gy/shiny/64.png")),
            Question(prompt: "Cameroon", answer: "Yaounde", flagURL: URL(string: "https://www.countryflags.io/cm/shiny/64.png")),
            Question(prompt: "Congo", answer: "Kinshasa", flagURL: URL(string: "https://www.countryflags.io/cg/shiny/64.png")),
            Question(prompt: "Bahrain", answer: "Manama", flagURL: URL(string: "https://www.countryflags.io/bh/shiny/64.png"))
        ]
        
        return QuestionGroup(questions: questions, title: "African countries")
    }
}
