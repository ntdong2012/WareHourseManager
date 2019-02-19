//
//  MainViewController.swift
//  WareHourseManager
//
//  Created by Dong Nguyen Thanh on 1/7/19.
//  Copyright © 2019 Dong Nguyen Thanh. All rights reserved.
//

import UIKit

class MainViewController: UITabBarController {
    
    var apiKey : String!
    var username : String!
    var ma_ca : String!
    var ma_dvcs : String!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = true
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        print("API KEY: "  + apiKey)
        print("USERNAME: " + username)
        let firstViewController = CoKhiViewController()
        firstViewController.apiKey = self.apiKey
        firstViewController.username = self.username
        firstViewController.ma_ca = self.ma_ca
        firstViewController.ma_dvcs = self.ma_dvcs
        firstViewController.tabBarItem = UITabBarItem(title: "CƠ KHÍ", image: nil, tag: 0)
        firstViewController.tabBarItem.titlePositionAdjustment = UIOffset(horizontal:0, vertical:-10)
        
        let secondViewController = MaKemViewController()
        secondViewController.apiKey = self.apiKey
        secondViewController.username = self.username
        secondViewController.ma_ca = self.ma_ca
        secondViewController.ma_dvcs = self.ma_dvcs
        secondViewController.tabBarItem = UITabBarItem(title: "MẠ KẼM",image: nil, tag: 1)
        secondViewController.tabBarItem.titlePositionAdjustment = UIOffset(horizontal:0, vertical:-10)
        
        let thirdViewController = DongKienViewController()
        thirdViewController.apiKey = self.apiKey
        thirdViewController.username = self.username
        thirdViewController.ma_ca = self.ma_ca
        thirdViewController.ma_dvcs = self.ma_dvcs
        thirdViewController.tabBarItem = UITabBarItem(title: "ĐÓNG KIỆN",image: nil, tag: 1)
        thirdViewController.tabBarItem.titlePositionAdjustment = UIOffset(horizontal:0, vertical:-10)
        
        let fourViewController = KiemTraViewController()
        fourViewController.apiKey = self.apiKey
        fourViewController.username = self.username
        fourViewController.ma_ca = self.ma_ca
        fourViewController.ma_dvcs = self.ma_dvcs
        fourViewController.tabBarItem = UITabBarItem(title: "KIỂM TRA",image: nil, tag: 1)
        fourViewController.tabBarItem.titlePositionAdjustment = UIOffset(horizontal:0, vertical:-10)
        
        let tabBarList = [firstViewController, secondViewController, thirdViewController, fourViewController]
        
        viewControllers = tabBarList
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = true
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
