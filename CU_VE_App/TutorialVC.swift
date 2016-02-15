//
//  SliderVC.swift
//  CU_VE_App
//
//  Created by Daniel Puga on 11/1/16.
//  Copyright © 2016 LJPDB. All rights reserved.
//

import UIKit

class TutorialVC : UIViewController {  //, UIPageViewControllerDataSource, UIPageViewControllerDelegate 
   /* private var pagingViewController : UIPageViewController!
    @IBOutlet weak var loadingGif: UIActivityIndicatorView!
    @IBOutlet weak var backgroundDefaultBackgroundImage: UIImageView!
    private var rawSliderObjects: NSArray = []
    var pageObjects: [TutorialPagingContent] = []
    private var meanWhilePageObjects: [TutorialPagingContent] = []
    private var pageCounter: Int = 0
    
    override func  viewDidLoad() {
        super.viewDidLoad()
     //   self.backgroundDefaultBackgroundImage.image = UIImage(named: "sliderBgdImg")
       // self.loadingGif.startAnimating()
        
        print("numero de paginas:  \(pageObjects.count)")
        if pageObjects.count > 0 {
            createPageViewController()
        }else{
            
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // MARK: -Page View Controller methods
    func pageViewController(pageViewController: UIPageViewController, viewControllerAfterViewController viewController: UIViewController) -> UIViewController? {
        self.pageCounter = pageCounter+1 < pageObjects.count ? self.pageCounter++ : 0
        return pageObjects[pageCounter]
    }
    
    func pageViewController(pageViewController: UIPageViewController, viewControllerBeforeViewController viewController: UIViewController) -> UIViewController? {
        self.pageCounter = ((pageCounter-1 < pageObjects.count)&&(pageCounter-1>0)) ? self.pageCounter-- : 0
        return pageObjects[pageCounter]
    }
    
    private func createPageViewController(){
        let pageController = self.storyboard!.instantiateViewControllerWithIdentifier("TutorialPagingController") as! UIPageViewController
        pageController.dataSource = self
        
        if rawSliderObjects.count > 0 { //this generates the array with the real content
            getAllPageItems(rawSliderObjects)
            let startingViewControllers: NSArray = []
            startingViewControllers.arrayByAddingObjectsFromArray(pageObjects)
            pageController.setViewControllers(startingViewControllers as? [UIViewController], direction: UIPageViewControllerNavigationDirection.Forward, animated: false, completion: nil)
        }
        
        pagingViewController = pageController
        addChildViewController(pagingViewController!)
        self.view.addSubview(pagingViewController!.view)
        pagingViewController!.didMoveToParentViewController(self)
    }
    
    // MARK: - Variables
    private func getAllPageItems(rawSliderObjects: NSArray){
        for item in rawSliderObjects{
            let pageItemVC = self.storyboard!.instantiateViewControllerWithIdentifier("TutorialPagingContent") as! TutorialPagingContent
            /*pageItemVC.itemIndex = item.itemIndex
            pageItemVC.imageName = item.pageObjects[itemIndex]
            
            */
            pageObjects.append(pageItemVC)
            
        }
    }*/
    
}