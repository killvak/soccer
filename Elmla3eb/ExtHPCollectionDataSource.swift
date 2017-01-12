//
//  ExtHPCollectionDataSource.swift
//  Elmla3eb
//
//  Created by Killvak on 12/01/2017.
//  Copyright © 2017 Killvak. All rights reserved.
//

import Foundation
import UIKit


extension HomePageViewController : UICollectionViewDataSource {
    
    func setDataSource() {
        self.collectionViewCitiesFields.dataSource = self
        self.collectionViewBooked.dataSource = self
        self.collectionViewRecentAdded.dataSource = self
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 9
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        var cell = UICollectionViewCell()

        switch collectionView {
        case collectionViewCitiesFields:
             cell = collectionViewCitiesFields.dequeueReusableCell(withReuseIdentifier: "Cell1", for: indexPath) as! CitiesAndFieldsCollectionViewCell
            break
        case collectionViewBooked:
             cell = collectionViewBooked.dequeueReusableCell(withReuseIdentifier: "Cell2", for: indexPath) as! MostBookedCollectionViewCell
            break
        case collectionViewRecentAdded:
             cell = collectionViewRecentAdded.dequeueReusableCell(withReuseIdentifier: "Cell3", for: indexPath) as! RecentAddedFieldsCollectionViewCell
            break
        default:
            print("error picking collectionView in cellForItemAt")
             cell = UICollectionViewCell()
            break
        }
        return cell
    }
    
    
    
}
