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

class StarsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    let stars: [String] = ["Star1", "Star2", "Star3", "Star4", "Star5"]
    let buddies: [String] = ["Buddy1", "Buddy2", "Buddy3", "Buddy4", "Buddy5"]
    let shiningStarsAPI = "https://api.sheety.co/f7c70206-2551-4c49-bfd9-f54c69c274e0"
    
    var isStar = true
    
    @IBOutlet weak var starsTableView: UITableView!
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //getStars()
        //getData()
        //deleteData()
        
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
    
    func getStars() {
        Alamofire.request(shiningStarsAPI, method: .get, encoding: JSONEncoding.default).responseJSON { response in
            if let result = response.result.value {
                let JSON = result as! Array<Any>
                for star in JSON {
                    if let newStar = star as? NSDictionary {
                        
                        let incomingStar = Star(fname: newStar["fname"]! as! String, lname: newStar["lname"]! as! String, bio: newStar["bio"]! as! String, heroes: newStar["heroes"]! as! String, hobbies: newStar["hobbies"]! as! String, quote: newStar["quote"]! as! String, url: newStar["url"]! as! String, type: newStar["type"]! as! String)
                        
                        self.saveStars(incomingStar: incomingStar)
                    }
                }
            }
        }
    }
    
    func getData() {
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Stars")
        let sort = NSSortDescriptor(key: "fname", ascending: true)
        request.sortDescriptors = [sort]
        do {
            let stars = try context.fetch(request) as! [Stars]
            print("This is everything is getData()")
            for star in stars {
                print(star.fname!)
                print(star.lname!)
                print(star.bio!)
                print(star.quote!)
                print(star.heroes!)
                print(star.hobbies!)
                print(star.url!)
                print(star.type!)
            }
        } catch {
            print("Fetching Failed")
        }
    }
    
    func deleteData() {
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Stars")
        if let result = try? context.fetch(request) {
            for object in result {
                context.delete(object as! NSManagedObject)
            }
        }
        getData()
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
