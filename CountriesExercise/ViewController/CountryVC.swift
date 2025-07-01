//
//  CountryVC.swift
//  CountriesExercise
//
//  Created by Samar Akkıla on 6/30/25.
//

import UIKit

class CountryVC: UIViewController {
    
    // MARK: - Outlets
    @IBOutlet weak var tableView: UITableView!
    private let searchController = UISearchController(searchResultsController: nil)
    
    //MARK: - Properties
    let viewModel = CountryViewModel()
    
    lazy var spinner: UIActivityIndicatorView = {
        let spinner = UIActivityIndicatorView(style: .medium)
        spinner.hidesWhenStopped = true
        return spinner
    }()
    
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTableCell()
        setupView()
        fetchCountryData()
        
    }
    
    
    // MARK: - Setup Methods
    func setupTableCell() {
        tableView.delegate = self
        tableView.dataSource = self
        let nib = UINib(nibName: "CountryTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "Cell")
    }
    
    private func setupView() {
        self.title = "Countries"
        view.addSubview(spinner)
        spinner.center = view.center
        spinner.startAnimating()
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Search Country or Capital"
        navigationItem.searchController = searchController
        definesPresentationContext = true
       
    }
    
    private func fetchCountryData() {
        
        viewModel.onDataUpdated = { [weak self]  in
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
        }
        
        Task {
            await viewModel.fetchCountries()
            self.spinner.stopAnimating()
            tableView.reloadData()
        }
    }
    
    
}

// MARK: - UITableViewDelegate & DataSource
extension CountryVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.filterdCountries.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! CountryTableViewCell
       
        let item = viewModel.filterdCountries[indexPath.row]
        cell.configure(with: item)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        90
    }
}


// MARK: - UISearchResultsUpdating
extension CountryVC: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        let searchText = searchController.searchBar.text ?? ""
        viewModel.filterCountries(by: searchText)
    } 
}
