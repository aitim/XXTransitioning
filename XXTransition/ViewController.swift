//
//  ViewController.swift
//  XXTransition
//
//  Created by xin.xin on 3/26/15.
//  Copyright (c) 2015 aitim. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        var button = UIButton(frame: CGRectMake(10 , 100 , 100 , 100 ))
        button.setTitle("Click Me", forState: UIControlState.Normal)
        button.sizeToFit()
        button.setTitleColor(UIColor.lightGrayColor(), forState: UIControlState.Normal)
        self.view.addSubview(button)
        
        button.addTarget(self, action: "btnClicked:", forControlEvents: UIControlEvents.TouchUpInside)
    }
    
    func btnClicked(sender:UIButton){
        var controller = UIViewController()
        controller.view.backgroundColor = UIColor.yellowColor()
        var delegate = XXViewControllerTransitioningDelegate()
        controller.transitioningDelegate = delegate
        
        self.presentViewController(controller, animated: true , completion: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

