//
//  GameViewController.swift
//  Bored - Nothing to Do
//
//  Created by Sara Subbanna on 4/10/16.
//  Copyright (c) 2016 Sara Subbanna. All rights reserved.
//

import UIKit

class GameViewController: UIViewController {

    @IBOutlet weak var foodLabel: UILabel!
    @IBOutlet weak var healthLabel: UILabel!
    @IBOutlet weak var waterLabel: UILabel!
    @IBOutlet weak var dogView: UIImageView!
    
    var fullBowl = UIImage(named: "full bowl")
    var emptyBowl = UIImage(named: "empty bowl")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        waterLabel.text = "Thirsty"
        foodLabel.text = "Hungry"
        healthLabel.text = "Sick"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func waterButtonTapped(sender: AnyObject) {
        waterLabel.text = "Quenched"
    }
    
    @IBAction func healthButtonTapped(sender: AnyObject) {
        healthLabel.text = "Healthy"
    }

    @IBAction func foodButtonTapped(sender: AnyObject) {
        foodLabel.text = "Fed"
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
