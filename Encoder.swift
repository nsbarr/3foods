//
//  Encoder.swift
//  whatevs
//
//  Created by nick barr on 8/25/14.
//  Copyright (c) 2014 poemsio. All rights reserved.
//

import Foundation

class AnyClass:NSObject, NSCoding{
    var huh:String


 func encodeWithCoder(aCoder: NSCoder!){
    println("encodeWithCoder run")
    aCoder.encodeObject(foodList, forKey:"huh")
    
}
init(coder aDecoder:NSCoder!){
    huh = aDecoder.decodeObjectForKey("huh") as String
}
}