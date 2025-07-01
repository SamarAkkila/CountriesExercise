//
//  APIManager.swift
//  CountriesExercise
//
//  Created by Samar Akkıla on 6/30/25.
//

import Foundation

class APIManager {
    
     static let shared = APIManager()
    
    func getCountryList(fromUrl :String) async throws -> [Country]{
        
        guard let url = URL(string: fromUrl) else {throw errorMessages.InvalidURL}
        
        let (data,response) = try await URLSession.shared.data(from: url)
        
        guard let decodedData = try? JSONDecoder().decode([Country].self, from: data) else {throw errorMessages.unableToDecodeData}
        
        guard let httpResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) else {
            throw errorMessages.noDataAvailable
        }
        
        if decodedData.isEmpty{
            throw errorMessages.noDataAvailable
        }
        return decodedData
    }
}
