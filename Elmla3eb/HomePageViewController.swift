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
    
    @IBOutlet weak var sideMenuBtn: UIBarButtonItem!
    @IBOutlet weak var scrollViewHieghtOL: UIView!
    
    let imagelist = [UIImage(named:"0"),UIImage(named:"1"),UIImage(named:"2"),UIImage(named:"3")]

    
    override func viewDidLoad() {
        super.viewDidLoad()

        PromotionImageProtocoal(scrollView: aukScrollViewOL)
        self.setDelegates()
        self.setDataSource()
        self.revealMenu()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func changelangBtnAct(_ sender: UIBarButtonItem) {
        var transition: UIViewAnimationOptions = .transitionFlipFromLeft
        if L102Language.currentAppleLanguage() == "en" {
            L102Language.setAppleLAnguageTo(lang: "ar")
            UIView.appearance().semanticContentAttribute = .forceRightToLeft
        } else {
            L102Language.setAppleLAnguageTo(lang: "en")
            transition = .transitionFlipFromRight
            UIView.appearance().semanticContentAttribute = .forceLeftToRight
        }
        let rootviewcontroller: UIWindow = ((UIApplication.shared.delegate?.window)!)!
        rootviewcontroller.rootViewController = self.storyboard?.instantiateViewController(withIdentifier: "rootnav")
        let mainwindow = (UIApplication.shared.delegate?.window!)!
        mainwindow.backgroundColor = UIColor(hue: 0.6477, saturation: 0.6314, brightness: 0.6077, alpha: 0.8)
        UIView.transition(with: mainwindow, duration: 0.55001, options: transition, animations: { () -> Void in
        }) { (finished) -> Void in
            
        }
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
