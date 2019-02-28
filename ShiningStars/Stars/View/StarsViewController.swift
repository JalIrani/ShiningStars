//
//  StarsViewController.swift
//  ShiningStars
//
//  Created by Jal Irani on 1/10/19.
//  Copyright © 2019 Jal Irani. All rights reserved.
//

import UIKit

class StarsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    let stars: [String] = ["Star1", "Star2", "Star3", "Star4", "Star5"]
    let buddies: [String] = ["Buddy1", "Buddy2", "Buddy3", "Buddy4", "Buddy5"]
    
    var isStar = true
    
    @IBOutlet weak var starsTableView: UITableView!
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        starsTableView.delegate = self
        starsTableView.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return stars.count
    }
    
//    func numberOfSections(in tableView: UITableView) -> Int {
//        return stars.count
//    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "starsCell", for: indexPath) as! StarsTableViewCell
        cell.textLabel?.text = isStar ? stars[indexPath.row] : buddies[indexPath.row]
        return cell
    }
    
    // method to run when table view cell is tapped
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("You tapped cell number \(indexPath.section).")
    }
    
    @IBAction func segmentedControlChanged(_ sender: Any) {
        isStar = !isStar
        starsTableView.reloadData()
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
