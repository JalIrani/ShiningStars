//
//  StarsTableViewCell.swift
//  ShiningStars
//
//  Created by Jal Irani on 1/10/19.
//  Copyright © 2019 Jal Irani. All rights reserved.
//

import UIKit

class StarsTableViewCell: UITableViewCell {


    @IBOutlet weak var headshotImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var quoteLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        headshotImageView.clipsToBounds = true
        headshotImageView.layer.cornerRadius = 3
        headshotImageView.layer.borderWidth = 2
        
        self.layer.cornerRadius = 10.0
        self.layer.borderWidth = 3.0
        self.layer.borderColor = Colors.ssnGreen.color.cgColor
        
        self.backgroundColor = Colors.ssnGold.color
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override var frame: CGRect {
        get {
            return super.frame
        }
        set (newFrame) {
            let widthSpacing = 26.0
            let heightSpacing = 18.0
            var frame =  newFrame
            frame.origin.y += CGFloat((heightSpacing/2.0))
            frame.size.height -= CGFloat(heightSpacing)
            frame.origin.x += CGFloat((widthSpacing/2.0))
            frame.size.width -= CGFloat(widthSpacing)
            super.frame = frame
        }
    }

}
