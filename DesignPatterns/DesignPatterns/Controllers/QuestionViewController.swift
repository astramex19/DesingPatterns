//
//  QuestionViewController.swift
//  DesignPatterns
//
//  Created by Fabian Romero Sotelo on 25/05/20.
//  Copyright © 2020 Fabian Romero Sotelo. All rights reserved.
//

import UIKit

class QuestionViewController: UIViewController {

    // MARK: - Instance Properties
    var questionGroup = QuestionGroup.europeCountries()
    var questionIndex = 0
    
    var correctCount = 0
    var incorrectCount = 0
    
    var questionView: QuestionView! {
        guard isViewLoaded else { return nil }
        return (view as! QuestionView)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        showQuestion()
    }
    
    private func showQuestion() {
        let question = questionGroup.questions[questionIndex]
        questionView.flagImage.isHidden = true
        
        guard let url = question.flagURL else { return }
        
        questionView.flagImage.load(url: url) { [weak self] in
            self?.questionView.activityIndicator.isHidden = true
        }
        
        questionView.promptLabel.text = question.prompt
        questionView.answerLabel.text = question.answer
        
    }
    
    // MARK: - Actions
    @IBAction func toggleAnswerLabels(_ sender: UIGestureRecognizer) {
        if !questionView.activityIndicator.isHidden { return }
        questionView.flagImage.isHidden = !questionView.flagImage.isHidden
    }
    
    @IBAction func handleCorrect(_ sender: Any) {
        correctCount += 1
        questionView.correctCountLabel.text = "\(correctCount)"
        showNextQuestion()
    }
    
    @IBAction func handleIncorrect(_ sender: Any) {
        incorrectCount += 1
        questionView.incorrectCountLabel.text = "\(incorrectCount)"
        showNextQuestion()
    }
    
    private func showNextQuestion() {
        questionIndex += 1
        guard questionIndex < questionGroup.questions.count else {
            // TODO: Handle this
            return
        }
        self.questionView.activityIndicator.isHidden = false
        showQuestion()
    }
}

