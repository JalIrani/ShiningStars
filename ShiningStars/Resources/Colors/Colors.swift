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
    
    var color: UIColor {
        switch self {
        case .continueGreen:
            return UIColor(red: 05.0/255, green: 196.0/255.0, blue: 105.0/255.0, alpha: 1.0)
        }
    }
}
