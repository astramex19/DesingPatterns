//
//  QuestionGroupCell.swift
//  DesignPatterns
//
//  Created by Fabian Romero Sotelo on 26/05/20.
//  Copyright © 2020 Fabian Romero Sotelo. All rights reserved.
//
import Combine
import UIKit

class QuestionGroupCell: UITableViewCell {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var percentageLabel: UILabel!
    
    var percentageSubscriber: AnyCancellable?
}
