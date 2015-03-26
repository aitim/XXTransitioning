//
//  XXViewControllerAnimatedTransitioning.swift
//  XXTransition
//
//  Created by xin.xin on 3/26/15.
//  Copyright (c) 2015 aitim. All rights reserved.
//

import UIKit

class XXViewControllerAnimatedTransitioning: NSObject,UIViewControllerAnimatedTransitioning {
    
    func animateTransition(transitionContext: UIViewControllerContextTransitioning) {
        var fromController = transitionContext.viewControllerForKey(UITransitionContextFromViewControllerKey)
        var toController = transitionContext.viewControllerForKey(UITransitionContextToViewControllerKey)
        var container = transitionContext.containerView()
        
        container.addSubview(toController!.view)
        
        //create snapshot
        var rect = fromController!.view.frame
        UIGraphicsBeginImageContext(rect.size)
        var context = UIGraphicsGetCurrentContext()
        fromController?.view.layer.renderInContext(context)
        var snapshot = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        var cgImgUp = CGImageCreateWithImageInRect(snapshot.CGImage, CGRectMake(0, 0, rect.size.width, rect.size.height/2))
        var cgImgDown = CGImageCreateWithImageInRect(snapshot.CGImage, CGRectMake(0, rect.size.height/2, rect.size.width, rect.size.height/2))
        
        var snapshotUp = UIImageView(image: UIImage(CGImage: cgImgUp))
        var snapshotDown = UIImageView(image: UIImage(CGImage: cgImgDown))
        snapshotUp.frame = CGRectMake(0, 0, rect.size.width, rect.size.height/2)
        snapshotDown.frame = CGRectMake(0, rect.size.height/2, rect.size.width, rect.size.height/2)
        container.addSubview(snapshotUp)
        container.addSubview(snapshotDown)
       
        //animate
//        toController?.view.transform = CGAffineTransformMakeScale(0, 0)
        
        UIView.animateWithDuration(0.5, animations: { () -> Void in
//            toController!.view.transform = CGAffineTransformIdentity
            
            snapshotUp.frame.origin.y = -rect.size.height/2
            snapshotDown.frame.origin.y = rect.size.height
            }) { (finished:Bool) -> Void in
                snapshotUp.removeFromSuperview()
                snapshotDown.removeFromSuperview()
                
                transitionContext.completeTransition(true)
        }
        
    }
    
    func transitionDuration(transitionContext: UIViewControllerContextTransitioning) -> NSTimeInterval {
        return 0.5
    }
    
}
