//
//  DIYLayout.swift
//  DIY
//
//  Created by MTQ on 6/26/20.
//  Copyright © 2020 Razeware LLC. All rights reserved.
//

import UIKit

class DIYLayoutAttributes: UICollectionViewLayoutAttributes {
    
    var deltaY: CGFloat = 0
    
    override func copy(with zone: NSZone? = nil) -> Any {
        let copy = super.copy(with: zone) as! DIYLayoutAttributes
        copy.deltaY = deltaY
        return copy
    }
    
    override func isEqual(_ object: Any?) -> Bool {
        if let attributes = object as? DIYLayoutAttributes {
            if attributes.deltaY == deltaY {
                return super.isEqual(object)
            }
        }
        return false
    }
}

// UICollectionViewLayout no support for headers or footers
class DIYLayout: UICollectionViewFlowLayout {
    
    override class var layoutAttributesClass: AnyClass {
        return DIYLayoutAttributes.self
    }
    
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        let layoutAttributes = super.layoutAttributesForElements(in: rect) as! [DIYLayoutAttributes]
        
        let insets = collectionView!.contentInset
        let offset = collectionView!.contentOffset
        
        let minY = -insets.top
        // Vì là UICollectionViewController nên offset luôn = -heightStatusBar (20)
        if offset.y < minY {
            let deltaY = abs(offset.y - minY)
            for attributes in layoutAttributes {
                if let elementKind = attributes.representedElementKind {
                    if elementKind == UICollectionView.elementKindSectionHeader {
                        var frame = attributes.frame
                        frame.size.height = max(minY, headerReferenceSize.height + deltaY)
                        // Comment dòng dưới sẽ hiểu vì sao cần update origin
                        frame.origin.y = frame.minY - deltaY
                        
                        attributes.frame = frame
                        attributes.deltaY = deltaY
                    }
                }
            }
        }
        
        return layoutAttributes
    }
    
    override func shouldInvalidateLayout(forBoundsChange newBounds: CGRect) -> Bool {
        return true
    }
}
