//
//  ExtHPCollectionDelegate.swift
//  Elmla3eb
//
//  Created by Killvak on 12/01/2017.
//  Copyright © 2017 Killvak. All rights reserved.
//

import Foundation
import UIKit


extension HomePageViewController : UICollectionViewDelegate , UICollectionViewDelegateFlowLayout {
    
    func setDelegates() {
        self.collectionViewCitiesFields.delegate = self
        self.collectionViewBooked.delegate = self
        self.collectionViewRecentAdded.delegate = self
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        switch collectionView {
        case collectionViewCitiesFields:
            print("1" + "that is the select path for row : \(indexPath.row)")
        case collectionViewBooked:
            print("2" + "that is the select path for row : \(indexPath.row)")
        case collectionViewRecentAdded:
            print("3" + "that is the select path for row : \(indexPath.row)")
        default:
            print("error picking collectionView in didSelectItemAt")
        }
        let x = self.storyboard?.instantiateViewController(withIdentifier: "PlayFieldViewController") as! PlayFieldViewController
        navigationController?.pushViewController(x, animated: true)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
            let x =  collectionView.frame.height * 0.98
        
            return CGSize(width: x + 15, height: x) // The size of one cell
        
    }
    
    
}
