//
//  ExtRevealSieMenu.swift
//  Elmla3eb
//
//  Created by Killvak on 15/01/2017.
//  Copyright © 2017 Killvak. All rights reserved.
//

import Foundation

extension HomePageViewController : SWRevealViewControllerDelegate {
    
    
    
    func revealMenu() {
        if L102Language.currentAppleLanguage() == "en" {
            
            if self.revealViewController() != nil {
                sideMenuBtn.target = self.revealViewController()
                sideMenuBtn.action = #selector(SWRevealViewController.revealToggle(_:))
                self.revealViewController().rearViewRevealWidth = self.view.frame.width * 0.75
                self.revealViewController().rightViewController.beginAppearanceTransition(false, animated: false)
                self.revealViewController().rightViewRevealOverdraw = 0.00
                self.revealViewController().rightViewRevealWidth = 0.00
                
                revealViewController().delegate = self
                revealViewController().tapGestureRecognizer()
                revealViewController().panGestureRecognizer()
            }
        } else {
            if self.revealViewController() != nil {
                sideMenuBtn.target = self.revealViewController()
                sideMenuBtn.action = #selector(SWRevealViewController.rightRevealToggle(_:))
                self.revealViewController().rightViewRevealWidth = self.view.frame.width * 0.75
                self.revealViewController().rearViewController.beginAppearanceTransition(false, animated: false)
                self.revealViewController().rearViewRevealOverdraw = 0.00
                self.revealViewController().rearViewRevealWidth = 0.00
                
                revealViewController().delegate = self
                revealViewController().tapGestureRecognizer()
                revealViewController().panGestureRecognizer()
            }
        }
    }
    
    func revealController(_ revealController: SWRevealViewController!, willMoveTo position: FrontViewPosition) {
        if L102Language.currentAppleLanguage() == "en" {
            if position == FrontViewPosition.right {
                revealController.frontViewController.view.isUserInteractionEnabled = false
                
            }
            else {
                revealController.frontViewController.view.isUserInteractionEnabled = true
                
            }
        }else {
            if position == FrontViewPosition.left {
                revealController.frontViewController.view.isUserInteractionEnabled = true
                
            }
            else {
                revealController.frontViewController.view.isUserInteractionEnabled = false
                
            }
        }
    }
    
    
}
