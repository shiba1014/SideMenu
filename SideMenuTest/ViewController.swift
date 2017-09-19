//
//  ViewController.swift
//  SideMenuTest
//
//  Created by 羽柴 彩月 on 2017/08/28.
//  Copyright © 2017年 Satsuki Hashiba. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func tappedButton(sender: UIButton!) {
        let homeVC = HomeViewController.shared
        let frontVC = UINavigationController(rootViewController: homeVC)
        let rearVC = SideMenuTableViewController()
        let swRevealVC = SWRevealViewController(rearViewController: rearVC, frontViewController: frontVC)!
        swRevealVC.toggleAnimationType = SWRevealToggleAnimationType.easeOut
        swRevealVC.toggleAnimationDuration = 0.3
        
        present(swRevealVC, animated: true, completion: nil)
    }
}

