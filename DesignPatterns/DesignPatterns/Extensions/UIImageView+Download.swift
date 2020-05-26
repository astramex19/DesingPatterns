//
//  UIImageView+Download.swift
//  DesignPatterns
//
//  Created by Fabian Romero Sotelo on 25/05/20.
//  Copyright © 2020 Fabian Romero Sotelo. All rights reserved.
//

import UIKit

extension UIImageView {
    func load(url: URL, completition:( @escaping () -> Void)) {
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        completition()
                        self?.image = image
                    }
                }
            }
        }
    }
}
