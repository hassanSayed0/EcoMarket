//
//  SecondaryButtom.swift
//  EcoMarket
//
//  Created by Ibrahim Nasser Ibrahim on 10/01/2024.
//
import UIKit

class FacebookButton: EcoMarketButton {
    override func setupButton() {
        super.setupButton()
        backgroundColor = Asset.AppColor.secondaryButton.color
        setImage(AppImage.facebookIcon, for: .normal)
        tintColor = Asset.AppColor.mainTheme.color
        title = L10n.Login.facebook
    }
}
