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
    var dateButton = UIButton()
    
    
    
    var veggieCount = NSUserDefaults.standardUserDefaults().integerForKey("veggieCount")
    var fishCount = NSUserDefaults.standardUserDefaults().integerForKey("fishCount")
    var meatCount = NSUserDefaults.standardUserDefaults().integerForKey("meatCount")
    


    
   // var foo = NSDictionary()
    //var foodRecord = NSUserDefaults.standardUserDefaults()
    
    //var sessionRecord = foodList
    
    


    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        //get foodRecord; if foodRecord doesn't exist then create it and make it 0:0:0
        //let sparseRecord = ["veggie":NSNumber(int:0),"meat":NSNumber(int:0),"fish":NSNumber(int:0)] as NSDictionary
        
        //NSUserDefaults.standardUserDefaults().setObject(sparseRecord, forKey: "myDict")
        

        
//        
//        if let foo = NSUserDefaults.standardUserDefaults().dictionaryForKey("myDict") {
//            println("value of foo is \(foo)")
//            println(foo["veggie"])
//            
//        }
//        else {
//            println("foo doesnt exist..creating")
//       //     NSUserDefaults.standardUserDefaults().setObject(sparseRecord, forKey: "myDict")
//            var foo = NSUserDefaults.standardUserDefaults().dictionaryForKey("myDict")
//            println(foo)
//            
//        }

        
        for subview in view.subviews {
            subview.removeFromSuperview()

        }
        
        var timer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: Selector("checkTheTime"), userInfo: nil, repeats: true)

        // Do any additional setup after loading the view, typically from a nib.
        
        self.view.backgroundColor = UIColor.whiteColor()
       
    

        let meatColor = UIColor(red: 1, green: 109/255, blue: 74/255, alpha: 1)
        let fishColor = UIColor(red:120/255, green:254/255, blue: 255/255, alpha:1)
        let veggieColor = UIColor(red:95/255,green:232/255, blue:105/255, alpha:1)
        

    


        
        let meat = UIButton(frame: CGRect(x:0, y:0, width:view.frame.width, height:view.frame.height/3))
        meat.setTitle("🍖", forState: .Normal)
     //   meat.setTitle("MEAT", forState: .Highlighted)
        meat.titleLabel.font = UIFont(name: "AppleSDGothicNeo-Medium", size: 40)
        meat.backgroundColor = meatColor
        meat.addTarget(self, action: "buttonPressed:", forControlEvents: UIControlEvents.TouchUpInside)
        meat.tag = 300
        view.addSubview(meat)
        
        let fish = UIButton(frame: CGRect(x:0, y:view.frame.height/3, width:view.frame.width, height:view.frame.height/3))
        fish.setTitle("🐟", forState: .Normal)
    //    fish.setTitle("FISH", forState: .Highlighted)
        fish.userInteractionEnabled = true
        fish.titleLabel.font = UIFont(name: "AppleSDGothicNeo-Medium", size: 40)
        fish.backgroundColor = fishColor
        fish.addTarget(self, action: "buttonPressed:", forControlEvents: UIControlEvents.TouchUpInside)
        fish.tag = 200
        view.addSubview(fish)
        
        let veggie = UIButton(frame: CGRect(x:0, y:2*view.frame.height/3, width:view.frame.width, height:view.frame.height/3))
        veggie.setTitle("🍏", forState: .Normal)
       // veggie.setTitle("VEGGIE", forState: .Highlighted)
        veggie.userInteractionEnabled = true
        veggie.titleLabel.font = UIFont(name: "AppleSDGothicNeo-Medium", size: 40)
        veggie.backgroundColor = veggieColor
        veggie.addTarget(self, action: "buttonPressed:", forControlEvents: UIControlEvents.TouchUpInside)
        veggie.tag = 100

        view.addSubview(veggie)
        
        filteredSubviews = self.view.subviews as [UIButton]
        let staticFilteredSubviews = filteredSubviews
        
        
        let dateFormatter = NSDateFormatter()
        dateFormatter.timeStyle = NSDateFormatterStyle.NoStyle
        dateFormatter.dateStyle = NSDateFormatterStyle.MediumStyle
        let locale = NSLocale.currentLocale()
        dateFormatter.locale = locale
        dateFormatter.doesRelativeDateFormatting = false
        let theDate = dateFormatter.stringFromDate(NSDate.date())
        dateButton.setTitle(theDate, forState: .Normal)
        dateButton.frame = CGRect(x: 0, y: view.frame.height-50,width: view.frame.width,height: 40)
        dateButton.tag = 1
        self.view.addSubview(dateButton)
        
        self.view.userInteractionEnabled = true

        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
