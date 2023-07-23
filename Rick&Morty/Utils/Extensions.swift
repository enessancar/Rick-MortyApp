//
//  Extensions.swift
//  Rick&Morty
//
//  Created by Enes Sancar on 22.07.2023.
//

import UIKit

extension UIView {
    func addSubviews(_ views: UIView...) {
        views.forEach({
            addSubview($0)
        })
    }
}
