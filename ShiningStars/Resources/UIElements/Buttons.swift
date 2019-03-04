//
//  Buttons.swift
//  ShiningStars
//
//  Created by Jal Irani on 3/4/19.
//  Copyright © 2019 Jal Irani. All rights reserved.
//

import Foundation
import UIKit


class ContinueButton: UIButton {
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.layer.cornerRadius = 24.0;
        self.layer.borderWidth = 2.00
        self.setTitleColor(.white, for: .normal)
        self.backgroundColor = Colors.continueGreen.color
        self.layer.borderColor = UIColor.clear.cgColor
        self.tintColor = Colors.continueGreen.color
    }
}
