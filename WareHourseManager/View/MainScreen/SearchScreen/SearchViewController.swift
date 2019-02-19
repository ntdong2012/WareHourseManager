//
//  SearchViewController.swift
//  WareHourseManager
//
//  Created by Dong Nguyen Thanh on 2/11/19.
//  Copyright © 2019 Dong Nguyen Thanh. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController {

    var apiCode : String!
    var apiType : String!
    var apiSP : String!
    var apiTitle : String!
    var username : String!
    var apiKey : String = ""
    var ma_ca : String!
    var ma_dvcs : String!
    
    @IBOutlet var addButton : UIButton!
    
    
    @IBAction func addButtonClick(_ sender: UIButton){
    
        let transferViewController = TransferViewController()
        transferViewController.titleName = self.apiTitle
        transferViewController.apiCode = self.apiCode
        transferViewController.apiType = self.apiType
        transferViewController.apiSP = self.apiSP
        transferViewController.apiKey = self.apiKey
        transferViewController.username = self.username
        transferViewController.ma_ca = self.ma_ca
        transferViewController.ma_dvcs = self.ma_dvcs
        self.navigationController!.pushViewController(transferViewController, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationController?.isNavigationBarHidden = false
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        self.title = "Tìm kiếm đơn hàng"
    }
    
    override func viewDidAppear(_ animated: Bool) {
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        self.title = "Tìm kiếm đơn hàng"
        print("Api code: " + self.apiCode)
    }
    
    
    
    func addBackButton() {
        let backButton = UIButton(type: .custom)
        backButton.setImage(UIImage(named: "BackButton.png"), for: .normal) // Image can be downloaded from here below link
        backButton.setTitle("Back", for: .normal)
        backButton.setTitleColor(backButton.tintColor, for: .normal) // You can change the TitleColor
        backButton.addTarget(self, action: #selector(self.backAction(_:)), for: .touchUpInside)
        
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: backButton)
    }
    
    @IBAction func backAction(_ sender: UIButton) {
        let _ = self.navigationController?.popViewController(animated: true)
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
