//
//  BubbleTransition.swift
//  NSuserdefaultDemo
//
//  Created by Namrata Mohanty on 12/3/16.
//  Copyright © 2016 MOS360. All rights reserved.
//

import UIKit

class BubbleTransition: BaseTransition {
    
    var originalY: CGFloat!
    var blackView: UIView!
    
    override func presentTransition(containerView: UIView, fromViewController: UIViewController, toViewController: UIViewController) {
        
        
        var originalTBubbleFrame: CGRect!
        var originalCBubbleFrame: CGRect!
        
        let savedEntriesViewController = fromViewController as! SavedEntriesViewController
        
        let calendarViewController = toViewController as! CalendarViewController
        
        let todayImageView = savedEntriesViewController.bubbleImageView
        let calImageView = calendarViewController.imageView
        
        
        originalTBubbleFrame = todayImageView!.frame
        originalCBubbleFrame = calImageView!.frame
        
        let movedIM = UIImageView(frame: originalTBubbleFrame)
        
        movedIM.image =  todayImageView!.image
        let window = UIApplication.shared.keyWindow
        window?.addSubview(movedIM)
        
        UIView.animate(withDuration:0.4, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 1, options:[] ,
                       animations: { () -> Void in
                        movedIM.frame.origin.x = (calImageView?.frame.origin.x)!
                        movedIM.frame.origin.y = (calImageView?.frame.origin.y)!
                       // movedIM.transform = CGAffineTransform(translationX: 0, y: 10)
                        movedIM.transform = CGAffineTransform(scaleX: 0.5, y: 0.5)
                        
        }, completion: nil)
    }
    
        override func dismissTransition(containerView: UIView, fromViewController: UIViewController, toViewController: UIViewController) {
            
            
            print("nothing")
            
}

}
