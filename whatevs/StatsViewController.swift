//
//  StatsViewController.swift
//  whatevs
//
//  Created by nick barr on 8/22/14.
//  Copyright (c) 2014 poemsio. All rights reserved.
//

import UIKit
import QuartzCore
import Foundation

var meatBar = UIView(frame: CGRect(x: 200, y: -100, width: foodList["MEAT"]!, height: 100))

class StatsViewController: UIViewController {


    override func loadView() {
        //super.loadView()
        self.view = UIView(frame: UIScreen.mainScreen().applicationFrame)
        self.view.backgroundColor = UIColor.whiteColor()
    
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        //do stuff
        println(self.view)
        println("heynewview")
        
        let goBack = UIButton(frame: CGRect(x:0, y:10, width:view.frame.width, height:100))
        goBack.setTitle("go back", forState: .Normal)
        goBack.titleLabel.font = UIFont(name: "AppleSDGothicNeo-Medium", size: 18)
        goBack.backgroundColor = UIColor.redColor()
        goBack.addTarget(self, action: "buttonPressed:", forControlEvents: UIControlEvents.TouchUpInside)
        view.addSubview(goBack)
        let veggieLength:Int = foodList["VEGGIE"]!
        var veggieBar = UIView(frame: CGRect(x: 100, y: 100, width: veggieLength+20, height: 100))
        veggieBar.backgroundColor = UIColor.greenColor()
        veggieBar.alpha = 1
        veggieBar.tag = 1
        self.view.addSubview(veggieBar)
        
        meatBar.backgroundColor = UIColor.grayColor()
        self.view.addSubview(meatBar)
        
        
        
        


        println(foodList)
        println(view.subviews)
        
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        UIView.beginAnimations("button", context: nil)
        UIView.setAnimationDuration(2)
        var theLabel : UIView = self.view.viewWithTag(1) as UIView;
        theLabel.alpha = 0
        theLabel.frame.origin.y = theLabel.frame.origin.y+40
        
        meatBar.frame.origin.y = meatBar.frame.origin.y+200
        UIView.commitAnimations()

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func buttonPressed(sender: UIButton) {
        println("\(sender.titleLabel.text) was tapped")
        
        UIView.beginAnimations("foo", context: nil)
        UIView.setAnimationDuration(2)
        sender.alpha = 0
        sender.frame.origin.y = sender.frame.origin.y+40
        UIView.commitAnimations()

        
      //  self.presentViewController(ViewController(), animated: false, completion:nil )
    }
    
    

}