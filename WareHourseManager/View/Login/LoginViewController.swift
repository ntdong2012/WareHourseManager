//
//  LoginViewControllerTableViewController.swift
//  WareHourseManager
//
//  Created by Dong Nguyen Thanh on 12/28/18.
//  Copyright © 2018 Dong Nguyen Thanh. All rights reserved.
//

import UIKit
import DropDown
import Foundation


class LoginViewController: UITableViewController, OptionButtonsDelegate,  UITextFieldDelegate {
    
    var listShift:[ShiftModel] = []
    var listCompany : [CompanyModel] = []
    
    func loginBtnClick(at index: IndexPath) {
        print("button tapped at index:\(index)")
        let  username = (tableView.cellForRow(at: IndexPath(row: 1, section: 0)) as! InputViewCell).inputTextField.text;
        let  password = (tableView.cellForRow(at: IndexPath(row: 2, section: 0)) as! InputViewCell).inputTextField.text;
        print ("username : " + username! + " password: "  + password!)
        let ma_ca = (tableView.cellForRow(at: IndexPath(row:3, section:0)) as! LabelTableViewCell).label.text;
        let ma_com = (tableView.cellForRow(at: IndexPath(row:4, section:0)) as! LabelTableViewCell).label.text;
        
        print ("username : " + username! + " password: "  + password! + " ma_ca: " + ma_ca! + " ma_cty: " + ma_com!)
        let macaArr = ma_ca?.components(separatedBy: " - ");
        let macomArr = ma_com?.components(separatedBy: " - ");
        print ("username : " + username! + " password: "  + password! + " ma_ca: " + macaArr![0] + " ma_cty: " + macomArr![0])
        
        if(username == nil || username?.count == 0){
            Toast.showNegativeMessage(message: "Xin nhập tài khoản")
            return
        }
        if(password == nil || password?.count == 0){
            Toast.showNegativeMessage(message: "Xin nhập mật khẩu")
            return
        }
        if(macaArr?.count == 0){
            Toast.showNegativeMessage(message: "Không kết nối được đến server")
            return
        }
        if(macomArr?.count == 0){
            Toast.showNegativeMessage(message: "Không kết nối được đến server")
            return
        }
        NetworkUtil.shared.login(username: username!, password: password!, ma_ca: macaArr![0], ma_com: macomArr![0], success: { (loginRp) in
            print("login success" + loginRp)
            if(loginRp.count > 0) {
                Toast.showPositiveMessage(message: "Đăng nhập thành công")
                let mainViewController = MainViewController()
                mainViewController.apiKey  = loginRp
                mainViewController.username = username
                mainViewController.ma_ca = macaArr![0]
                mainViewController.ma_dvcs = macomArr![0]
                
                self.navigationController!.pushViewController(mainViewController, animated: true)
            } else {
                Toast.showNegativeMessage(message: "Đăng nhập thất bại")
            }
        }, failure: {
            Toast.showPositiveMessage(message: "Đăng nhập thất bại")
        })
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.setNavigationBarHidden(true, animated: true)
        NetworkUtil.shared.getShifts(success: { dataRs in do
            {
                print("emdeplam " + dataRs[0].ten_ca)
                self.listShift = dataRs
                self.tableView.reloadData()
                print("em dep vua vua: " + self.listShift[0].ten_ca)
            }
        }){_ in 
            
        }
        
        NetworkUtil.shared.getCompanys(success: { dataRs in do
        {

            self.listCompany = dataRs;
            self.tableView.reloadData()
            print("em dep vai dai : " + self.listCompany[0].ten_dvcs)
        }
        }){ _ in
        
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 6
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if(indexPath.row == 0){
        let identifier = "LogoTableViewCell"
            var cell: LogoTableViewCell! = tableView.dequeueReusableCell(withIdentifier: identifier) as? LogoTableViewCell
            if cell == nil {
                tableView.register(UINib(nibName: "LogoTableViewCell", bundle: nil), forCellReuseIdentifier: identifier)
                cell = tableView.dequeueReusableCell(withIdentifier: identifier) as? LogoTableViewCell
            }
            return cell;
            
        } else if (indexPath.row == 1) {
            let identifier = "InputViewCell"
            var cell: InputViewCell! = tableView.dequeueReusableCell(withIdentifier: identifier) as? InputViewCell
            if cell == nil {
                tableView.register(UINib(nibName: "InputViewCell", bundle: nil), forCellReuseIdentifier: identifier)
                cell = tableView.dequeueReusableCell(withIdentifier: identifier) as? InputViewCell
            }
            (cell as InputViewCell).setBoder()
            return cell;
        } else if(indexPath.row == 2){
            let identifier = "InputViewCell"
            var cell: InputViewCell! = tableView.dequeueReusableCell(withIdentifier: identifier) as? InputViewCell
            if cell == nil {
                tableView.register(UINib(nibName: "InputViewCell", bundle: nil), forCellReuseIdentifier: identifier)
                cell = tableView.dequeueReusableCell(withIdentifier: identifier) as? InputViewCell
            }
            (cell as InputViewCell).setPlaceHolder(placeholder: "Mật khẩu")
            (cell as InputViewCell).setBoder()
            
            return cell;
        } else if(indexPath.row == 3){
            let identifier = "LabelTableViewCell"
            var cell: LabelTableViewCell! = tableView.dequeueReusableCell(withIdentifier: identifier) as? LabelTableViewCell
            if cell == nil {
                tableView.register(UINib(nibName: "LabelTableViewCell", bundle: nil), forCellReuseIdentifier: identifier)
                cell = tableView.dequeueReusableCell(withIdentifier: identifier) as? LabelTableViewCell
            }
            cell.label.tag = 3;
            if(listShift.count>0){
                cell.setText(listShift[0].ma_ca + " - " + listShift[0].ten_ca)
            }
            
            cell.showShiftDialog(listShift)
            return cell;
        } else if(indexPath.row == 4){
            let identifier = "LabelTableViewCell"
            var cell: LabelTableViewCell! = tableView.dequeueReusableCell(withIdentifier: identifier) as? LabelTableViewCell
            if cell == nil {
                tableView.register(UINib(nibName: "LabelTableViewCell", bundle: nil), forCellReuseIdentifier: identifier)
                cell = tableView.dequeueReusableCell(withIdentifier: identifier) as? LabelTableViewCell
            }
            
            cell.label.tag = 4;
            if(listCompany.count>0){
                cell.setText(listCompany[0].ma_dvcs + " - " + listCompany[0].ten_dvcs)
            }
            
            cell.showCompanyDialog(listCompany)
            return cell;
        } else {
            let identifier = "ButtonViewCell"
            var cell: ButtonViewCell! = tableView.dequeueReusableCell(withIdentifier: identifier) as? ButtonViewCell
            if cell == nil {
                tableView.register(UINib(nibName: "ButtonViewCell", bundle: nil), forCellReuseIdentifier: identifier)
                cell = tableView.dequeueReusableCell(withIdentifier: identifier) as? ButtonViewCell
            }
            cell.delegate = self
            cell.indexPath = indexPath

            return cell;
        }
        
    
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        if indexPath.row == 0 {
                return 150;
        }
        return 44;
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
}
extension UIViewController {
    
    func showToast(message : String) {
        
        let toastLabel = UILabel(frame: CGRect(x: self.view.frame.size.width/2 - 75, y: self.view.frame.size.height-100, width: 150, height: 35))
        toastLabel.backgroundColor = UIColor.black.withAlphaComponent(0.6)
        toastLabel.textColor = UIColor.white
        toastLabel.textAlignment = .center;
        toastLabel.font = UIFont(name: "Montserrat-Light", size: 12.0)
        toastLabel.text = message
        toastLabel.alpha = 1.0
        toastLabel.layer.cornerRadius = 10;
        toastLabel.clipsToBounds  =  true
        self.view.addSubview(toastLabel)
        UIView.animate(withDuration: 4.0, delay: 0.1, options: .curveEaseOut, animations: {
            toastLabel.alpha = 0.0
        }, completion: {(isCompleted) in
            toastLabel.removeFromSuperview()
        })
    } }
