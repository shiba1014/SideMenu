//
//  SideMenuTableViewController.swift
//  SideMenuTest
//
//  Created by 羽柴 彩月 on 2017/08/28.
//  Copyright © 2017年 Satsuki Hashiba. All rights reserved.
//

import UIKit

class SideMenuTableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    fileprivate var tableView: UITableView = UITableView()
    fileprivate var controllers = [HomeViewController.shared, SettingsViewController.shared]
    fileprivate var previousIndex = IndexPath(row: 0, section: 0)
    override var prefersStatusBarHidden: Bool {
        return true
    }
    override var preferredStatusBarUpdateAnimation: UIStatusBarAnimation {
        return .slide
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView = .init(frame: UIScreen.main.bounds, style: .grouped)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        self.view.addSubview(tableView)
        
        UIApplication.shared.isStatusBarHidden = true
        self.revealViewController().setNeedsStatusBarAppearanceUpdate()
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return controllers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "cell")!
        cell.textLabel?.text = getViewControllerName(vc: controllers[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        if indexPath != previousIndex {
            let frontVC = UINavigationController(rootViewController: controllers[indexPath.row])
            self.revealViewController().pushFrontViewController(frontVC, animated: true)
        }
        
        self.revealViewController().revealToggle(animated: true)
        previousIndex = indexPath
    }
    
    func getViewControllerName(vc: UIViewController) -> String {
        var className = NSStringFromClass(vc.classForCoder).components(separatedBy: ".").last!
        
        if let range = className.range(of: "ViewController") {
            className.removeSubrange(range)
        }
        
        return className
    }
}
