//
//  CategoriesTheme4CollectionViewCell.swift
//  EcoMarket
//
//  Created by Hassan on 18/02/2024.
//

import UIKit

class CategoriesTheme4CollectionViewCell: UICollectionViewCell {
   
    // MARK: - Outlets
    //
    @IBOutlet weak var categoryName: UILabel!
    
    // MARK: - Lifecycle Methods
    //
    override func awakeFromNib() {
        super.awakeFromNib()
        configureUI()
    }
    
    // MARK: - Configuration
    //
    func setup(category: CategoriesTheme4Model, isSelected: Bool) {
        categoryName.text = category.name
        selected(isSelected: isSelected)
    }
    
    // MARK: - Private Methods
    //
    private func configureUI() {
        layer.cornerRadius = 15
        backgroundColor = AppColor.backgroundColor
        layer.borderWidth = 1
        layer.borderColor = AppColor.primaryText.cgColor
        categoryName.font = .medium
        categoryName.textColor = AppColor.primaryText
    }
    
    func selected(isSelected: Bool) {
        if isSelected {
            backgroundColor = AppColor.primaryText
            categoryName.textColor = AppColor.secondaryText
        } else {
            backgroundColor = AppColor.backgroundColor
            layer.borderWidth = 1
            categoryName.textColor = AppColor.primaryText
        }
    }
}
