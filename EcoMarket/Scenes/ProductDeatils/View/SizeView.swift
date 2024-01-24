//
//  SizeView.swift
//  EcoTest
//
//  Created by Ibrahim Nasser Ibrahim on 24/01/2024.
//

import UIKit

public protocol SizeViewDelegate {
    func sizeView(_ sizeView: CustomSizeView, didSelect size: String)
}

@IBDesignable
open class CustomSizeView: UIStackView {
    // MARK: Private Properties
    //
    private var buttons: [CustomRoundedButton] = []
    private let animatedView = UIView()
    private var animatedViewConstraints: NSLayoutConstraint?
    private let buttonWidth: CGFloat = 40
    private let buttonHeight: CGFloat = 40
    
    // MARK: Public Properties
    //
    public var selectedButton: CustomRoundedButton?
    public var delegate: (any SizeViewDelegate)?
    
    @IBInspectable public var defaultColor: UIColor = .white {
        didSet {
            selectButton(buttons.first)
            setupAnimatedView()
        }
    }
    
    @IBInspectable public var selectedColor: UIColor = .systemBlue {
        didSet {
            selectButton(buttons.first)
            setupAnimatedView()
        }
    }
    
    // MARK: Initializer
    //
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required public init(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    // MARK: Setup Methods
    //
    private func setup() {
        axis = .horizontal
        spacing = 15
        distribution = .equalSpacing
        alignment = .center
        backgroundColor = .clear
        setupAnimatedViewLayout()
    }
    
    private func setupAnimatedViewLayout() {
        addSubview(animatedView)
        animatedView.translatesAutoresizingMaskIntoConstraints = false
        animatedView.widthAnchor.constraint(equalToConstant: buttonWidth).isActive = true
        animatedView.heightAnchor.constraint(equalToConstant: buttonHeight).isActive = true
    }
    
    private func setupAnimatedView() {
        animatedView.backgroundColor = selectedColor
        animatedView.layer.cornerRadius = buttonWidth / 2
    }
    
    public func setSizes(_ sizes: [String]) {
        for size in sizes {
            let button = createRoundedButton(for: size)
            buttons.append(button)
            addArrangedSubview(button)
        }
        selectButton(buttons.first)
    }
    
    private func createRoundedButton(for title: String) -> CustomRoundedButton {
        let button = CustomRoundedButton()
        button.setTitle(title.description, for: .normal)
        button.widthAnchor.constraint(equalToConstant: buttonWidth).isActive = true
        button.heightAnchor.constraint(equalToConstant: buttonHeight).isActive = true
        
        button.addAction(.init(handler: {[weak self] _ in
            self?.buttonTapped(button, title: title.description)
        }),for: .touchUpInside)
        
        return button
    }
    
    private func buttonTapped(_ tappedButton: CustomRoundedButton, title: String) {
        selectButton(tappedButton)
        delegate?.sizeView(self, didSelect: title)
    }
    
    private func selectButton(_ button: CustomRoundedButton?) {
        selectedButton = button
        updateSelectedButtonStyle(button)
        animateSelectedButton(button)
    }
    
    private func updateSelectedButtonStyle(_ button: CustomRoundedButton?) {
        buttons.forEach { btn in
            if button === btn {
                UIView.animate(withDuration: 0.2) { [weak self] in
                    btn.backgroundColor = self?.selectedColor
                    btn.setTitleColor(.white, for: .normal)
                }
            } else {
                UIView.animate(withDuration: 0.2) { [weak self] in
                    btn.backgroundColor = self?.defaultColor
                    btn.setTitleColor(.gray, for: .normal)
                }
            }
        }
    }
    
    private func animateSelectedButton(_ button: CustomRoundedButton?) {
        animatedViewConstraints?.isActive = false
        if let button {
            animatedViewConstraints = animatedView.leadingAnchor.constraint(equalTo: button.leadingAnchor)
            animatedViewConstraints?.isActive = true
        }
        
        UIView.animate(withDuration: 0.3, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.05) {
            self.layoutIfNeeded()
        }
    }
}
