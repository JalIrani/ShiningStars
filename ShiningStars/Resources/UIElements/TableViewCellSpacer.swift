//
//  TableViewCellSpacer.swift
//  ShiningStars
//
//  Created by Jal Irani on 1/10/19.
//  Copyright © 2019 Jal Irani. All rights reserved.
//

import Foundation
import UIKit

class CustomTableViewCell: UITableViewCell {
    override var frame: CGRect {
        get {
            return super.frame
        }
        set (newFrame) {
            let frame = CGRect(x: newFrame.origin.x + 20, y: newFrame.origin.y, width: newFrame.width - 40, height: newFrame.height)
            //var frame = newFrame
            //frame.origin.x += 20
            super.frame = frame
        }
    }
}
