//
//  HackathonViewController.swift
//  CodeCollab
//
//  Created by Sara Subbanna on 4/16/16.
//  Copyright (c) 2016 Avinash Jain. All rights reserved.
//

import UIKit
import MapKit

class HackathonViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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

import UIKit

class Hackathon: NSObject {
    
    var teamSize: Int
    var location: CLLocationCoordinate2D
    var name: String
    var date: NSDate
    var blurb: String
    var image: UIImage
    var prizes: [Prize]
    
    init(name: String, image: UIImage, date: NSDate, blurb: String, location: CLLocationCoordinate2D, teamSize: Int, prizes: [Prize]) {
        self.teamSize = teamSize
        self.name = name
        self.location = location
        self.date = date
        self.blurb = blurb
        self.image = image
        self.prizes = prizes
        
        super.init()
    }
    
}

class Connection: NSObject {
    
    var fromTeam: Team
    var toHack: Hackathon
    
    init(fromTeam: Team, toHack: Hackathon)
    {
        self.fromTeam = fromTeam
        self.toHack = toHack
        super.init()
    }
}

class Prize: NSObject {
    var amount: Int
    var sponsor: String
    var blurb: String
    
    init(amount: Int, sponsor: String, blurb: String) {
        self.amount = amount
        self.blurb = blurb
        self.sponsor = sponsor
        super.init()
    }
    
}

class Member: NSObject {
    var username: String
    var passcode: String
    var email: String
    var phone: String
    
    init(username: String, passcode: String, email: String, phone: String) {
        self.username = username
        self.passcode = passcode
        self.email = email
        self.phone = phone
        
        super.init()
    }
}

class Team: NSObject {
    var members: [Member]
    var forHack: Hackathon
    
    init(members: [Member], forHack: Hackathon){
        
        //var newConnetion = Connection(fromTeam: self, toHack: forHack)
        
        self.members = members
        self.forHack = forHack
        
        super.init()
    }
    //var newConnetion = Connection(fromTeam: self, toHack: forHack)
}