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
        return UIStatusBarStyle.lightContent
    }
    
  override func viewDidLoad() {
    super.viewDidLoad()
    
    let width = collectionView!.bounds.width
    let layout = collectionViewLayout as! UICollectionViewFlowLayout
    layout.itemSize = CGSize(width: width, height: 62)
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
