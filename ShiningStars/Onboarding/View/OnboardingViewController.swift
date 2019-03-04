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
        
//        let embedHTML="<html><head><style type=\"text/css\">body {background-color: transparent;color: black;}</style><meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=yes\"/></head><body style=\"margin:0\"><div><iframe src=\"//player.vimeo.com/video/184440150?autoplay=1&loop=1\" width=\"640\" height=\"360\" frameborder=\"0\" webkitallowfullscreen mozallowfullscreen allowfullscreen></iframe></div></body></html>"
//        let url: NSURL = NSURL(string: "https://vimeo.com/184440150")!
//        onboardingWebView.loadHTMLString(embedHTML as String, baseURL:url as URL )
//        onboardingWebView.contentMode = UIView.ContentMode.scaleAspectFit

        // Do any additional setup after loading the view.
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
