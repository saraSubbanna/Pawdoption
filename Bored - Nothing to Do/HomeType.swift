//
//  HomeType.swift
//  SEKA
//
//  Created by Sara Subbanna on 4/8/16.
//  Copyright (c) 2016 Srividhya Gopalan. All rights reserved.
//

import UIKit

class HomeType: NSObject {
    var size: Bool
    var time: Int
    var park: Bool
    
    init(size: Bool, time: Int, park: Bool) {
        self.size = size
        self.time = time
        self.park = park
        super.init()
    }
    
}

