//
//  WishListCellTableViewCell.swift
//  TableViewPractice
//
//  Created by Jinyoung Yoo on 5/25/24.
//

import UIKit

class WishListCellTableViewCell: UITableViewCell {

    @IBOutlet var bgView: UIView!
    @IBOutlet var completeButton: UIButton!
    @IBOutlet var wishContentLabel: UILabel!
    @IBOutlet var starButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configure(data: Shopping, tag: Int) {
        self.configureBackgroundView()
        self.configureCompleteButton(isComplete: data.isComplete, tag: tag)
        self.configureWishContentLabel(text: data.wishContent)
        self.configureStarButton(isStar: data.isStar, tag: tag)
    }
    
    private func configureBackgroundView() {
        self.bgView.layer.cornerRadius = 10
    }
    
    private func configureCompleteButton(isComplete: Bool, tag: Int) {
        let completeButtonImageName = isComplete ? "checkmark.square.fill" : "checkmark.square"
        
        self.completeButton.setTitle("", for: .normal)
        self.completeButton.setImage(.init(systemName: completeButtonImageName), for: .normal)
        self.completeButton.tintColor = .black
        self.completeButton.tag = tag
    }
    
    private func configureWishContentLabel(text: String) {
        self.wishContentLabel.text = text
        self.wishContentLabel.textColor = .black
        self.wishContentLabel.font = .systemFont(ofSize: 15)
    }
    
    private func configureStarButton(isStar: Bool, tag: Int) {
        let starButtonImageName = isStar ? "star.fill" : "star"

        self.starButton.setTitle("", for: .normal)
        self.starButton.setImage(.init(systemName: starButtonImageName), for: .normal)
        self.starButton.tintColor = .black
        self.starButton.tag = tag
    }
}
