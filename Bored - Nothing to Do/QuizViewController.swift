//
//  QuizViewController.swift
//  SEKA
//
//  Created by Srividhya Gopalan on 3/9/16.
//  Copyright (c) 2016 Srividhya Gopalan. All rights reserved.
//

import UIKit
import Parse

class QuizViewController: UIViewController {
    
    var allQuestions: [question] = []
    var counter = 0
    
    var optionA = false
    var optionB = false
    var optionC = false
    var optionD = false
    
    var yesImage = UIImage(named: "buttonYes")
    var noImage = UIImage(named: "buttonNo")
    
    @IBOutlet weak var buttonA: UIButton!
    @IBOutlet weak var buttonB: UIButton!
    @IBOutlet weak var buttonC: UIButton!
    @IBOutlet weak var buttonD: UIButton!
    
    @IBOutlet weak var labelA: UILabel!
    @IBOutlet weak var labelB: UILabel!
    @IBOutlet weak var labelC: UILabel!
    @IBOutlet weak var labelD: UILabel!
    
    @IBOutlet weak var questionLabel: UILabel!
    
    @IBAction func nextButtonTapped(sender: AnyObject) {
        questionLabel.text = allQuestions[counter].toAsk
        labelA.text = allQuestions[counter].optionA
        labelB.text = allQuestions[counter].optionB
        labelC.text = allQuestions[counter].optionC
        labelD.text = allQuestions[counter].optionD
    }
    
    @IBAction func optionATapped(sender: AnyObject) {
        optionA = true
        optionB = false
        optionC = false
        optionD = false
        
        buttonA.selected = true
        buttonB.selected = false
        buttonC.selected = false
        buttonD.selected = false
    }
    
    @IBAction func optionBTapped(sender: AnyObject) {
        optionA = true
        optionB = false
        optionC = false
        optionD = false
        
        buttonA.selected = false
        buttonB.selected = true
        buttonC.selected = false
        buttonD.selected = false
    }
    
    @IBAction func optionCTapped(sender: AnyObject) {
        optionA = true
        optionB = false
        optionC = false
        optionD = false
        
        buttonA.selected = false
        buttonB.selected = false
        buttonC.selected = true
        buttonD.selected = false
    }
    
    @IBAction func optionDTapped(sender: AnyObject) {
        optionA = true
        optionB = false
        optionC = false
        optionD = false
        
        buttonA.selected = false
        buttonB.selected = false
        buttonC.selected = false
        buttonD.selected = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        buttonA.setImage(noImage, forState: UIControlState.Normal)
        buttonB.setImage(noImage, forState: UIControlState.Normal)
        buttonC.setImage(noImage, forState: UIControlState.Normal)
        buttonD.setImage(noImage, forState: UIControlState.Normal)
        
        buttonA.setImage(yesImage, forState: UIControlState.Selected)
        buttonB.setImage(yesImage, forState: UIControlState.Selected)
        buttonC.setImage(yesImage, forState: UIControlState.Selected)
        buttonD.setImage(yesImage, forState: UIControlState.Selected)
        
        let query = PFQuery(className: "Poll")
        query.orderByDescending("createdAt")
        
        // 7
        query.findObjectsInBackgroundWithBlock {(result: [AnyObject]?, error: NSError?) -> Void in
            // 8
            //            let data = parseEvent["imageFile"]!.getData()
            //            var parseImage = UIImage(data: data!, scale:1.0)
            let download = result as? [PFObject] ?? []
            for Choice in download {
                //var petName = Pet.description["Name"]
                self.allQuestions.append(question(toAsk: Choice["Question"]! as! String, optionA: Choice["A"]! as! String, optionB: Choice["B"]! as! String, optionC: Choice["C"]! as! String, optionD: Choice["D"]! as! String))
            }
                 self.setQuestion()
        }

        // Do any additional setup after loading the view.
    }
    
    func setQuestion() {

        questionLabel.text = allQuestions[counter].toAsk
        labelA.text = allQuestions[counter].optionA
        labelB.text = allQuestions[counter].optionB
        labelC.text = allQuestions[counter].optionC
        labelD.text = allQuestions[counter].optionD
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func SkipButtonTapped(sender: AnyObject) {
        
        optionA = false
        optionB = false
        optionC = false
        optionD = false
        
        buttonA.selected = false
        buttonB.selected = false
        buttonC.selected = false
        buttonD.selected = false
        
        counter++
        if counter == allQuestions.count {
            counter = 0
        }

        setQuestion()
    }
    
    @IBAction func NextButtonTapped(sender: AnyObject) {
        
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

func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    
    if (segue.identifier == "Next Sort") {
        //backgroundMusic.stop()
        let svc = segue.destinationViewController as! PetsViewController;
        svc.time = true
        svc.size = false
        svc.setPets()
    }
}


class question: NSObject {
    
    var toAsk: String
    var optionA: String
    var optionB: String
    var optionC: String
    var optionD: String
    
    init(toAsk: String, optionA: String, optionB: String, optionC: String, optionD: String) {
        self.toAsk = toAsk
        self.optionD = optionD
        self.optionC = optionC
        self.optionB = optionB
        self.optionA = optionA
        
        super.init()
    }
}

