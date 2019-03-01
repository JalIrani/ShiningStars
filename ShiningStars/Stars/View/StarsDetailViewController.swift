//
//  StarsDetailViewController.swift
//  ShiningStars
//
//  Created by Jal Irani on 1/10/19.
//  Copyright © 2019 Jal Irani. All rights reserved.
//

import UIKit

class StarsDetailViewController: UIViewController {

    var incomingStar:Stars?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(incomingStar?.bio)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
