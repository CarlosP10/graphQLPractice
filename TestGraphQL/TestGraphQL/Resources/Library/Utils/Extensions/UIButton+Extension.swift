//
//  UIButton+Extension.swift
//  TestGraphQL
//
//  Created by Carlos Paredes on 24/8/23.
//

import UIKit

extension UIButton {
    // Brilla
    func shine() {
        UIView.animate(withDuration: 0.1, animations: {
            self.alpha = 0.5
        }) { (completion) in
            UIView.animate(withDuration: 0.1, animations: {
                self.alpha = 1
            })
        }
    }
}
