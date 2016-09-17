//
//  MonthViewLayout.swift
//  calendar
//
//  Created by Li Shi Wei on 9/13/16.
//  Copyright © 2016 lsw. All rights reserved.
//

import UIKit

class MonthViewLayout: UICollectionViewFlowLayout {

    override func layoutAttributesForElementsInRect(rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        
        return super.layoutAttributesForElementsInRect(rect)?.map
            {
                attrs in
                let attrscp = attrs.copy() as! UICollectionViewLayoutAttributes
                self.applyLayoutAttributes(attrscp)
                return attrscp
        }
        
    }
    
    override func layoutAttributesForItemAtIndexPath(indexPath: NSIndexPath) -> UICollectionViewLayoutAttributes? {
        
        if let attrs = super.layoutAttributesForItemAtIndexPath(indexPath)
        {
            let attrscp = attrs.copy() as! UICollectionViewLayoutAttributes
            self.applyLayoutAttributes(attrscp)
            return attrscp
        }
        return nil
        
    }
    
    func applyLayoutAttributes(attributes : UICollectionViewLayoutAttributes) {
        
        if attributes.representedElementKind != nil {
            return
        }
        
        if let collectionView = self.collectionView {
            
            //let direction = ApplicationResource.sharedInstance.getMonthViewRotateDirection()
            
            let stride = (self.scrollDirection == .Horizontal) ? collectionView.frame.size.width : collectionView.frame.size.height
            
            let offset = CGFloat(attributes.indexPath.section) * stride
            
            var xCellOffset : CGFloat = CGFloat(attributes.indexPath.item % 7) * (self.itemSize.width)
            
            var yCellOffset : CGFloat = CGFloat(attributes.indexPath.item / 7) * (self.itemSize.height)
            
            if(self.scrollDirection == .Horizontal) {
                xCellOffset += offset;
            } else {
                yCellOffset += offset
            }
            
            attributes.frame = CGRectMake(xCellOffset, yCellOffset, self.itemSize.width, self.itemSize.height)
        }
        
    }

}
