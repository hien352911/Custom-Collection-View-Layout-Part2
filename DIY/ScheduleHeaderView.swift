//
//  ScheduleHeaderView.swift
//  RWDevCon
//
//  Created by Mic Pringle on 06/03/2015.
//  Copyright (c) 2015 Ray Wenderlich. All rights reserved.
//

import UIKit

class ScheduleHeaderView: UICollectionReusableView {
  
  @IBOutlet private weak var backgroundImageView: UIView!
    @IBOutlet private weak var backgroundImageViewHeightLayoutConstraint: NSLayoutConstraint!
  @IBOutlet private weak var foregroundImageView: UIView!
  
    private var backgroundImageViewHeight: CGFloat = 0
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        backgroundImageViewHeight = backgroundImageView.bounds.height
    }
    
    override func apply(_ layoutAttributes: UICollectionViewLayoutAttributes) {
        super.apply(layoutAttributes)
        
        let attributes = layoutAttributes as! DIYLayoutAttributes
        backgroundImageViewHeightLayoutConstraint.constant = backgroundImageViewHeight - attributes.deltaY
    }
}
