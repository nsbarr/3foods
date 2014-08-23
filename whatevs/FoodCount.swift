//
//  FoodCount.swift
//  whatevs
//
//  Created by nick barr on 8/22/14.
//  Copyright (c) 2014 poemsio. All rights reserved.
//

import Foundation
import UIKit

struct FoodCount {
    var veggieCount = 0
    var fishCount = 0
    var meatCount = 0
}

var foodList = ["🍏":3,"🍖":2,"🐟":5]

//let plistPath = NSBundle.mainBundle().pathForResource("Info", ofType: "plist")
//let dict = NSDictionary(contentsOfFile: plistPath)
//
//let foodList2:AnyObject = dict.objectForKey("FoodData")