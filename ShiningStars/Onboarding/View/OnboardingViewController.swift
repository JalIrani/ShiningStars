//
//  OnboardingViewController.swift
//  ShiningStars
//
//  Created by Jal Irani on 3/2/19.
//  Copyright © 2019 Jal Irani. All rights reserved.
//

import UIKit
import SwiftVideoBackground

class OnboardingViewController: UIViewController {

    @IBOutlet weak var videoView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let url = URL(string: "https://tigerweb.towson.edu/jirani/shiningstars.mp4")!
        VideoBackground.shared.play(view: videoView, url: url)
    }
    
    @IBAction func conitueButtonTapped(_ sender: Any) {
        UserDefaults.standard.set(true, forKey: "firstTime")
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
