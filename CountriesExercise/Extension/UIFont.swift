//
//  UIFont.swift
//  CountriesExercise
//
//  Created by Samar Akkıla on 6/30/25.
//

import UIKit

extension UIFont {
    func scaledFont(forTextStyle style: UIFont.TextStyle) -> UIFont {
        return UIFontMetrics(forTextStyle: style).scaledFont(for: self)
    }
}
