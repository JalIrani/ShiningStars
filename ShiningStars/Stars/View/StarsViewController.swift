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
    
    var starArr: [Stars] = []
    let buddies: [String] = ["Buddy1", "Buddy2", "Buddy3", "Buddy4", "Buddy5"]
    let shiningStarsAPI = "https://api.sheety.co/f7c70206-2551-4c49-bfd9-f54c69c274e0"
    
    var isStar = true
    
    @IBOutlet weak var starsTableView: UITableView!
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        requestStars()
        
        starsTableView.delegate = self
        starsTableView.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return isStar ? starArr.count: buddies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "starsCell", for: indexPath) as! StarsTableViewCell
        cell.textLabel?.text = isStar ? starArr[indexPath.row].fname : buddies[indexPath.row]
        return cell
    }
    
    // method to run when table view cell is tapped
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("You tapped cell number \(indexPath.section).")
    }
    
    func requestStars() {
        Alamofire.request(shiningStarsAPI, method: .get, encoding: JSONEncoding.default).responseJSON { response in
            if response.response?.statusCode == 200 {
                if let result = response.result.value {
                    print("Right before delete stars")
                    self.deleteStars()
                    let JSON = result as! Array<Any>
                    for star in JSON {
                        if let newStar = star as? NSDictionary {
                            let incomingStar = Star(fname: newStar["fname"]! as! String, lname: newStar["lname"]! as! String, bio: newStar["bio"]! as! String, heroes: newStar["heroes"]! as! String, hobbies: newStar["hobbies"]! as! String, quote: newStar["quote"]! as! String, url: newStar["url"]! as! String, type: newStar["type"]! as! String)
                            print("Right before save stars")
                            self.saveStars(incomingStar: incomingStar)
                        }
                    }
                }
            }
            print("Right before get stars")
            self.getStars()
            self.starsTableView.reloadData()
            for star in self.starArr {
                print(self.printStar(star: star))
            }
        }
    }
    
    func getStars() {
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Stars")
        let sort = NSSortDescriptor(key: "fname", ascending: true)
        request.sortDescriptors = [sort]
        do {
            let fetchedStars = try context.fetch(request) as! [Stars]
            starArr = fetchedStars
            print("This is everything is getData()")
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
