//
//  ExtHomePAuk.swift
//  Elmla3eb
//
//  Created by Killvak on 12/01/2017.
//  Copyright © 2017 Killvak. All rights reserved.
//

import Foundation
import UIKit



extension HomePageViewController : UIScrollViewDelegate {
    
    func PromotionImageProtocoal(scrollView:UIScrollView) {
        
        scrollView.delegate = self
        
        for x in imagelist {
            scrollView.auk.show(image: x!)
        }
        scrollView.auk.startAutoScroll(delaySeconds: 3)
    }
    
    
    
    
    //    func scrollViewDidEndScrollingAnimation(_ scrollView: UIScrollView) {
    //        HomeAukCollectionViewHeader.theIndex = promotionScrollView.auk.currentPageIndex
    //    }
    
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        
        if scrollView == aukScrollViewOL {
            aukScrollViewOL.auk.stopAutoScroll()
            aukScrollViewOL.auk.startAutoScroll(delaySeconds: 3)
        }
    }
    
    //@Auk

}
