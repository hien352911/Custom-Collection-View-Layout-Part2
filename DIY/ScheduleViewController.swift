//
//  ScheduleViewController.swift
//  RWDevCon
//
//  Created by Mic Pringle on 06/03/2015.
//  Copyright (c) 2015 Ray Wenderlich. All rights reserved.
//

import UIKit

class ScheduleViewController: UICollectionViewController {
  
  let sessions = Session.allSessions()
  
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return UIStatusBarStyle.default
    }
    
  override func viewDidLoad() {
    super.viewDidLoad()
    
    let width = collectionView!.bounds.width
    let layout = DIYLayout()
    layout.headerReferenceSize = CGSize(width: width, height: 180)
    layout.itemSize = CGSize(width: width, height: 62)
    layout.maximumStretchHeight = width
    collectionView.collectionViewLayout = layout
    
    collectionView!.contentInset = UIEdgeInsets(top: 20, left: 0, bottom: 0, right: 0)
  }
  
}

extension ScheduleViewController {
  
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return sessions.count
  }
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "ScheduleHeader", for: indexPath) as! ScheduleHeaderView
        return header
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ScheduleCell", for: indexPath) as! ScheduleCell
        cell.session = sessions[indexPath.item]
        return cell
    }
  
}
