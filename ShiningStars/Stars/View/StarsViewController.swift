//
//  StarsViewController.swift
//  ShiningStars
//
//  Created by Jal Irani on 1/10/19.
//  Copyright © 2019 Jal Irani. All rights reserved.
//

import UIKit
import Alamofire
import CoreData
import UserNotifications

class StarsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    var starArr: [Stars] = []
    var buddiesArr: [Stars] = []
    var teamArr: [Stars] = []
    let shiningStarsAPI = "https://api.sheety.co/f7c70206-2551-4c49-bfd9-f54c69c274e0"
    
    var starIndex = 0
    
    @IBOutlet weak var starsTableView: UITableView!
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        requestStars()
        loadFirstTimeNotifications()
        
        starsTableView.delegate = self
        starsTableView.dataSource = self
        
        self.navigationController!.navigationBar.barStyle = .blackTranslucent
        self.navigationController!.navigationBar.isTranslucent = true
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch starIndex {
        case 0:
            return starArr.count
        case 1:
            return buddiesArr.count
        case 2:
            return teamArr.count
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        print("Cell for row at")
        let cell = tableView.dequeueReusableCell(withIdentifier: "starsCell", for: indexPath) as! StarsTableViewCell
        switch starIndex {
        case 0:
            print("Its case 0")
            //cell.textLabel?.text = starArr[indexPath.row].fname
            cell.nameLabel.text = starArr[indexPath.row].fname! + " " + starArr[indexPath.row].lname!
            cell.quoteLabel.text = starArr[indexPath.row].quote!
//            let url = URL(string: starArr[indexPath.row].url!)
//            let data = try? Data(contentsOf: url!)
            //cell.headshotImageView.image = UIImage(data: data!)
            cell.headshotImageView.image = UIImage(named: "bman")
        case 1:
            print("Its case 1")
            cell.nameLabel.text = buddiesArr[indexPath.row].fname! + " " + buddiesArr[indexPath.row].lname!
        case 2:
            cell.textLabel?.text = teamArr[indexPath.row].fname
        default:
            print("cellForRowAt has run beyond")
        }
        return cell
    }
    
    // method to run when table view cell is tapped
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("You tapped cell number \(indexPath.row).")
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func requestStars() {
        Alamofire.request(shiningStarsAPI, method: .get, encoding: JSONEncoding.default).responseJSON { response in
            if response.response?.statusCode == 200 {
                if let result = response.result.value {
                    self.deleteStars()
                    let JSON = result as! Array<Any>
                    for star in JSON {
                        if let newStar = star as? NSDictionary {
                            
                            let incomingStar = Star(fname: newStar["fname"]! as! String, lname: newStar["lname"]! as! String, bio: newStar["bio"]! as! String, heroes: newStar["heroes"]! as! String, hobbies: newStar["hobbies"]! as! String, quote: newStar["quote"]! as! String, url: newStar["url"]! as! String, type: newStar["type"]! as! String)
                            
                            self.saveStars(incomingStar: incomingStar)
                        }
                    }
                }
            }
            self.getStars()
            self.getBuddies()
            self.getTeam()
            self.starsTableView.reloadData()
            
        }
    }
    
    func getStars() {
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Stars")
        request.predicate = NSPredicate(format: "type = %@", "star")
//        let sort = NSSortDescriptor(key: "fname", ascending: true)
//        request.sortDescriptors = [sort]
        do {
            let fetchedStars = try context.fetch(request) as! [Stars]
            starArr = fetchedStars
        } catch {
            print("Fetching Failed")
        }
    }
    
    func getBuddies() {
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Stars")
        request.predicate = NSPredicate(format: "type = %@", "buddy")
        do {
            let fetchedBuddies = try context.fetch(request) as! [Stars]
            buddiesArr = fetchedBuddies
        } catch {
            print("Fetching Failed")
        }
    }
    
    func getTeam() {
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Stars")
        request.predicate = NSPredicate(format: "type = %@", "team")
        do {
            let fetchedTeam = try context.fetch(request) as! [Stars]
            teamArr = fetchedTeam
        } catch {
            print("Fetching Failed")
        }
    }
    
    func deleteStars() {
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Stars")
        if let result = try? context.fetch(request) {
            for object in result {
                context.delete(object as! NSManagedObject)
            }
        }
    }
    
    func printStar(star: Stars) {
        print(star.fname!)
        print(star.lname!)
        print(star.bio!)
        print(star.quote!)
        print(star.heroes!)
        print(star.hobbies!)
        print(star.url!)
        print(star.type!)
    }
    
    func saveStars(incomingStar: Star) {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        let managedContext = appDelegate.persistentContainer.viewContext
        let userEntity = NSEntityDescription.entity(forEntityName: "Stars", in: managedContext)!
        
        let star = NSManagedObject(entity: userEntity, insertInto: managedContext)
        star.setValue(incomingStar.fname, forKeyPath: "fname")
        star.setValue(incomingStar.lname, forKeyPath: "lname")
        star.setValue(incomingStar.bio, forKeyPath: "bio")
        star.setValue(incomingStar.heroes, forKeyPath: "heroes")
        star.setValue(incomingStar.hobbies, forKeyPath: "hobbies")
        star.setValue(incomingStar.quote, forKeyPath: "quote")
        star.setValue(incomingStar.url, forKeyPath: "url")
        star.setValue(incomingStar.type, forKeyPath: "type")
        do {
            try managedContext.save()
        } catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
        }
    }
    
    @IBAction func segmentedControlChanged(_ sender: Any) {
        starIndex = segmentedControl.selectedSegmentIndex
        print("This is starIndex: \(starIndex)")
        starsTableView.reloadData()
    }
    
    func loadFirstTimeNotifications() {
        let firstTime = UserDefaults.standard.bool(forKey: "firstTimeNotification")
        if !firstTime {
            UserDefaults.standard.set(true, forKey: "firstTimeNotification")
            
            
            UNUserNotificationCenter.current().requestAuthorization(options: [.alert]) {
                (granted, error) in
                if granted {
                    print("trying to print notifications")
                    let center =  UNUserNotificationCenter.current()
                    
                    //create the content for the notification
                    let content = UNMutableNotificationContent()
                    content.title = " Jurassic Park"
                    content.subtitle = "Lunch"
                    content.body = "Its lunch time at the park, please join us for a dinosaur feeding"
                    content.sound = UNNotificationSound.default
                    
                    //notification trigger can be based on time, calendar or location
                    let trigger = UNTimeIntervalNotificationTrigger(timeInterval:2.0, repeats: false)
                    
                    //create request to display
                    let request = UNNotificationRequest(identifier: "ContentIdentifier", content: content, trigger: trigger)
                    
                    //add request to notification center
                    center.add(request) { (error) in
                        if error != nil {
                            print("error \(String(describing: error))")
                        }
                    }
                } else {
                    print("No")
                }
            }
            
        }
    }
    
    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetail" {
            if let detailVC = segue.destination as? StarsDetailViewController {
                if let indexPath = starsTableView.indexPathForSelectedRow {
                    print("This is the indexpath: \(indexPath.row)")
                    switch starIndex {
                    case 0:
                        detailVC.incomingStar = starArr[indexPath.row]
                    case 1:
                        detailVC.incomingStar = buddiesArr[indexPath.row]
                    case 2:
                        detailVC.incomingStar = teamArr[indexPath.row]
                    default:
                        print("There is no default case")
                    }
                }
            }
        }
    }

}
