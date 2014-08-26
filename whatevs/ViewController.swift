//
//  ViewController.swift
//  whatevs
//
//  Created by nick barr on 8/21/14.
//  Copyright (c) 2014 poemsio. All rights reserved.
//

import UIKit
import Foundation
import QuartzCore

class ViewController: UIViewController {
    
    var filteredSubviews = [UIButton]()
    var dateButton = UIButton()
    let dateFormatter = NSDateFormatter()
    let locale = NSLocale.currentLocale()
    var theDate:NSString = ""

    
    
    
    var veggieCount = NSUserDefaults.standardUserDefaults().integerForKey("veggieCount")
    var fishCount = NSUserDefaults.standardUserDefaults().integerForKey("fishCount")
    var meatCount = NSUserDefaults.standardUserDefaults().integerForKey("meatCount")
    var currentDate = NSUserDefaults.standardUserDefaults().stringForKey("currentDate")
    
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        for subview in view.subviews {
            subview.removeFromSuperview()

        }
        
        var timer = NSTimer.scheduledTimerWithTimeInterval(20, target: self, selector: Selector("checkTheTime"), userInfo: nil, repeats: true)

        
        self.view.backgroundColor = UIColor.whiteColor()
    
    

        let meatColor = UIColor(red: 1, green: 109/255, blue: 74/255, alpha: 1)
        let fishColor = UIColor(red:120/255, green:254/255, blue: 255/255, alpha:1)
        let veggieColor = UIColor(red:95/255,green:232/255, blue:105/255, alpha:1)
        

    


        let veggie = UIButton(frame: CGRect(x:0, y:2*view.frame.height/3, width:view.frame.width, height:view.frame.height/3))
        veggie.setTitle("🍏", forState: .Normal)
        veggie.setTitle("VEGGIE", forState: .Highlighted)
        veggie.userInteractionEnabled = true
        veggie.titleLabel.font = UIFont(name: "AppleSDGothicNeo-Medium", size: 60)
        veggie.backgroundColor = veggieColor
        veggie.addTarget(self, action: "buttonPressed:", forControlEvents: UIControlEvents.TouchUpInside)
        veggie.tag = 0
        view.addSubview(veggie)

        
        
        let fish = UIButton(frame: CGRect(x:0, y:view.frame.height/3, width:view.frame.width, height:view.frame.height/3))
        fish.setTitle("🐟", forState: .Normal)
        fish.setTitle("FISH", forState: .Highlighted)
        fish.titleLabel.font = UIFont(name: "AppleSDGothicNeo-Medium", size: 60)
        fish.backgroundColor = fishColor
        fish.addTarget(self, action: "buttonPressed:", forControlEvents: UIControlEvents.TouchUpInside)
        fish.tag = 1
        view.addSubview(fish)
        

        
        let meat = UIButton(frame: CGRect(x:0, y:0, width:view.frame.width, height:view.frame.height/3))
        meat.setTitle("🍖", forState: .Normal)
        meat.setTitle("MEAT", forState: .Highlighted)
        meat.titleLabel.font = UIFont(name: "AppleSDGothicNeo-Medium", size: 60)
        meat.backgroundColor = meatColor
        meat.addTarget(self, action: "buttonPressed:", forControlEvents: UIControlEvents.TouchUpInside)
        meat.tag = 2
        view.addSubview(meat)

        
        filteredSubviews = self.view.subviews as [UIButton]
        filteredSubviews = filteredSubviews.reverse()
        
        
        

        
        let navBar = UINavigationBar(frame: CGRect(x: 0, y: 0, width: 320, height: 50))
        navBar.backgroundColor = UIColor.blackColor()
        view.addSubview(navBar)
        
