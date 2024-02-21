//
//  SectionDecorationView.swift
//  EcoMarket
//
//  Created by Ibrahim Nasser Ibrahim on 07/02/2024.
//

import UIKit

class SectionDecorationView: UICollectionReusableView {
    
    let view = UIView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("not implemented")
    }
    
    func configure() {
        addSubview(view)
        view.backgroundColor = Asset.AppColor.backgroundColor.color
        view.layer.cornerRadius = 15
        view.layer.borderWidth = 1
        view.layer.borderColor = Asset.AppColor.textFieldUnderLine.color.cgColor
        view.fillSuperview(padding: UIEdgeInsets(top: 40, left: 25, bottom: 30, right: 25))
    }
}
