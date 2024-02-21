//
//  Header.swift
//  EcoMarket
//
//  Created by Ibrahim Nasser Ibrahim on 13/02/2024.
//

import UIKit

class Header: UICollectionReusableView {
    static let elementKind = String("My Cart")
    
    let label = UILabel()
    
    // MARK: - Initialization
    //
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLabel()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        label.frame = bounds
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupLabel() {
        label.font = .h2
        label.textColor = Asset.AppColor.primaryText.color
        addSubview(label)
    }
    
    public func setTitle(_ title: String) {
        label.text = title
    }
}

extension UICollectionReusableView: Identifiable {}
