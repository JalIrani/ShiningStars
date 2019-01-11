//
//  StarsViewController.swift
//  ShiningStars
//
//  Created by Jal Irani on 1/10/19.
//  Copyright © 2019 Jal Irani. All rights reserved.
//

import UIKit

class StarsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    let stars: [String] = ["Horse", "Cow", "Camel", "Sheep", "Goat"]
    
    let cellReuseIdentifier = "cell"
    let cellSpacingHeight: CGFloat = 10
    
    @IBOutlet weak var starsTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        starsTableView.delegate = self
        starsTableView.dataSource = self
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return stars.count
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return cellSpacingHeight
    }
    
    // Make the background color show through
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        headerView.backgroundColor = UIColor.clear
        return headerView
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "starsCell", for: indexPath) as UITableViewCell
        // add border and color
        cell.backgroundColor = UIColor.white
        cell.layer.borderColor = UIColor.black.cgColor
        cell.layer.borderWidth = 1
        cell.layer.cornerRadius = 8
        cell.clipsToBounds = true


//        cell.starsImageView.image = UIImage(named: "me")
//        cell.nameLabel.text = stars[indexPath.row]
//        cell.quoteLabel.text = stars[indexPath.row]
        //cell.textLabel?.text = stars[indexPath.row]
        //cell.detailTextLabel?.text = stars[indexPath.row]
        //cell.imageView?.image = UIImage(named: "me")
        return cell
    }
    
    // method to run when table view cell is tapped
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // note that indexPath.section is used rather than indexPath.row
        print("You tapped cell number \(indexPath.section).")
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
