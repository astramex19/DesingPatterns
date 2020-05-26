//
//  QuestionView.swift
//  DesignPatterns
//
//  Created by Fabian Romero Sotelo on 25/05/20.
//  Copyright © 2020 Fabian Romero Sotelo. All rights reserved.
//

import UIKit

class QuestionView: UIView {
    @IBOutlet weak var flagImage: UIImageView!
    @IBOutlet weak var correctCountLabel: UILabel!
    @IBOutlet weak var incorrectCountLabel: UILabel!
    @IBOutlet weak var promptLabel: UILabel!
    @IBOutlet weak var answerLabel: UILabel!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
}
