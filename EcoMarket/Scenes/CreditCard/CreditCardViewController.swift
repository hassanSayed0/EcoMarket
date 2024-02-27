//
//  CreditCardViewController.swift
//  EcoMarket
//
//  Created by Ibrahim Nasser Ibrahim on 25/02/2024.
//

import UIKit
import Combine
import MakeConstraints

class CreditCardViewController: UIViewController {
    
    private var cancellable = Set<AnyCancellable>()
    
    @IBOutlet weak var cardDetailsStackView: UIStackView!
    @IBOutlet weak var validDate: UILabel!
    @IBOutlet weak var validLabel: UILabel!
    @IBOutlet weak var cardHolderName: UILabel!
    @IBOutlet weak var cardHolderLabel: UILabel!
    @IBOutlet weak var cardNumber: UILabel!
    @IBOutlet weak var cardNumberLabel: UILabel!
    @IBOutlet weak var cardLogo: UIImageView!
    @IBOutlet weak var cardType: UILabel!
    
    @IBOutlet weak var cancelButton: UIButton!
    @IBOutlet weak var addCardButton: PrimaryButton!
    @IBOutlet weak var headerLabel: UILabel!
    @IBOutlet weak var cardImage: UIImageView!
    @IBOutlet weak var cardStackView: UIStackView!
    @IBOutlet weak var cardLabel: UILabel!
    @IBOutlet weak var cardCVVTextField: CardTextField!
    @IBOutlet weak var cardExpDateTextField: CardTextField!
    @IBOutlet weak var cardHolderTextField: CardTextField!
    @IBOutlet weak var cardNumberTextField: CardTextField!
    @IBOutlet weak var containerStackView: UIStackView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bindCardNumberTextField()
        bindCardHolderTextField()
        bindExpDateTextField()
        configureUI()
        cardNumberTextField.delegate = self
    }
    
    private func bindCardNumberTextField() {
        cardNumberTextField.textField.textFieldDidChange
            .sink { [weak self] value in
                // Remove any non-digit characters
                let cleanedValue = value.replacingOccurrences(of: "[^0-9]", with: "", options: .regularExpression)
                
                guard cleanedValue.count <= 16 else {
                    
                    return
                }
                
                // Insert space every 4 characters
                var formattedValue = ""
                var index = cleanedValue.startIndex
                while index < cleanedValue.endIndex {
                    let nextIndex = cleanedValue.index(index,
                                                       offsetBy: min(4, cleanedValue.distance(from: index,
                                                                                              to: cleanedValue.endIndex)))
                    formattedValue += cleanedValue[index..<nextIndex]
                    if nextIndex != cleanedValue.endIndex {
                        formattedValue += " "
                    }
                    index = nextIndex
                }
                
                self?.cardNumber.text = formattedValue
                
                if cleanedValue.isEmpty {
                    self?.cardLogo.image = UIImage()
                    self?.cardType.text = ""
                } else if cleanedValue.hasPrefix("4") {
                    self?.cardLogo.image = UIImage(named: "creditcard/visa")
                    self?.cardType.text = "VISA"
                } else if cleanedValue.hasPrefix("5") {
                    self?.cardLogo.image = UIImage(named: "creditcard/mastercard")
                    self?.cardType.text = "MasterCard"
                }
            }.store(in: &cancellable)
    }
    
    private func bindCardHolderTextField() {
        cardHolderTextField.textField.textFieldDidChange
            .sink { [weak self] value in
                let uppercasedValue = value.uppercased()
                self?.cardHolderName.text = uppercasedValue
            }.store(in: &cancellable)
    }
    
    private func bindExpDateTextField() {
        cardExpDateTextField.textField.textFieldDidChange
            .sink { [weak self] value in
                if self?.isValidExpirationDate(value) ?? false {
                    self?.validDate.text = value
                } else {
                    self?.validDate.text = ""
                }
            }.store(in: &cancellable)
    }
    
    func isValidExpirationDate(_ date: String) -> Bool {
        let components = date.components(separatedBy: "/")
        guard components.count == 2 else { return false }
        guard let month = Int(components[0]), let year = Int(components[1]) else { return false }
        // Check if month is within range 1-12 and year is in the future
        let currentYear = Calendar.current.component(.year, from: Date()) % 100
        return (1...12).contains(month) && year >= currentYear
    }
    
    private func configureUI() {
        containerStackView.layoutMargins = .init(top: 0, left: 20, bottom: 0, right: 20)
        containerStackView.isLayoutMarginsRelativeArrangement = true
        
        cardDetailsStackView.layoutMargins = .init(top: 20, left: 20, bottom: 20, right: 20)
        cardDetailsStackView.isLayoutMarginsRelativeArrangement = true
        
        cardImage.layer.cornerRadius = 15
        cardImage.image = AppImage.CreditCard.credit1
        
        configureTextFieldsPlaceHolder()
        configureCardLabel()
        configureHeaderLabel()
        configureButtonsUI()
        configureCardLabelsUI()
    }
    
    private func configureTextFieldsPlaceHolder() {
        cardNumberTextField.placeholder = L10n.Credit.Number.placeholder
        cardHolderTextField.placeholder = L10n.Credit.Holder.placeholder
        cardExpDateTextField.placeholder = L10n.Credit.Expdate.placeholder
        cardCVVTextField.placeholder = L10n.Credit.Cvv.placeholder
    }
    
    private func configureCardLabel() {
        cardLabel.font = .h2
        cardLabel.textColor = AppColor.primaryText
        cardLabel.text = L10n.Credit.Card.label
    }
    
    private func configureHeaderLabel() {
        headerLabel.font = .h2
        headerLabel.textColor = AppColor.primaryText
        headerLabel.text = L10n.Credit.Header.label
    }
    
    private func configureButtonsUI() {
        addCardButton.title = L10n.Credit.AddButton.label
        addCardButton.widthConstraints(160)
        
        if #available(iOS 15.0, *) {
            cancelButton.configuration = nil
            cancelButton.setTitle(L10n.Credit.CancelButton.label, for: .normal)
            cancelButton.setTitleColor(AppColor.cardTextFieldPlaceholder, for: .normal)
            cancelButton.titleLabel?.font = .medium
        }
    }
    
    private func configureCardLabelsUI() {
        configureLabel(cardType, text: nil, font: .h2, textColor: AppColor.secondaryText)
        configureLabel(cardNumberLabel, text: L10n.Credit.Details.cardNumber, font: .regular, textColor: AppColor.secondaryText)
        configureLabel(cardNumber, text: nil, font: .h3, textColor: AppColor.secondaryText)
        configureLabel(cardHolderLabel, text: L10n.Credit.Details.cardHolder, font: .regular, textColor: AppColor.secondaryText)
        configureLabel(cardHolderName, text: nil, font: .medium, textColor: AppColor.secondaryText)
        configureLabel(validLabel, text: L10n.Credit.Details.valid, font: .regular, textColor: AppColor.secondaryText)
        configureLabel(validDate, text: nil, font: .medium, textColor: AppColor.secondaryText)
    }
    
    private func configureLabel(_ label: UILabel, text: String?, font: UIFont?, textColor: UIColor) {
        label.text = text
        label.font = font
        label.textColor = textColor
    }
    
    @IBAction func addCardButtonTapped(_ sender: Any) {
        
    }
    
    @IBAction func cancelButtonTapped(_ sender: Any) {
        
    }
}

extension CreditCardViewController: CardTextFieldDelegate {
    func cardTextField(_ textField: CardTextField, textDidChange newText: String?) {
        
    }
}
