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
                                didCancel questionGroup: QuestionGroup,
                                at questionIndex: Int)
    
    func questionViewController(_ viewController: QuestionViewController,
                                didComplete questionGroup: QuestionGroup)
}

class QuestionViewController: UIViewController {

    // MARK: - Instance Properties
    weak var delegate: QuestionViewControllerDelegate?
    
    var questionGroup = QuestionGroup.europeCountries() {
        didSet {
            navigationItem.title = questionGroup.title
        }
    }
    var questionIndex = 0
    
    var correctCount = 0
    var incorrectCount = 0
    
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
        delegate?.questionViewController(self, didCancel: questionGroup, at: questionIndex)
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
        
        questionIndexItem.title = "\(questionIndex + 1)/\(questionGroup.questions.count)"
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
            delegate?.questionViewController(self, didComplete: questionGroup)
            return
        }
        self.questionView.activityIndicator.isHidden = false
        showQuestion()
    }
}

