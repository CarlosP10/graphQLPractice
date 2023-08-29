//
//  UIStackView+Extension.swift
//  TestGraphQL
//
//  Created by Carlos Paredes on 24/8/23.
//

import UIKit

extension UIStackView {
    func addArrangedSubviews(_ views: UIView...) {
        views.forEach({
            self.addArrangedSubview($0)
        })
    }
}
