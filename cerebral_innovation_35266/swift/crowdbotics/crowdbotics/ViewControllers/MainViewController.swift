//
//  MainViewController.swift
//  Foodcolors
//
//  Created by kamyFCMacBook on 10/25/16.
//  Copyright © 2016 kamyFCMacBook. All rights reserved.
//

import Foundation
import UIKit
import SideMenu

class MainViewController: UIViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Define the menus
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let leftViewController = storyboard.instantiateViewController(withIdentifier: "LeftViewController") as! LeftViewController
        let menuLeftNavigationController = UISideMenuNavigationController(rootViewController: leftViewController)
        let appScreenRect = UIApplication.shared.keyWindow?.bounds ?? UIWindow().bounds
        menuLeftNavigationController.menuWidth = max(round(min((appScreenRect.width), (appScreenRect.height)) * 0.15), 240)
        // UISideMenuNavigationController is a subclass of UINavigationController, so do any additional configuration
        // of it here like setting its viewControllers. If you're using storyboards, you'll want to do something like:
        // let menuLeftNavigationController = storyboard!.instantiateViewController(withIdentifier: "LeftMenuNavigationController") as! UISideMenuNavigationController
        SideMenuManager.default.menuLeftNavigationController = menuLeftNavigationController
        // Enable gestures. The left and/or right menus must be set up above for these to work.
        // Note that these continue to work on the Navigation Controller independent of the view controller it displays!
        // SideMenuManager.default.menuAddPanGestureToPresent(toView: self.navigationController!.navigationBar)
        //SideMenuManager.default.menuAddScreenEdgePanGesturesToPresent(toView: self.navigationController!.view)
        
        self.addMenuItem()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        // Hide the navigation bar on the this view controller
        //self.navigationController?.setNavigationBarHidden(true, animated: true)
        
        super.viewWillAppear(animated)

    }
    
    override func viewWillDisappear(_ animated: Bool) {
        // Show the navigation bar on other view controllers
        //self.navigationController?.setNavigationBarHidden(false, animated: true)
        
        super.viewWillDisappear(animated)
    }
    
    @objc func openLeftView()
    {
        present(SideMenuManager.default.menuLeftNavigationController!, animated: true, completion: nil)
    }
    
    func addMenuItem()
    {
        let btnName = UIButton()
        btnName.setImage(UIImage(named: "menu"), for: .normal)
        let rect = CGRect(x: 0, y: 0, width: 30, height: 30)
        btnName.frame = rect
        btnName.addTarget(self, action: #selector(self.openLeftView), for: .touchUpInside)
        
        let barButton = UIBarButtonItem(customView: btnName)
        self.navigationItem.leftBarButtonItem = barButton
    }
    

}




