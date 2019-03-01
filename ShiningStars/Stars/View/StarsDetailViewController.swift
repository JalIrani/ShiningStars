//
//  StarsDetailViewController.swift
//  ShiningStars
//
//  Created by Jal Irani on 1/10/19.
//  Copyright © 2019 Jal Irani. All rights reserved.
//

import UIKit

class StarsDetailViewController: UIViewController {

    @IBOutlet weak var headshotImageView: UIImageView!
    @IBOutlet weak var quoteLabel: UILabel!
    
    var incomingStar:Stars?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let detailStar = incomingStar {
            headshotImageView.image = UIImage(named: "bman")
            quoteLabel.text = detailStar.quote!
        }
        
        headshotImageView.layer.cornerRadius = 3
        headshotImageView.clipsToBounds = true
        headshotImageView.layer.borderColor = UIColor.white.cgColor
        headshotImageView.layer.borderWidth = 3
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
