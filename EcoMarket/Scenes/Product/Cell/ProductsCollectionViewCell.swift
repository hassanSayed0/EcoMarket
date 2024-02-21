//
//  ProductsCollectionViewCell.swift
//  EcoMarket
//
//  Created by Ibrahim Nasser Ibrahim on 23/01/2024.
//

import UIKit

class ProductsCollectionViewCell: UICollectionViewCell {

    // MARK: - Outlets
    //
    @IBOutlet weak var favouriteButton: UIButton!
    @IBOutlet weak var productPrice: UILabel!
    @IBOutlet weak var productName: UILabel!
    @IBOutlet weak var brandName: UILabel!
    @IBOutlet weak var productImage: UIImageView!

    // MARK: - Cell Configuration
    func setup(product: ProductModel) {
        productImage.image = UIImage(named: product.image)
        productName.text = product.name
        brandName.text = product.brand
        productPrice.text = product.price
        
        setupUI()
    }
    
    // MARK: - UI Configuration
    private func setupUI() {
        // ImageUI
        productImage.layer.cornerRadius = 15
        
        // Button UI
        favouriteButton.setTitle("", for: .normal)
        favouriteButton.setImage(UIImage(systemName: "heart.circle.fill"), for: .normal)
        favouriteButton.tintColor = Asset.AppColor.primaryButton.color
        
        // Labels UI
        brandName.font = .h3
        productName.font = .regular
        productPrice.font = .h3
        productName.textColor = Asset.AppColor.socialButton.color
    }
}
