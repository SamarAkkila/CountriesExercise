//
//  CountryViewModel.swift
//  CountriesExercise
//
//  Created by Samar Akkıla on 6/30/25.
//

import Foundation
@MainActor
class CountryViewModel :ObservableObject{
    
    @Published var Countries:[Country] = []
    @Published var filterdCountries:[Country] = []
    @Published var isLoading:Bool = true
    var onDataUpdated: (() -> Void)?
    
    
    func fetchCountries() async {
        self.isLoading = true
        do {
            let data = try await APIManager.shared.getCountryList(fromUrl: URLs.countries.url)
            self.Countries = data
            self.filterdCountries = data
        } catch {
            print("Error fetching countries: \(error)")
        }
        self.isLoading = false
    }
     
    
    func filterCountries(by searchText: String) {
        if searchText.isEmpty  {
            filterdCountries = Countries
        }else{
            filterdCountries = Countries.filter {
                $0.name.lowercased().contains(searchText.lowercased()) ||
                $0.capital.lowercased().contains(searchText.lowercased())
            }}
        onDataUpdated?()
    }
}
