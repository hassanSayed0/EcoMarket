//
//  CategoryCollectionViewCell.swift
//  EcoMarket
//
//  Created by Ibrahim Nasser Ibrahim on 21/01/2024.
//

import UIKit
import MakeConstraints

class CategoryCollectionViewCell: UICollectionViewCell {
    
    // MARK: - Outlets
    //
    @IBOutlet weak var productCount: UILabel!
    @IBOutlet weak var categoryName: UILabel!
    @IBOutlet weak var categoryImage: UIImageView!
    @IBOutlet weak var labelsStackView: UIStackView!
    
    // MARK: - Cell Configuration
    //
    /// Configures the cell with data from the given category model.
    /// - Parameter category: The category model to display in the cell.
    func setup(category: CategoryModel, indexPath: IndexPath) {
        categoryImage.image = UIImage(named: category.image)
        categoryName.text = category.name
        productCount.text = category.productNumber
        setupUI()
        setupLabelsStackViewUI(indexPath)
    }
    
    func setupLabelsStackViewUI(_ indexPath: IndexPath) {
        labelsStackView.centerYInSuperview()
        let padding = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
        if indexPath.row % 2 == 0 {
            labelsStackView.makeConstraints(leadingAnchor: contentView.leadingAnchor, padding: padding)
        } else {
            labelsStackView.makeConstraints(trailingAnchor: contentView.trailingAnchor, padding: padding)
        }
    }
    
    // MARK: - UI Configuration
    //
    /// Applies additional UI configurations to the cell's subviews.
    func setupUI() {
        
        // Image UI
        categoryImage.layer.cornerRadius = 15
        
        // Labels UI
        categoryName.textColor = Asset.AppColor.primaryText.color
        categoryName.font = UIFont.h3
        productCount.textColor = Asset.AppColor.primaryText.color
        productCount.font = UIFont.regular
    }
}
