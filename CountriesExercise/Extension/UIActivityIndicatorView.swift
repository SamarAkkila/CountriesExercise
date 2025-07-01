//
//  UIActivityIndicatorView.swift
//  CountriesExercise
//
//  Created by Samar Akkıla on 6/30/25.
//

import UIKit

extension UIActivityIndicatorView{
    
    static func createCentered(in view: UIView, style: UIActivityIndicatorView.Style = .large) -> UIActivityIndicatorView {
          let spinner = UIActivityIndicatorView(style: style)
          spinner.center = view.center
          spinner.hidesWhenStopped = true
          view.addSubview(spinner)
          return spinner
      }
}
