//
//  NotificationCollectionViewCell.swift
//  EcoMarket
//
//  Created by Ibrahim Nasser Ibrahim on 14/02/2024.
//

import UIKit

class NotificationCollectionViewCell: UICollectionViewCell {
    // MARK: - Outlets
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var userImageView: UIImageView!
    
    // MARK: - Lifecycle Methods
    override func awakeFromNib() {
        super.awakeFromNib()
        configureUI()
    }
    
    func setup(notification: Notification) {
        userImageView.image = UIImage(named: notification.image)
        userNameLabel.text = notification.name
        messageLabel.text = notification.message
        
        if let date = notification.date {
            timeLabel.text = formatDate(date)
        } else {
            timeLabel.text = ""
        }
    }
    
    // MARK: - Private Methods
    private func formatDate(_ date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM d, yyyy - HH:mm"
        return dateFormatter.string(from: date)
    }
    
    private func configureUI() {
        userImageView.makeRounded()
        userNameLabel.textColor = Asset.AppColor.primaryText.color
        userNameLabel.font = .medium
        
        messageLabel.textColor = Asset.AppColor.socialButton.color
        messageLabel.font = .regular
        
        timeLabel.textColor = Asset.AppColor.socialButton.color
        timeLabel.font = .regular
    }
}
