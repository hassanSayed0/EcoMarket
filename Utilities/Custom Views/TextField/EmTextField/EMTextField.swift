//
//  EMTextField.swift
//  EcoMarket
//
//  Created by Ahmed Yamany on 16/01/2024.
//

import UIKit
import MakeConstraints

protocol EMTextFieldDelegate: AnyObject {
}
//
class EMTextField: UIView {
    // MARK: IBOutlet
    @IBOutlet weak var containerView: UIStackView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var textfield: UITextField!
    @IBOutlet weak var bottomLine: UIView!
    
    // MARK: Properities
    var title: String? {
        get { titleLabel.text }
        set { titleLabel.text = newValue }
    }
    
    var placeholder: String? {
        get { textfield.placeholder }
        set { textfield.placeholder = newValue }
    }
    
    weak var delegate: EMTextFieldDelegate?
    // MARK: Init
    //
    override init(frame: CGRect) {
        super.init(frame: frame)
        loadNib()
        configureUI()
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        loadNib()
        configureUI()
    }
}

// MARK: - Configurations
private extension EMTextField {
    func configureUI() {
        backgroundColor = Asset.AppColor.backgroundColor.color
        containerView.backgroundColor = Asset.AppColor.backgroundColor.color
        configureTitleLable()
        configureTextField()
        configureBottomLine()
        heightConstraints(48)
    }
    
    func configureTitleLable() {
        titleLabel.textColor = Asset.AppColor.primaryText.color
        titleLabel.font = .h3
    }
    
    func configureTextField() {
        textfield.borderStyle = .none
        textfield.textColor = Asset.AppColor.socialButton.color
        textfield.backgroundColor = Asset.AppColor.backgroundColor.color
    }
    
    func configureBottomLine() {
        bottomLine.backgroundColor = Asset.AppColor.textFieldUnderLine.color
    }
}

// MARK: - Actions
private extension EMTextField {
}

private extension EMTextField {
    /// Loads the view from a nib file and adds it as a subview to the OnboardingTextField view.
    private func loadNib() {
        // swiftlint:disable all
        if let loadedViews = Bundle.main.loadNibNamed(String(describing: Self.self), owner: self, options: nil),
            let view = loadedViews.first as? UIView {
            addSubview(view)
            view.frame = bounds
        }
        // swiftlint:enable all
    }
}
