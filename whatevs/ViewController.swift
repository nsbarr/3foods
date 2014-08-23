//
//  ViewController.swift
//  whatevs
//
//  Created by nick barr on 8/21/14.
//  Copyright (c) 2014 poemsio. All rights reserved.
//

import UIKit
import Foundation


class ViewController: UIViewController {
    
    var foodCount = FoodCount()
    var filteredSubviews = [UIButton]()
    


    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.view.backgroundColor = UIColor.whiteColor()
       // view.backgroundColor = UIColor.whiteColor()
        let meatColor = UIColor(red: 1, green: 109/255, blue: 74/255, alpha: 1)
        let fishColor = UIColor(red:120/255, green:254/255, blue: 255/255, alpha:1)
        let veggieColor = UIColor(red:95/255,green:232/255, blue:105/255, alpha:1)
        

    


        
        let meat = UIButton(frame: CGRect(x:0, y:0, width:view.frame.width, height:view.frame.height/3))
        meat.setTitle("🍖", forState: .Normal)
     //   meat.setTitle("MEAT", forState: .Highlighted)
        meat.titleLabel.font = UIFont(name: "AppleSDGothicNeo-Medium", size: 40)
        meat.backgroundColor = meatColor
        meat.addTarget(self, action: "buttonPressed:", forControlEvents: UIControlEvents.TouchUpInside)

        view.addSubview(meat)
        
        let fish = UIButton(frame: CGRect(x:0, y:view.frame.height/3, width:view.frame.width, height:view.frame.height/3))
        fish.setTitle("🐟", forState: .Normal)
    //    fish.setTitle("FISH", forState: .Highlighted)
        fish.userInteractionEnabled = true
        fish.titleLabel.font = UIFont(name: "AppleSDGothicNeo-Medium", size: 40)
        fish.backgroundColor = fishColor
        fish.addTarget(self, action: "buttonPressed:", forControlEvents: UIControlEvents.TouchUpInside)

        view.addSubview(fish)
        
        let veggie = UIButton(frame: CGRect(x:0, y:2*view.frame.height/3, width:view.frame.width, height:view.frame.height/3))
        veggie.setTitle("🍏", forState: .Normal)
       // veggie.setTitle("VEGGIE", forState: .Highlighted)
        veggie.userInteractionEnabled = true
        veggie.titleLabel.font = UIFont(name: "AppleSDGothicNeo-Medium", size: 40)
        veggie.backgroundColor = veggieColor
        veggie.addTarget(self, action: "buttonPressed:", forControlEvents: UIControlEvents.TouchUpInside)

        view.addSubview(veggie)
        
        self.view.userInteractionEnabled = true
        
        filteredSubviews = self.view.subviews as [UIButton]
        

        

        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
func buttonPressed(sender: UIButton) {
    println("\(sender.titleLabel.text) was tapped")
    
    foodList[sender.titleLabel.text] = foodList[sender.titleLabel.text]!+1
    

    
    self.animateLabels()
    

    
//    UIView.beginAnimations("foo", context: nil)
//    UIView.setAnimationDuration(2)

    //sender.titleLabel.center.x = 400
//    UIView.commitAnimations()

    
    
    
   // self.presentViewController(StatsViewController(), animated: false, completion:nil )
    }
    func animateLabels(){
        var barWidth:CGFloat
        
        //find largest value in foodDict
        var currentLargestValue:CGFloat = 0
        for foodCount in foodList.values {
            if (CGFloat(foodCount) > currentLargestValue) {
                currentLargestValue = CGFloat(foodCount)
            }
        }
        let widthOfEachUnit = view.frame.width/currentLargestValue
        
        for button in filteredSubviews {
            
            let buttonCount = CGFloat(foodList[button.titleLabel.text]!)
            barWidth = buttonCount*widthOfEachUnit
            button.frame = CGRectMake(button.frame.origin.x, button.frame.origin.y, 80, button.frame.height)
            UIView.animateWithDuration(1, animations: {
                button.frame = CGRectMake(button.frame.origin.x, button.frame.origin.y, barWidth, button.frame.height)
            })
            let theLabel = UILabel(frame: button.frame)
            theLabel.text = String(foodList[button.titleLabel.text]!)
            theLabel.userInteractionEnabled = false
            self.view.addSubview(theLabel)
            
        }
        println(foodList)
}
}