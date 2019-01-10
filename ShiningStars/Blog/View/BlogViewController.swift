//
//  BlogViewController.swift
//  ShiningStars
//
//  Created by Jal Irani on 1/10/19.
//  Copyright © 2019 Jal Irani. All rights reserved.
//

import UIKit
import SwiftSoup
import Alamofire

class BlogViewController: UIViewController {

    let url = "http://www.shiningstarsnetwork.org/index.php/blog"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scrapeBlog()
        // Do any additional setup after loading the view.
    }
    
    func scrapeBlog() {
        Alamofire.request(url).responseString { response in
            guard let html = response.result.value else { return }
            guard let els: Elements = try? SwiftSoup.parse(html).getElementsByClass("gkHighlighterItem") else { return }
            for element: Element in els.array() {
                try? print("Outer HTML: \(element.outerHtml())")
                try? print("text: \(element.text())")
                guard let parsedResponse = try? SwiftSoup.parse(element.outerHtml()).select("a") else { return }
                try? print("parsedResponse: \(parsedResponse.attr("href"))")
                guard let blogPath = try? element.attr("href") else { return }
                print("Blog Path: \(blogPath)")
            }
        }
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
