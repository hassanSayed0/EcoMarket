//
//  OnboardingCollectionViewCell.swift
//  EcoMarket
//
//  Created by Youssef Eldeeb on 13/01/2024.
//

import UIKit

class OnboardingCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subTitleLabel: UILabel!
    @IBOutlet weak var containerStackView: UIStackView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
    }
    
    private func setupUI() {
        backgroundColor = Asset.AppColor.backgroundColor.color
        
        // title setup
        titleLabel.font = .custom(size: 32, weight: .bold)
        titleLabel.numberOfLines = 2
        titleLabel.textColor = Asset.AppColor.primaryText.color
        
        // subTitle setup
        subTitleLabel.font = .custom(size: 16, weight: .regular)
        subTitleLabel.numberOfLines = 2
        subTitleLabel.textColor = Asset.AppColor.secondaryText.color
        
        image.drawOnboardingShape()
        
    }
    
    func setup(_ obj: Onboarding) {
        self.image.image = UIImage(named: obj.image)
        self.titleLabel.text = obj.title
        self.subTitleLabel.text = obj.subtitle
    }
}