        dateFormatter.timeStyle = NSDateFormatterStyle.ShortStyle
        dateFormatter.dateStyle = NSDateFormatterStyle.MediumStyle
        dateFormatter.locale = locale
        dateFormatter.doesRelativeDateFormatting = false
        theDate = dateFormatter.stringFromDate(NSDate.date())
        NSUserDefaults.standardUserDefaults().setObject(theDate, forKey: "currentDate")
        dateButton.setTitle("What did you eat today?", forState: .Normal)
        dateButton.frame = CGRect(x: 0, y: 0,width: view.frame.width,height: 40)
        dateButton.tag = 99
        navBar.addSubview(dateButton)


        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func buttonPressed(sender: UIButton) {
        println("\(sender.titleLabel.text) was tapped")
        

        
        if (sender.tag == 0){ //veggie
            
            veggieCount = veggieCount + 1
            NSUserDefaults.standardUserDefaults().setInteger(veggieCount, forKey: "veggieCount")
            println("veggie count is \(veggieCount)")
            
            
        }
        else if (sender.tag == 1){ //fish
            fishCount = fishCount + 1
            NSUserDefaults.standardUserDefaults().setInteger(fishCount, forKey: "fishCount")
            println("fish count is \(fishCount)")
        }
        
        else if (sender.tag) == 2 { //meat
            meatCount = meatCount + 1
            NSUserDefaults.standardUserDefaults().setInteger(meatCount, forKey: "meatCount")
            println("meat count is \(meatCount)")
        }
        
        else {
            println("no food tapped")
        }
        
        self.animateLabels()
        
    }
    
    func animateLabels(){
        var barHeight:CGFloat
        var startingYPosition:CGFloat = 0
        
        //find sum of the foodCounts
        var sumOfTheCounts = 0
        var arrayOfFoodCounts = [veggieCount, fishCount, meatCount]
        for foodCount in arrayOfFoodCounts {
            
            sumOfTheCounts = sumOfTheCounts + foodCount

        }
        let heightOfEachUnit = view.frame.height/CGFloat(sumOfTheCounts)
        
        for button in filteredSubviews {
            if (button.tag < 3) {
                let buttonCount = CGFloat(arrayOfFoodCounts[button.tag])
                barHeight = buttonCount*heightOfEachUnit
                UIView.animateWithDuration(1, animations: {
                    button.frame = CGRectMake(button.frame.origin.x, startingYPosition, button.frame.width, barHeight)
                  //  button.titleLabel.transform = CGAffineTransformScale(button.titleLabel.transform, 0.8, 0.8);
                    
                },
                completion: { (value:Bool) in
                    if (button.frame.height == 0){
                        button.removeFromSuperview()
                    }
                    let theLabel = UILabel(frame: CGRect(x: button.frame.width-30, y: button.frame.height/2-10, width: 20, height: 20))
                    theLabel.textColor = UIColor.whiteColor()
                    
                    var shapeLayer = CAShapeLayer()
                    let thePath = CGPathCreateWithEllipseInRect(CGRect(x: button.frame.width-30, y: button.frame.height/2-10, width: 20, height: 20), nil)
                    shapeLayer.fillColor = UIColor.blackColor().CGColor
                    shapeLayer.opacity = 0.4
                    shapeLayer.path = thePath
                    
                    button.layer.addSublayer(shapeLayer)
                
                    
                    
                    theLabel.text = String(arrayOfFoodCounts[button.tag])
                    //button.addSubview(theCircleView)
                    button.addSubview(theLabel)
                })
            
            startingYPosition = startingYPosition + barHeight
            button.userInteractionEnabled = false
            }
        }
        dateButton.setTitle("Yum! See you tomorrow.", forState: .Normal)
    }
    
    func checkTheTime() {
        let theLastCheckedDate = NSUserDefaults.standardUserDefaults().stringForKey("currentDate")
        let theUpdatedDate = dateFormatter.stringFromDate(NSDate.date())
            
        println(theLastCheckedDate, theUpdatedDate)
        
        if (theLastCheckedDate != theUpdatedDate){
                println("goddamn, it's a new day")
                currentDate = theUpdatedDate
                NSUserDefaults.standardUserDefaults().setObject(currentDate, forKey: "currentDate")
                self.viewDidLoad()
            
            }
            else {
                println("same ole same ole")
            }
        
    }
    
}