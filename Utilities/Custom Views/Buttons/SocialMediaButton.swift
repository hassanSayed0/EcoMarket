//
//  SocialMediaButton.swift
//  EcoMarket
//
//  Created by Ibrahim Nasser Ibrahim on 13/01/2024.
//

import UIKit

class SocialMediaButton: EcoMarketButton {
    override func setupButton() {
        super.setupButton()
        setTitleColor(Asset.AppColor.primaryText.color, for: .normal)
        backgroundColor = Asset.AppColor.mainTheme.color
        layer.borderWidth = 1
        layer.borderColor = Asset.AppColor.socialButton.color.cgColor
        if #available(iOS 15.0, *) {
            configuration = nil
            imageEdgeInsets = .init(top: 0, left: 0, bottom: 0, right: 20)
            tintColor = Asset.AppColor.primaryButton.color
        }
    }
}
