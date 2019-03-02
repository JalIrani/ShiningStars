//
//  AboutViewController.swift
//  ShiningStars
//
//  Created by Jal Irani on 1/10/19.
//  Copyright © 2019 Jal Irani. All rights reserved.
//

import UIKit

class AboutViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    let sections = ["Our Story", "Connect", "Tickets"]
    var about = [["Our Mission", "Our History"], ["Podcast", "Donate", "Camp Shine Registration"], ["Get Tickets"]]
    @IBOutlet weak var aboutTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        aboutTableView.delegate = self
        aboutTableView.dataSource = self
    }
    
    // MARK: - TableView
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return about[section].count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sections[section]
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "aboutCell", for: indexPath) as UITableViewCell
        cell.textLabel?.text = about[indexPath.section][indexPath.row]
        if indexPath.section == 2 && indexPath.row == 0 {
            //cell.textLabel?.startBlink()
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int)
    {
//        switch section {
//        case 0:
//            let header = view as! UITableViewHeaderFooterView
//            header.textLabel?.font = UIFont(name: "AvenirNext-Medium", size: 20)!
//        case 1:
//            let header = view as! UITableViewHeaderFooterView
//            header.textLabel?.font = UIFont(name: "AvenirNext-Medium", size: 20)!
//        default:
//            let header = view as! UITableViewHeaderFooterView
//            header.textLabel?.font = UIFont(name: "AvenirNext-Medium", size: 20)!
//        }
//        header.textLabel?.textColor = UIColor.white
    }
//
//    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
//        return 25.0
//    }
    
//    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
//        let view = UIView(frame: CGRect(x: 0, y: 0, width: tableView.bounds.width, height: 25.0))
//        view.backgroundColor = UIColor(red: 253.0/255.0, green: 240.0/255.0, blue: 196.0/255.0, alpha: 1)
//        let label = UILabel(frame: CGRect(x: 15, y: 0, width: tableView.bounds.width - 30, height: 25.0))
//        label.font = UIFont.boldSystemFont(ofSize: 15)
//        label.textColor = UIColor.black
//        switch section {
//        case 0:
//            label.text = "Action"
//        case 1:
//            label.text = "Comedy"
//        default:
//            label.text = ""
//        }
//        view.addSubview(label)
//        return view
//    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //guard let cell = tableView.cellForRow(at: indexPath) else { return }
        let selectiion = (indexPath.section, indexPath.row)
        switch selectiion {
        case (0,0):
            print("(0,0)")
        case (0,1):
            print("(0,1)")
        case (1,0):
            guard let url = URL(string: "http://www.shiningstarsnetwork.org/index.php/podcasts") else { return }
            UIApplication.shared.open(url)
        case (1,1):
            guard let url = URL(string: "https://givingtools.com/shiningstarsnetwork/") else { return }
            UIApplication.shared.open(url)
        case (1,2):
            guard let url = URL(string: "https://docs.google.com/forms/d/e/1FAIpQLSe8U00HinmDVYqraB_eDYYltlf_XIiRIGiTqqhloDqBJmZO9w/viewform?c=0&w=1") else { return }
            UIApplication.shared.open(url)
        case (2,0):
            guard let url = URL(string: "https://tickets.vendini.com/ticket-software.html?e=4bab36afd638eb5cabc2cd84d193075e&t=tix&vqitq=0495ad4d-b9aa-41fc-98fc-a1f54b3cfed9&vqitp=bb59f139-959e-4e63-a983-339c1e998b8b&vqitts=1547143563&vqitc=vendini&vqite=itl&vqitrt=Safetynet&vqith=4d0ba58cbff0b769ff7f080d824669b9") else { return }
            UIApplication.shared.open(url)
        default:
            print("We ran way too long")

        }
    }
}
