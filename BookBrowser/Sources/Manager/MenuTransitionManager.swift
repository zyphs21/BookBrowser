//
//  MenuTransitionManager.swift
//  BookBrowser
//
//  Created by Hanson on 16/4/12.
//  Copyright © 2016年 hanson. All rights reserved.
//

import UIKit

@objc protocol MenuTransitionManagerDelegate {
    
    func dismiss()
    
}

class MenuTransitionManager: NSObject, UIViewControllerAnimatedTransitioning, UIViewControllerTransitioningDelegate {
    
    let duration = 0.5
    var isPresenting = false
    weak var delegate:MenuTransitionManagerDelegate?
    var snapshot:UIView? {
        didSet {
//            if let _delegate = delegate {
//                let tapGestureRecognizer = UITapGestureRecognizer(target: , action: #selector(MenuTransitionManagerDelegate.dismiss))
                let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(tagGestureHandler(_:)))
                snapshot?.addGestureRecognizer(tapGestureRecognizer)
//            }
        }
    }
    
    
    
    func transitionDuration(transitionContext: UIViewControllerContextTransitioning?) -> NSTimeInterval {
        return duration
    }
    
    func animateTransition(transitionContext: UIViewControllerContextTransitioning) {
        
        let fromView = transitionContext.viewForKey(UITransitionContextFromViewKey)!
        let toView = transitionContext.viewForKey(UITransitionContextToViewKey)!
        
        let container = transitionContext.containerView()
        let moveDown = CGAffineTransformMakeTranslation(0, container!.frame.height - 300)
        let moveUp = CGAffineTransformMakeTranslation(0, -50)
        
        if isPresenting {
            toView.transform = moveUp
            snapshot = fromView.snapshotViewAfterScreenUpdates(true)
            container!.addSubview(toView)
            container!.addSubview(snapshot!)
        }
        
        UIView.animateWithDuration(duration, delay: 0.0, usingSpringWithDamping: 0.9, initialSpringVelocity: 0.3, options: .CurveEaseInOut, animations: {
            
            if self.isPresenting {
                self.snapshot?.transform = moveDown
                toView.transform = CGAffineTransformIdentity
            } else {
                self.snapshot?.transform = CGAffineTransformIdentity
                fromView.transform = moveUp
            }
            
            }, completion: { finished in
                
                transitionContext.completeTransition(true)
                if !self.isPresenting {
                    self.snapshot?.removeFromSuperview()
                }
        })
        
    }
    
    
    func animationControllerForDismissedController(dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        isPresenting = false
        
        return self
    }
    
    func animationControllerForPresentedController(presented: UIViewController, presentingController presenting: UIViewController, sourceController source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        isPresenting = true
        
        return self
    }
    
    
    // MARK: - Gesture
    
    func tagGestureHandler(gesture: UITapGestureRecognizer) {
        delegate?.dismiss()
    }
    
    
}

