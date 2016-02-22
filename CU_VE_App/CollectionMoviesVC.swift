//
//  CollectionVC.swift
//  CU_VE_App
//
//  Created by Leonardo Puga De Biase on 1/23/16.
//  Copyright © 2016 LJPDB. All rights reserved.
//

import UIKit

protocol centerCollectionProtocolDelegate{
    func getToMovieDetails(centerCollectionVC:CollectionMoviesVC)
}

class CollectionMoviesVC : UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    
    @IBOutlet weak var collectionViewSourceElement: UICollectionView!
    var delegate:centerCollectionProtocolDelegate?
    
    private var leftAndRightPaddings : CGFloat = 1.0
    private var numberOfItemsRow : CGFloat = 2.0
    private var heightAdjustment : CGFloat = 50.0
    var collectionViewItemsArray : [AnyObject]?
    var doWeHaveData : Bool = false
    var testSegueVar:String = "" {
        didSet {
            testVarSetting(testSegueVar)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if collectionViewItemsArray?.count > 0{
        
        }else{
            
        }
       /* let containerWidth = (CGRectGetWidth(self.collectionViewSourceElement.frame) - self.leftAndRightPaddings) / 2
        let containerHeight = (CGRectGetHeight(self.collectionViewSourceElement.frame) - self.leftAndRightPaddings) / 2
       // let width = (CGRectGetWidth(containerWidth / numberOfItemsRow))
        let layout = self.collectionViewSourceElement.collectionViewLayout as! UICollectionViewFlowLayout
        layout.itemSize = CGSizeMake(containerWidth, containerHeight)  */
    }
    
    func testVarSetting(varX: String){
        MeaningAndFormValidation.printMessageWithText("Fucking A! it works!: \(varX)", className: String(self))
    }
    
    
    // MARK: - Collection View Methods
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 2
    }
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell : UICollectionViewCell = collectionView.dequeueReusableCellWithReuseIdentifier("simpleCell", forIndexPath: indexPath)
        if !doWeHaveData {
            let loadingGif : UIActivityIndicatorView = cell.viewWithTag(3) as! UIActivityIndicatorView
            loadingGif.startAnimating()
        }else{
        
        }
        return cell
    }
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        // do something when select an collection cell
        self.delegate?.getToMovieDetails(self)
    }
    
    
    
    // MARK: - CollectionViewDelegateFlowOut methods
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        var customItemSize : CGSize = self.view.frame.size
        let getDeviceProportions : [CGFloat] = MeaningAndFormValidation.getProportionsDependingOnDeviceType()
        customItemSize = CGSize(width: (customItemSize.width - 2)/getDeviceProportions[0], height: (customItemSize.height - 2)/getDeviceProportions[1])
        return customItemSize
    }
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAtIndex section: Int) -> CGFloat {
        return 0.2
    }
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAtIndex section: Int) -> CGFloat {
        return 0.4
    }
    
    func collectionView(collectionView: UICollectionView, willDisplayCell cell: UICollectionViewCell, forItemAtIndexPath indexPath: NSIndexPath) {
    /*    if self.collectionViewSourceElement.{
        
        }else{
        
        }  */
    }
    
    func collectionView(collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        insetForSectionAtIndex section: Int) -> UIEdgeInsets {
            return UIEdgeInsetsMake(0, 0, 0, 0)
    }
    
}






