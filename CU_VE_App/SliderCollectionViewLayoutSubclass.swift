//
//  SliderCollectionViewLayoutSubclass.swift
//  CU_VE_App
//
//  Created by Leonardo Puga De Biase on 2/2/16.
//  Copyright © 2016 LJPDB. All rights reserved.
//

import UIKit

class SliderCollectionViewLayoutSubclass: UICollectionViewFlowLayout {
   
    override func targetContentOffsetForProposedContentOffset(proposedContentOffset: CGPoint, withScrollingVelocity velocity: CGPoint) -> CGPoint {
        
        if let cv = self.collectionView {
            let cvBounds = cv.bounds
            let halfWidth = cvBounds.size.width * 0.5;
            let proposedContentOffsetCenterX = proposedContentOffset.x + halfWidth;
            
            if let attributesForVisibleCells = self.layoutAttributesForElementsInRect(cvBounds) as [UICollectionViewLayoutAttributes]! {
                
                var candidateAttributes : UICollectionViewLayoutAttributes?
                for attributes in attributesForVisibleCells {
                    
                    // == Skip comparison with non-cell items (headers and footers) == //
                    if attributes.representedElementCategory != UICollectionElementCategory.Cell {
                        continue
                    }
                    
                    if let candAttrs = candidateAttributes {
                        let a = attributes.center.x - proposedContentOffsetCenterX
                        let b = candAttrs.center.x - proposedContentOffsetCenterX
                        
                        if fabsf(Float(a)) < fabsf(Float(b)) {
                            candidateAttributes = attributes;
                        }
                    }
                    else { // == First time in the loop == //
                        candidateAttributes = attributes;
                        continue;
                    }
                }
                return CGPoint(x: round(candidateAttributes!.center.x - halfWidth), y: proposedContentOffset.y)
            }
        }
        // Fallback
        return super.targetContentOffsetForProposedContentOffset(proposedContentOffset)
    }


}
