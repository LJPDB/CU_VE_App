//
//  SideBar.swift
//  CU_VE_App
//
//  Created by Leonardo Puga-DeBiase on 2/11/16.
//  Copyright © 2016 LJPDB. All rights reserved.
//

import UIKit

@objc protocol SideBarDelegate{
    func sideBarDidSelectButtonAtIndex(index:Int)
    optional func sideBarWillClose()
    optional func sideBarWillOpen()
}

class SideBar: NSObject, SideBarTVCDelegate {
    
    let barWidth:CGFloat = 150.0
    let sideBarTVTopInset:CGFloat = 25.0
    var sideBarContainerView:UIView = UIView()
    var sideBarTVC:SideBarTVC = SideBarTVC()
    var originView:UIView!
    
    var animator:UIDynamicAnimator!
    var delegate:SideBarDelegate?
    var isSideBarOpen:Bool = false
    
    override init() {
        super.init()
    }
    
    init(sourceView:UIView, tableDataSections:[String], tableDataSectionsOptions:Array<Array<String>>){
        super.init()
        originView = sourceView
        sideBarTVC.tableDataSections = tableDataSections
        sideBarTVC.tableDataSectionsOptions = tableDataSectionsOptions
        
        setupSideBar()
        
        animator = UIDynamicAnimator(referenceView:originView)
        let hideGestureRecognizer:UISwipeGestureRecognizer = UISwipeGestureRecognizer(target: self, action: "handleSwipe:")
        hideGestureRecognizer.direction = UISwipeGestureRecognizerDirection.Left
        originView.addGestureRecognizer(hideGestureRecognizer)
        let showGestureRecognizer:UISwipeGestureRecognizer = UISwipeGestureRecognizer(target: self, action: "handleSwipe:")
        showGestureRecognizer.direction = UISwipeGestureRecognizerDirection.Right
        originView.addGestureRecognizer(showGestureRecognizer)
        
        
    }
    
    func setupSideBar(){
        sideBarContainerView.frame = CGRectMake(-barWidth - 1, originView.frame.origin.y, barWidth, originView.frame.size.height)
        sideBarContainerView.backgroundColor = UIColor.clearColor()
        sideBarContainerView.clipsToBounds = false
        
        originView.addSubview(sideBarContainerView)
        
        let blurEffect:UIVisualEffectView = UIVisualEffectView(effect: UIBlurEffect(style: UIBlurEffectStyle.Dark))
        blurEffect.alpha = 0.9
        blurEffect.frame = sideBarContainerView.bounds
        sideBarContainerView.addSubview(blurEffect)
        
        sideBarTVC.delegate = self
        sideBarTVC.tableView.frame = sideBarContainerView.bounds
        sideBarTVC.tableView.clipsToBounds = false
        sideBarTVC.tableView.separatorStyle = UITableViewCellSeparatorStyle.None
        sideBarTVC.tableView.backgroundColor = UIColor.clearColor()
        sideBarTVC.tableView.scrollsToTop = false
        sideBarTVC.tableView.contentInset = UIEdgeInsetsMake(sideBarTVTopInset, 0, 0, 0)
        
        sideBarTVC.tableView.reloadData()
        sideBarContainerView.addSubview(sideBarTVC.tableView)
    }
    
    func handleSwipe(recognizer: UISwipeGestureRecognizer){
        if recognizer.direction == UISwipeGestureRecognizerDirection.Left{
            showSideBar(false)
            delegate?.sideBarWillClose!()
        }else{
            showSideBar(true)
            delegate?.sideBarWillOpen!()
        }
    }
    
    func showSideBar(shouldOpen:Bool){
        animator.removeAllBehaviors()
        isSideBarOpen = shouldOpen
        
        let gravityX:CGFloat = (shouldOpen) ? 0.5 : -0.5
        let magnitude:CGFloat = (shouldOpen) ? 20 : -20
        let boundaryX:CGFloat = (shouldOpen) ? barWidth : -barWidth - 1
        
        let gravityBehavior:UIGravityBehavior = UIGravityBehavior(items: [sideBarContainerView])
        gravityBehavior.gravityDirection = CGVectorMake(gravityX, 0)
        animator.addBehavior(gravityBehavior)
        
        let collisionBehavior:UICollisionBehavior = UICollisionBehavior(items: [sideBarContainerView])
        collisionBehavior.addBoundaryWithIdentifier("sideBarBoundary", fromPoint: CGPointMake(boundaryX, 20), toPoint:  CGPointMake(boundaryX, originView.frame.size.height))
        animator.addBehavior(collisionBehavior)
        
        let pushBehavior:UIPushBehavior = UIPushBehavior(items: [sideBarContainerView], mode: UIPushBehaviorMode.Instantaneous)
        pushBehavior.magnitude = magnitude
        animator.addBehavior(pushBehavior)
        
        let sideBarBehavior:UIDynamicItemBehavior = UIDynamicItemBehavior(items: [sideBarContainerView])
        sideBarBehavior.elasticity = 0.3
        animator.addBehavior(sideBarBehavior)
    }
    
    func sideBarControlDidSelectRow(indexPath: NSIndexPath) {
        delegate?.sideBarDidSelectButtonAtIndex(indexPath.row)
    }
    
}
