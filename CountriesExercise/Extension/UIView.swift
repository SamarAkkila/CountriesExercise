//
//  UIView.swift
//  CountriesExercise
//
//  Created by Samar Akkıla on 6/30/25.
//

import UIKit
extension UIView{
    
    func setCornerRadius(_ radius: CGFloat) {
        self.layer.cornerRadius = radius
        self.clipsToBounds = true
    }
    
    func addShadow(
          color: UIColor = .black,
          opacity: Float = 0.3,
          offset: CGSize = CGSize(width: 0, height: 2),
          radius: CGFloat = 4
      ) {
          self.layer.shadowColor = color.cgColor
          self.layer.shadowOpacity = opacity
          self.layer.shadowOffset = offset
          self.layer.shadowRadius = radius
          self.layer.masksToBounds = false
      }
    
}
