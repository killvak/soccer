//
//  HomePageViewController.swift
//  Elmla3eb
//
//  Created by Killvak on 12/01/2017.
//  Copyright © 2017 Killvak. All rights reserved.
//

import UIKit

class HomePageViewController: UIViewController {

    @IBOutlet weak var aukScrollViewOL: UIScrollView!
    @IBOutlet weak var collectionViewCitiesFields: UICollectionView!
    @IBOutlet weak var collectionViewBooked: UICollectionView!
    @IBOutlet weak var collectionViewRecentAdded: UICollectionView!
    
    @IBOutlet weak var scrollViewHieghtOL: UIView!
    
    let imagelist = [UIImage(named:"0"),UIImage(named:"1"),UIImage(named:"2"),UIImage(named:"3")]

    
    override func viewDidLoad() {
        super.viewDidLoad()

        PromotionImageProtocoal(scrollView: aukScrollViewOL)
        self.setDelegates()
        self.setDataSource()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
