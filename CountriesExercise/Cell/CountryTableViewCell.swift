//
//  CountryTableViewCell.swift
//  CountriesExercise
//
//  Created by Samar Akkıla on 6/30/25.
//

import UIKit

class CountryTableViewCell: UITableViewCell {

    @IBOutlet weak var countryNameLable:UILabel!
    @IBOutlet weak var countryCodeLable:UILabel!
    @IBOutlet weak var countryCapitalLable:UILabel!
    @IBOutlet weak var ContainerView:UIView!
     
    
    override func awakeFromNib() {
        super.awakeFromNib()
       
        setUpUI()
    }
    
    fileprivate func setUpUI() {
        selectionStyle = .none
        ContainerView.addShadow()
        countryNameLable.font = UIFont.preferredFont(forTextStyle: .headline)
        countryNameLable.adjustsFontForContentSizeCategory = true
        
        countryCodeLable.font = UIFont.preferredFont(forTextStyle: .subheadline)
        countryCodeLable.adjustsFontForContentSizeCategory = true
        
        countryCapitalLable.font = UIFont.preferredFont(forTextStyle: .body)
        countryCapitalLable.adjustsFontForContentSizeCategory = true
        
        ContainerView.setCornerRadius(8)
    }
    
  

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configure(with Item:Country){
        countryNameLable.text = "\(Item.name), \(Item.region ?? "")"
        countryCodeLable.text = Item.code ?? ""
        countryCapitalLable.text = Item.capital
    }
}


