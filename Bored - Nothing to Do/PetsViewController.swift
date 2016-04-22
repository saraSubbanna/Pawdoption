//
//  PetsViewController.swift
//  SEKA
//
//  Created by Srividhya Gopalan on 3/9/16.
//  Copyright (c) 2016 Srividhya Gopalan. All rights reserved.
//

import UIKit
import CoreLocation
import Parse

class PetsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var petsTable: UITableView!
    var allPets: [pets] = []
    var puppy1: UIImage = (UIImage(named: "puppy1") as UIImage?)!
    var puppy2: UIImage = (UIImage(named: "puppy 2") as UIImage?)!
    var puppy3: UIImage = (UIImage(named: "puppy 3") as UIImage?)!
    var puppy4: UIImage = (UIImage(named: "puppy 4") as UIImage?)!
    var selectedCell: Int!
    var time: Bool!
    var size: Bool!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setPets()
        petsTable.dataSource = self
        petsTable.delegate = self

        if (time != nil) {
            var count = 0
            for obj in allPets {
                if obj.size == true {
                    allPets.insert(allPets[count], atIndex: 0)
                    allPets.removeAtIndex(count+1)
                }
                count = count + 1
            }
            petsTable.reloadData()
        }
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setPets() {
        
        let query = PFQuery(className: "Pet")
        query.orderByDescending("createdAt")
        
        // 7
        query.findObjectsInBackgroundWithBlock {(result: [AnyObject]?, error: NSError?) -> Void in
            // 8
//            let data = parseEvent["imageFile"]!.getData()
//            var parseImage = UIImage(data: data!, scale:1.0)
            let download = result as? [PFObject] ?? []
            for Pet in download {
                //var petName = Pet.description["Name"]
                print(Pet["Name"]!)
                self.allPets.append(pets(name: Pet["Name"]! as! String, description: Pet["Description"]! as! String, image: UIImage (data: Pet["Picture"]!.getData()!, scale:1.0)!, url: Pet["URL"]! as! String, location: Pet["Location"]! as! String, size: Pet["Size"]!.boolValue!, time: Pet["Time"]!.boolValue, city: Pet["City"]! as! String, state: Pet["State"]! as! String))
            }
            if (self.time != nil) {
                var count = 0
                for obj in self.allPets {
                    if obj.size == true {
                        self.allPets.insert(self.allPets[count], atIndex: 0)
                        self.allPets.removeAtIndex(count+1)
                    }
                    count = count + 1
                }
                self.petsTable.reloadData()
            }

            self.petsTable.reloadData()
            
        }
        

    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Potentially incomplete method implementation.
        // Return the number of sections.
        print(allPets.count)
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete method implementation.
        // Return the number of rows in the section.
        print(allPets.count)
        return allPets.count
        
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        self.selectedCell = indexPath.row
        self.performSegueWithIdentifier("To Deep Look", sender: self)
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Pets Cells", forIndexPath: indexPath) as! PetsTableViewCell
        
        cell.loadItems(allPets[indexPath.row].name, petImage: allPets[indexPath.row].image, petDescription: allPets[indexPath.row].describe, url: allPets[indexPath.row].url)
        // Configure the cell...
        
        return cell
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if (segue.identifier == "To Deep Look") {
            //backgroundMusic.stop()
            let svc = segue.destinationViewController as! DeepLookViewController;
            let Pet = self.allPets[self.selectedCell]
            svc.blurb = Pet.describe
            svc.image = Pet.image
            svc.name = Pet.name
            svc.location = Pet.location + Pet.city + Pet.state
        }
    }

    /*
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    // Get the new view controller using segue.destinationViewController.
    // Pass the selected object to the new view controller.
    }
    */
    
}

class pets: NSObject {
    var name: String
    var describe: String
    var image: UIImage
    var state: String
    var url: String
    var location: String
    var size: Bool
    var time: Bool
    var city: String
    
    init(name: String, description: String, image: UIImage, url: String, location: String, size: Bool, time: Bool, city: String, state: String) {
        self.name = name
        self.describe = description
        self.image = image
        self.url = url
        self.location = location
        self.size = size
        self.time = time
        self.city = city
        self.state = state
        super.init()
    }
}
