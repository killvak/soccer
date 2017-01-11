//
//  CVPlayFieldViewController.swift
//  Elmla3eb
//
//  Created by Killvak on 11/01/2017.
//  Copyright © 2017 Killvak. All rights reserved.
//

import Foundation
import UIKit
extension PlayFieldViewController : UICollectionViewDelegate , UICollectionViewDataSource {
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 7
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DaysCVCell", for: indexPath)
        
        return cell
    }
    
    
}
