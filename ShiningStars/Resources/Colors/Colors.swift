//
//  Colors.swift
//  ShiningStars
//
//  Created by Jal Irani on 3/4/19.
//  Copyright © 2019 Jal Irani. All rights reserved.
//

import Foundation
import UIKit

enum Colors {
    
    case continueGreen
    case ssnGreen
    case ssnGold
    
    var color: UIColor {
        switch self {
        case .continueGreen:
            return UIColor(red: 05.0/255, green: 196.0/255.0, blue: 105.0/255.0, alpha: 1.0)
        case .ssnGreen:
            return UIColor(red: 0.0/255, green: 156.0/255.0, blue: 57.0/255.0, alpha: 1.0)
        case .ssnGold:
            return UIColor(red: 189.0/255, green: 170.0/255.0, blue: 13.0/255.0, alpha: 1.0)
        }
    }
}
