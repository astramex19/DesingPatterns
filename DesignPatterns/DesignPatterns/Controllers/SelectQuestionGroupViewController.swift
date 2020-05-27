//
//  SelectQuestionGroupViewController.swift
//  DesignPatterns
//
//  Created by Fabian Romero Sotelo on 26/05/20.
//  Copyright © 2020 Fabian Romero Sotelo. All rights reserved.
//

import UIKit

class SelectQuestionGroupViewController: UIViewController {
    
    // MARK: - Outlets
    @IBOutlet weak var tableView: UITableView! {
        didSet {
            tableView.tableFooterView = UIView()
        }
    }
    
    // MARK: - Properties
    let questionGroups = QuestionGroup.allGroups()
    private var selectedQuestionGroup: QuestionGroup!
    
    // MARK: - View Lifecycle
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        deselectTableViewCells()
    }
    
    private func deselectTableViewCells() {
        guard let selectedIndexPaths = tableView.indexPathsForSelectedRows else { return }
        for indexPath in selectedIndexPaths {
            tableView.deselectRow(at: indexPath, animated: false)
        }
    }
}

extension SelectQuestionGroupViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return questionGroups.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "QuestionGroupCell", for: indexPath) as! QuestionGroupCell
        let questionGroup = questionGroups[indexPath.row]
        cell.titleLabel.text = questionGroup.title
        return cell
    }
}

extension SelectQuestionGroupViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        selectedQuestionGroup = questionGroups[indexPath.row]
        return indexPath
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let viewController = segue.destination as? QuestionViewController else { return }
        viewController.questionStrategy = RandomQuestionStrategy(questionGroup: selectedQuestionGroup)
        viewController.delegate = self
    }
}

extension SelectQuestionGroupViewController: QuestionViewControllerDelegate {
    func questionViewController(_ viewController: QuestionViewController,
                                didCancel questionStrategy: QuestionStrategy){
        navigationController?.popToViewController(self, animated: true)
    }
    
    func questionViewController(_ viewController: QuestionViewController,
                                didComplete questionStrategy: QuestionStrategy) {
        navigationController?.popToViewController(self, animated: true)
    }
}
