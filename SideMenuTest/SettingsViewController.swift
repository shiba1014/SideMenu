//
//  SettingsViewController.swift
//  SideMenuTest
//
//  Created by 羽柴 彩月 on 2017/08/28.
//  Copyright © 2017年 Satsuki Hashiba. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
    static let shared = SettingsViewController()
    
    private init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        UIApplication.shared.isStatusBarHidden = true
        self.title = "Setting"
        
        let uiBarButtonItem: UIBarButtonItem = UIBarButtonItem(title: "Menu", style: .plain, target: self, action: nil)
        self.navigationItem.setLeftBarButton(uiBarButtonItem, animated: true)
        
        if self.revealViewController() != nil {
            uiBarButtonItem.target = self.revealViewController()
            uiBarButtonItem.action = #selector(SWRevealViewController.revealToggle(_:))
            self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
            self.revealViewController().tapGestureRecognizer()
        }
        
        self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
    }
}
