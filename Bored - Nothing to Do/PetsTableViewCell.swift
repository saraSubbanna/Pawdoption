//
//  PetsTableViewCell.swift
//  SEKA
//
//  Created by Srividhya Gopalan on 3/9/16.
//  Copyright (c) 2016 Srividhya Gopalan. All rights reserved.
//

import UIKit

class PetsTableViewCell: UITableViewCell {
    
    var title: String!
    var describe: String!
    var petImage: UIImage!
    var url: String!
    
    @IBOutlet weak var cellImage: UIImageView!
    @IBOutlet weak var cellName: UILabel!
    @IBOutlet weak var cellDescription: UITextView!
    
    func loadItems (name: String, petImage: UIImage, petDescription: String, url: String) {
        
        cellName.text = name
        cellImage.image = petImage
        cellDescription.text = petDescription + ": " + url
        self.url = url
        
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        //self.backgroundColor = UIColor.blueColor()
        // Initialization code
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