func buttonPressed(sender: UIButton) {
    println("\(sender.titleLabel.text) was tapped")
    
    //var foo:NSDictionary = NSUserDefaults.standardUserDefaults().dictionaryForKey("myDict")
    
   // var baz = Int(foo["veggie"] as NSNumber)
    
    if (sender.tag == 100){ //veggie
//        println("incrementing veggie from")
//        println(foo["veggie"])
//        println("to")
//        println(Int(foo["veggie"] as NSNumber) + 1)
//        
//        baz = baz + 1
//        
//        NSUserDefaults.standardUserDefaults().setObject(baz, forKey: "myDict")
        
        veggieCount = veggieCount + 1
        NSUserDefaults.standardUserDefaults().setInteger(veggieCount, forKey: "veggieCount")
        println(veggieCount)
        
        
    }
    else if (sender.tag == 200){ //fish
        fishCount = fishCount + 1
        NSUserDefaults.standardUserDefaults().setInteger(fishCount, forKey: "fishCount")
        println(fishCount)
    }
    
    else if (sender.tag) == 300 { //meat
        meatCount = meatCount + 1
        NSUserDefaults.standardUserDefaults().setInteger(meatCount, forKey: "meatCount")
        println(meatCount)
    }
    
    else { println("no food tapped")}
    
//    foodList[sender.titleLabel.text] = foodList[sender.titleLabel.text]!+1
//
//    foodRecord.setObject(foodList, forKey: "foodRecord")
//    foodRecord.synchronize()
//    
//    println(foodRecord.objectForKey("foodRecord"))
//    
    
    

    
    self.animateLabels()
    


    }
    
    func animateLabels(){
        var barHeight:CGFloat
        var startingYPosition:CGFloat = 0
        
        //find largest value in foodDict
        var sumOfTheCounts = 0
        for foodCount in foodList.values {
            
            sumOfTheCounts = sumOfTheCounts + foodCount

        }
        let heightOfEachUnit = view.frame.height/CGFloat(sumOfTheCounts)
        
        println(filteredSubviews)
        for button in filteredSubviews {
            if (button.tag != 1) {
            
            let buttonCount = CGFloat(foodList[button.titleLabel.text]!)
            barHeight = buttonCount*heightOfEachUnit
            UIView.animateWithDuration(1, animations: {
                button.frame = CGRectMake(button.frame.origin.x, startingYPosition, button.frame.width, barHeight)
            },
                completion: { (value:Bool) in
                    let theLabel = UILabel(frame: CGRect(x: 10,y: 0,width: button.frame.width,height: button.frame.height))
                    
                    theLabel.text = String(foodList[button.titleLabel.text]!)
                    
                    theLabel.removeFromSuperview()
                    button.addSubview(theLabel)
                    
                })
            
            startingYPosition = startingYPosition + barHeight
            button.userInteractionEnabled = false
            
        }
        }
        println(foodList)
        self.addResetButton()

}
    func checkTheTime() {
    //    println(NSDate.date())
        
    }
    func addResetButton() {
        
        dateButton.setTitle("Come Back Tomorrow", forState: .Normal)
        
        dateButton.addTarget(self, action: "resetView:", forControlEvents: UIControlEvents.TouchUpInside)
        
    }
    func resetView(sender:UIButton){
        self.viewDidLoad()
    }
}