//
//  CountryModel.swift
//  CountriesExercise
//
//  Created by Samar Akkıla on 6/30/25.
//

import Foundation

struct Country:Codable {
    var capital:String = ""
    var code:String?
    var currency:currency
    var flag:String?
    var language:language
    var name:String = ""
    var region:String?
}

struct currency:Codable {
    var name:String?
    var code:String?
    var symbol:String?
}

struct language:Codable {
    var name:String?
    var code:String?
}
