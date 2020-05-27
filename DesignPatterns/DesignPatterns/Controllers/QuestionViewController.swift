//
//  QuestionViewController.swift
//  DesignPatterns
//
//  Created by Fabian Romero Sotelo on 25/05/20.
//  Copyright © 2020 Fabian Romero Sotelo. All rights reserved.
//

import UIKit

protocol QuestionViewControllerDelegate: class {
    func questionViewController(_ viewController: QuestionViewController,
                                didCancel questionStrategy: QuestionStrategy)
    
    func questionViewController(_ viewController: QuestionViewController,
                                didComplete questionStrategy: QuestionStrategy)
}

class QuestionViewController: UIViewController {
    
    // MARK: - Instance Properties
    weak var delegate: QuestionViewControllerDelegate?
    
    var questionStrategy: QuestionStrategy! {
        didSet {
            navigationItem.title = questionStrategy.title
        }
    }
    
    var questionView: QuestionView! {
        guard isViewLoaded else { return nil }
        return (view as! QuestionView)
    }
    
    private lazy var questionIndexItem: UIBarButtonItem = { [weak self] in
        let item = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        self?.navigationItem.rightBarButtonItem = item
        return item
        }()
    
    // MARK: -View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        showQuestion()
        setupCancelButton()
    }
    
    private func setupCancelButton() {
        let action = #selector(handleCancelPressed(sender:))
        let image = UIImage(named: "ic_menu")
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: image,
                                                           landscapeImagePhone: nil,
                                                           style: .plain,
                                                           target: self,
                                                           action: action)
    }
    
    @objc private func handleCancelPressed(sender: UIBarButtonItem) {
        delegate?.questionViewController(self, didCancel: questionStrategy)
    }
    
    private func showQuestion() {
        let question = questionStrategy.currentQuestion()
        questionIndexItem.title = questionStrategy.questionIndexTitle()
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
        let questions = questionStrategy.currentQuestion()
        questionStrategy.markQuestionCorrect(questions)
        questionView.correctCountLabel.text = String(questionStrategy.correctCount)
        showNextQuestion()
    }
    
    @IBAction func handleIncorrect(_ sender: Any) {
        let questions = questionStrategy.currentQuestion()
        questionStrategy.markQuestionIncorrect(questions)
        questionView.correctCountLabel.text = String(questionStrategy.incorrectCount)
        showNextQuestion()
    }
    
    private func showNextQuestion() {
        guard questionStrategy.advanceToNextQuestion() else {
            delegate?.questionViewController(self, didComplete: questionStrategy)
            return
        }
        self.questionView.activityIndicator.isHidden = false
        showQuestion()
    }
}

