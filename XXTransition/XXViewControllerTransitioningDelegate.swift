//
//  XXViewControllerTransitioningDelegate.swift
//  XXTransition
//
//  Created by xin.xin on 3/26/15.
//  Copyright (c) 2015 aitim. All rights reserved.
//

import UIKit

class XXViewControllerTransitioningDelegate: NSObject,UIViewControllerTransitioningDelegate {
    func animationControllerForPresentedController(presented: UIViewController, presentingController presenting: UIViewController, sourceController source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return XXViewControllerAnimatedTransitioning()
    }
    
    func animationControllerForDismissedController(dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        var transitioning = XXViewControllerAnimatedTransitioning()
        return transitioning
    }
    
}
