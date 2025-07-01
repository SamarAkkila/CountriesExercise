//
//  Constants.swift
//  CountriesExercise
//
//  Created by Samar Akkıla on 6/30/25.
//

enum URLs {
    case countries
    var url:String{
        switch self {
        case .countries:
            return "http://gist.githubusercontent.com/peymano-wmt/32dcb892b06648910ddd40406e37fdab/raw/db25946fd77c5873b0303b858e861ce724e0dcd0/countries.json"
        }
    }
}


enum errorMessages:String, Error{
    case noDataAvailable = "No Data Available."
    case InvalidURL = "Invalid URL."
    case unableToDecodeData = "Unable to decode data."
    case badServerResponse = "Bad server response."
}
