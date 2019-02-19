//
//  TransferViewController.swift
//  WareHourseManager
//
//  Created by Dong Nguyen Thanh on 2/11/19.
//  Copyright © 2019 Dong Nguyen Thanh. All rights reserved.
//

import UIKit
import BarcodeScanner

class TransferViewController: UIViewController, BarcodeScannerCodeDelegate, BarcodeScannerErrorDelegate, BarcodeScannerDismissalDelegate, UITableViewDataSource, UITableViewDelegate {
    
    var apiCode : String!
    var apiType : String!
    var apiSP   : String!
    var titleName   : String!
    var apiKey : String!
    var username : String!
    var ma_ca : String!
    var ma_dvcs : String!
    
    @IBOutlet var saveCTBtn : UIButton!
    @IBOutlet var tableView : UITableView!
    
    var listDept:[DeptModel] = []
    var listUser:[UserModel] = []
    var listVattu:[VattuModel] = []
    
    var listDeptStr : [String] = []
    var listUserStr : [String] = []
    var currBarCodeObj : BarcodeModel!
    
    override func viewDidAppear(_ animated: Bool) {
        self.title = titleName
        print("apiCode" + apiCode + " apiKey: " + apiKey + " apiSP" + apiSP)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func findSelectedUserId() -> Int32 {
        let hummandCell = (tableView.cellForRow(at: IndexPath(row: 0, section: 0)) as! TransferItemTableViewCell)
        var hummmandStr = hummandCell.getCurrentLabelContent()
        if(hummmandStr.count == 0){
            hummmandStr = username
        }
        for i in 0 ..< listUser.count {
            if(hummmandStr.lowercased() == listUser[i].user_name.lowercased()){
                return listUser[i].user_id
            }
        }

        return 0
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if(apiType == "DC"){
            if(indexPath.row == 0){
                return 0
            }
        }
        if(isHiddenDeptSend()){
            if(indexPath.row == 1){
                return 0
            }
        }
        return 40
    }
    
    func isChangeReceiveDeptReceiveLabelSend() -> Bool {
        if(apiCode == "51" && apiType == "IS" && apiSP == "NVL"){
            return true
        }
        if(apiCode == "52" && apiType == "IS" && apiSP == "SP"){
            return true
        }
        if(apiCode == "15" && apiType == "IR" && apiSP == "SP"){
            return true
        }
        if(apiCode == "61" && apiType == "IS" && apiSP == "NVL"){
            return true
        }
        if(apiCode == "62" && apiType == "IS" && apiSP == "SP"){
            return true
        }
        return false
    }
    
    
    func isChangeReceiveHumandLabel() -> Bool {
        if((apiCode == "02" || apiCode == "04" || apiCode == "14") && (apiType == "IR" || apiType == "SP")){
            return true;
        }
        if(apiCode == "03" && apiType == "IR" && apiSP == "SP"){
            return true
        }
        if(apiCode == "52" && apiType == "IS" && apiSP == "SP"){
            return true
        }
        if(apiCode == "01" && apiType == "IR" && apiSP == "SP"){
            return true
        }
        if(apiCode == "10" && apiType == "IR" && apiSP == "SP"){
            return true
        }
        if(apiCode == "13" && apiType == "IR" && apiSP == "SP"){
            return true
        }
        if(apiCode == "15" && apiType == "IR" && apiSP == "SP"){
            return true
        }
        if(apiCode == "61" && apiType == "IS" && apiSP == "NVL"){
            return true
        }
        if(apiCode == "62" && apiType == "IS" && apiSP == "SP"){
            return true
        }
        if(apiCode == "14" && apiType == "IR" && apiSP == "SP"){
            return true
        }
        if(apiCode == "19" && apiType == "IR" && apiSP == "SP"){
            return true
        }
        if(apiCode == "71" && apiType == "IS" && apiSP == "NVL"){
            return true
        }
        return false
    }
    
    func isHiddenDeptSend() -> Bool {
        if((apiCode == "02" || apiCode == "04" || apiCode == "14") && (apiType == "IR" || apiType == "SP")){
            return true;
        }
        if(apiCode == "03" && apiType == "IR" && apiSP == "SP"){
            return true
        }
        
        if(apiCode == "01" && apiType == "IR" && apiSP == "SP"){
            return true
        }
        if(apiCode == "10" && apiType == "IR" && apiSP == "SP"){
            return true
        }
        if(apiCode == "13" && apiType == "IR" && apiSP == "SP"){
            return true
        }
        if(apiCode == "15" && apiType == "IR" && apiSP == "SP"){
            return true
        }
        if(apiCode == "14" && apiType == "IR" && apiSP == "SP"){
            return true
        }
        if(apiCode == "19" && apiType == "IR" && apiSP == "SP"){
            return true
        }
        return false
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if(section == 0){
            return 6
        } else {
            return listVattu.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if(indexPath.section == 0){
            if(indexPath.row == 0){
                let identifier = "TransferItemTableViewCell"
                var cell: TransferItemTableViewCell! = tableView.dequeueReusableCell(withIdentifier: identifier) as? TransferItemTableViewCell
                if cell == nil {
                    tableView.register(UINib(nibName: "TransferItemTableViewCell", bundle: nil), forCellReuseIdentifier: identifier)
                    cell = tableView.dequeueReusableCell(withIdentifier: identifier) as? TransferItemTableViewCell
                }
                if(apiType == "DC"){
                    (cell as TransferItemTableViewCell).setLabelStr(labelStr: "", labelContentStr: "")
                } else {
                    if(isChangeReceiveHumandLabel()){
                        (cell as TransferItemTableViewCell).setLabelStr(labelStr: "Nguời nhận", labelContentStr: "")
                        if(listUser.count>0){
                            var found = 0
                            for  i  in 0 ..< self.listUser.count {
                                if(listUser[i].user_name.lowercased() == self.username){
                                    found  = i
                                    break
                                }
                            }
                            cell.setLabelStr(labelStr: "Người nhận", labelContentStr: listUser[found].user_name)
                        }
                    } else {
                        (cell as TransferItemTableViewCell).setLabelStr(labelStr: "Nguời giao", labelContentStr: "")
                        if(listUser.count>0){
                            var found = 0
                            for  i  in 0 ..< self.listUser.count {
                                if(listUser[i].user_name.lowercased() == self.username){
                                    found  = i
                                    break
                                }
                            }
                            cell.setLabelStr(labelStr: "Người giao", labelContentStr: listUser[found].user_name)
                        }
                    }
                    
                    cell.tag = 1
                    cell.showDialog(listUserStr)
                }
                
                return cell;
            } else if(indexPath.row == 1){
                let identifier = "TransferItemTableViewCell"
                var cell: TransferItemTableViewCell! = tableView.dequeueReusableCell(withIdentifier: identifier) as? TransferItemTableViewCell
                if cell == nil {
                    tableView.register(UINib(nibName: "TransferItemTableViewCell", bundle: nil), forCellReuseIdentifier: identifier)
                    cell = tableView.dequeueReusableCell(withIdentifier: identifier) as? TransferItemTableViewCell
                }
                if(isHiddenDeptSend()){
                    (cell as TransferItemTableViewCell).setLabelStr(labelStr: "", labelContentStr: "")
                } else {
                    (cell as TransferItemTableViewCell).setLabelStr(labelStr: "BP Giao", labelContentStr: "")
                    if(listDept.count>0){
                        cell.setLabelStr(labelStr: "BP Giao", labelContentStr: "BP Giao")
                    }
                }
                cell.tag = 1
                cell.showDialog(listDeptStr)
                return cell;
            } else if (indexPath.row == 2){
                let identifier = "TransferItemTableViewCell"
                var cell: TransferItemTableViewCell! = tableView.dequeueReusableCell(withIdentifier: identifier) as? TransferItemTableViewCell
                if cell == nil {
                    tableView.register(UINib(nibName: "TransferItemTableViewCell", bundle: nil), forCellReuseIdentifier: identifier)
                    cell = tableView.dequeueReusableCell(withIdentifier: identifier) as? TransferItemTableViewCell
                }
                if(isChangeReceiveDeptReceiveLabelSend()){
                    (cell as TransferItemTableViewCell).setLabelStr(labelStr: "BP Giao", labelContentStr: "")
                    if(listDept.count>0){
                        cell.setLabelStr(labelStr: "BP Giao", labelContentStr: "BP Giao")
                    }
                } else {
                    (cell as TransferItemTableViewCell).setLabelStr(labelStr: "BP Nhận", labelContentStr: "")
                    if(listDept.count>0){
                        cell.setLabelStr(labelStr: "BP Nhận", labelContentStr: "BP Nhận")
                    }
                }
                
                if(currBarCodeObj != nil && currBarCodeObj.ma_kho.count>0){
                    cell.setLabelContentStr(labelContentStr: listDeptStr[findMaKhoPosition(ma_kho: currBarCodeObj.ma_kho)])
                }
                
                cell.tag = 2
                cell.showDialog(listDeptStr)
                return cell;
            } else if (indexPath.row == 3){
                let identifier = "TransferEditTableViewCell"
                var cell: TransferEditTableViewCell! = tableView.dequeueReusableCell(withIdentifier: identifier) as? TransferEditTableViewCell
                if cell == nil {
                    tableView.register(UINib(nibName: "TransferEditTableViewCell", bundle: nil), forCellReuseIdentifier: identifier)
                    cell = tableView.dequeueReusableCell(withIdentifier: identifier) as? TransferEditTableViewCell
                }
                (cell as TransferEditTableViewCell).setLabel(labelStr: "Dự án")
                cell.tag = 3
                return cell;
            } else if(indexPath.row == 4){
                let identifier = "TransferEditTableViewCell"
                var cell: TransferEditTableViewCell! = tableView.dequeueReusableCell(withIdentifier: identifier) as? TransferEditTableViewCell
                if cell == nil {
                    tableView.register(UINib(nibName: "TransferEditTableViewCell", bundle: nil), forCellReuseIdentifier: identifier)
                    cell = tableView.dequeueReusableCell(withIdentifier: identifier) as? TransferEditTableViewCell
                }
                (cell as TransferEditTableViewCell).setLabel(labelStr: "Phân xưởng")
                cell.tag = 4
                return cell;
            } else {
                let identifier = "TransferEdt2TableViewCell"
                var cell: TransferEdt2TableViewCell! = tableView.dequeueReusableCell(withIdentifier: identifier) as? TransferEdt2TableViewCell
                if cell == nil {
                    tableView.register(UINib(nibName: "TransferEdt2TableViewCell", bundle: nil), forCellReuseIdentifier: identifier)
                    cell = tableView.dequeueReusableCell(withIdentifier: identifier) as? TransferEdt2TableViewCell
                }
                (cell as TransferEdt2TableViewCell).setLabel(labelStr: "Sản phẩm")
                cell.tag = 5
                return cell;
            }
        } else {
            let identifier = "VattuTableViewCell"
            var cell: VattuTableViewCell! = tableView.dequeueReusableCell(withIdentifier: identifier) as? VattuTableViewCell
            if cell == nil {
                tableView.register(UINib(nibName: "VattuTableViewCell", bundle: nil), forCellReuseIdentifier: identifier)
                cell = tableView.dequeueReusableCell(withIdentifier: identifier) as? VattuTableViewCell
            }
            if(listVattu.count>0){
                (cell as VattuTableViewCell).updateInfo(name: listVattu[indexPath.row].ten_vt, donvitinh: listVattu[indexPath.row].dvt, soluong: Int(listVattu[indexPath.row].soluong))
            }
            cell.tag = 6
            return cell;
        }
    }
    
    
    
    
    
    
    
    @IBAction func saveCT(_  sender: UIButton) {
        print("save ct")
        if currBarCodeObj == nil {
            Toast.showNegativeMessage(message: "Xin quét Barcode")
            return
        }
        
        let deptCell = (tableView.cellForRow(at: IndexPath(row: 1, section: 0)) as! TransferItemTableViewCell)
        let deptCell2 = (tableView.cellForRow(at: IndexPath(row: 2, section: 0)) as! TransferItemTableViewCell)
        if(deptCell.frame.height > 0){
            if((deptCell.getCurrentLabelContent() != nil && deptCell.getCurrentLabelContent().count > 0 && deptCell.getCurrentLabelContent() == deptCell.getCurrentLabel())||(
                deptCell2.getCurrentLabelContent() != nil && deptCell2.getCurrentLabelContent().count > 0 && deptCell2.getCurrentLabelContent() == deptCell2.getCurrentLabel())){
                Toast.showNegativeMessage(message: "Xin chọn bộ phận nhận & bộ phận giao")
                return
            }
        } else if(deptCell2.getCurrentLabelContent() != nil && deptCell2.getCurrentLabelContent().count > 0 && deptCell2.getCurrentLabelContent() == deptCell2.getCurrentLabel()) {
            Toast.showNegativeMessage(message: "Xin chọn bộ phận nhận")
            return
        }
        
        let bpg = deptCell.getCurrentLabelContent()
        let bpgArr = bpg.components(separatedBy: " - ")
        let bpgStr = bpgArr[0]
        
        let bpn = deptCell2.getCurrentLabelContent()
        let bpnArr = bpn.components(separatedBy: " - ")
        let bpnStr = bpnArr[0]
        
        let tranferRq = TransferItemModel()
        
        tranferRq.stt_rec = ""
        tranferRq.ma_dvcs  = self.ma_dvcs
        tranferRq.ma_ca = self.ma_ca
        tranferRq.ma_da = currBarCodeObj.ma_vv
        tranferRq.ma_bp_giao = bpgStr
        tranferRq.ma_bp_nhan = bpnStr
        tranferRq.ma_px = currBarCodeObj.ma_bp
        tranferRq.ma_cd = currBarCodeObj.ma_kho
        tranferRq.ma_sp = currBarCodeObj.ma_sp
        tranferRq.user_id0 = Int(findSelectedUserId())
        tranferRq.user_id2 = Int(findSelectedUserId())
        
        tranferRq.ma_gd = self.apiCode
        
        var data:[TransferItemObj] = []
        for i in 0 ..< listVattu.count{
            var tItem = TransferItemObj()
            tItem.stt_rec = ""
            tItem.stt_rec0 = ""
            tItem.dvt = listVattu[i].dvt
            tItem.qr_id = listVattu[i].qrId
            tItem.ma_nvl = listVattu[i].ma_vt
            tItem.ma_lo = listVattu[i].ma_lo
            tItem.so_luong_nvl = Int32(listVattu[i].soluong)
            tItem.ma_kho = bpnStr
            
            tItem.ma_loi_sx = ""
            tItem.ma_nn_loi_sx = ""
            
            data.append(tItem)
        }
        
        tranferRq.danh_sach_nvl = data
        
        if(apiType == "DC"){
            
        } else if (apiType == "IR"){
            
        } else if (apiType == "IS"){
            
        }
        
        Toast.showNegativeMessage(message: "Thành công !!!")
        self.navigationController?.popViewController(animated: true)
    }
    
    
    func pushVattu(tranRq : TransferItemModel) {
       
    }
    
    
    func scanner(_ controller: BarcodeScannerViewController, didCaptureCode code: String, type: String) {
        controller.dismiss(animated: true, completion: nil)
        print("barcodeinfo : " + code)
        onGetBarcodeInfo(barcodeInfo: code)
    }
    
    func onGetBarcodeInfo( barcodeInfo : String){
        
        let dict = barcodeInfo.toJSON() as? [String:AnyObject]
        let qrid = (dict?["qr_id"] as AnyObject? as? Int64) ?? 0
        let ma_dvcs = (dict?["ma_dvcs"] as AnyObject? as? String) ?? ""
        let ma_bp = (dict?["ma_bp"] as AnyObject? as? String) ?? ""
        let ma_kho = (dict?["ma_kho"] as AnyObject? as? String) ?? ""
        let ma_vv = (dict?["ma_vv"] as AnyObject? as? String) ?? ""
        let ma_sp = (dict?["ma_sp"] as AnyObject? as? String) ?? ""
        let ma_nvl = (dict?["ma_nvl"] as AnyObject? as? String) ?? ""
        let ma_lo = (dict?["ma_lo"] as AnyObject? as? String) ?? ""
        let ngay_lo = (dict?["ngay_lo"] as AnyObject? as? String) ?? ""
        let sl_qc = (dict?["sl_qc"] as AnyObject? as? Int64) ?? 0
        
        var newBarcode = BarcodeModel()
        newBarcode.qr_id = qrid
        newBarcode.ma_dvcs = ma_dvcs
        newBarcode.ma_bp = ma_bp
        newBarcode.ma_kho = ma_kho
        newBarcode.ma_vv = ma_vv
        newBarcode.ma_sp = ma_sp
        newBarcode.ma_nvl = ma_nvl
        newBarcode.ma_lo = ma_lo
        newBarcode.ngay_lo = ngay_lo
        newBarcode.sl_qc = sl_qc
        if(currBarCodeObj == nil){
            currBarCodeObj = newBarcode
            if(ma_kho.count > 0 ){
                var deptCell = (tableView.cellForRow(at: IndexPath(row: 2, section: 0)) as! TransferItemTableViewCell)
                if(deptCell != nil){
                    deptCell.setLabelContentStr(labelContentStr: listDeptStr[findMaKhoPosition(ma_kho: ma_kho)])
                }
                updateInfoFromBarcode(barCode: currBarCodeObj)
            }
        } else if (isBarcodeOk(barcode: newBarcode)){
            updateInfoFromBarcode(barCode: newBarcode)
        } else {
            Toast.showPositiveMessage(message: "Barcode không đúng định dạng")
        }
    }
    
    func isBarcodeOk(barcode: BarcodeModel) -> Bool {
        if(currBarCodeObj != nil && barcode != nil){
            if(currBarCodeObj.ma_vv == barcode.ma_vv &&
                currBarCodeObj.ma_bp == barcode.ma_bp &&
                currBarCodeObj.ma_kho == barcode.ma_kho &&
                currBarCodeObj.ma_sp == barcode.ma_sp){
                return true
            }
        }
        return false
    }
    
    
    
    
    func updateInfoFromBarcode(barCode : BarcodeModel){
        let projectCell = (tableView.cellForRow(at: IndexPath(row: 3, section: 0)) as! TransferEditTableViewCell)
        projectCell.setInfoEdt(infoStr: barCode.ma_vv)
        let factoryCell = (tableView.cellForRow(at: IndexPath(row: 4, section: 0)) as! TransferEditTableViewCell)
        factoryCell.setInfoEdt(infoStr: barCode.ma_bp)
        let productCell = (tableView.cellForRow(at: IndexPath(row: 5, section: 0)) as! TransferEdt2TableViewCell)
        productCell.setInfos(productStr: barCode.ma_sp, quantity: barCode.sl_qc)
        
        var maSP : String
        if(apiSP == "NVL") {
            maSP = barCode.ma_nvl
        } else {
            maSP = barCode.ma_sp
        }
        var qrid : String
        qrid = barCode.qr_id.description
        var isSameQR : Bool = false
        for i in 0 ..< self.listVattu.count {
            if(qrid == self.listVattu[i].qrId) {
                listVattu[i].soluong = listVattu[i].soluong + 1
                isSameQR = true
                break
            }
        }
        
        if(isSameQR){
            tableView.reloadData()
        } else {
            if(maSP.count == 0){
                Toast.showNegativeMessage(message: "Mã SP hoặc mã NVL trống")
            } else {
                NetworkUtil.shared.getVattuInfo(apiKey: self.apiKey,mavt: maSP, success: { dataRs in do {
                        print("emdeplam " + dataRs[0].ten_vt)
                        print(dataRs)
                    
                        for j in 0 ..< dataRs.count {
                            let vattuInfo  = dataRs[j]
                            vattuInfo.qrId = qrid
                            vattuInfo.soluong = barCode.sl_qc
                            vattuInfo.ma_lo = barCode.ma_lo
                            print("Barcode :  " + vattuInfo.ma_lo)
                            self.listVattu.append(vattuInfo)
                        }
                        self.tableView.reloadData()
                    }
                }){_ in
                    
                }
            }
        }
        
    }
    
    func findMaKhoPosition(ma_kho : String) -> Int {
        for  i  in 0 ..< self.listDept.count {
            if(listDept[i].ma_cd == ma_kho){
                return i
            }
        }
        return 0;
    }
    
    func scanner(_ controller: BarcodeScannerViewController, didReceiveError error: Error) {
        print("abc")
    }
    
    
    func scannerDidDismiss(_ controller: BarcodeScannerViewController) {
        print("abcd")
        controller.dismiss(animated: true, completion: nil)
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Barcode", style: UIBarButtonItemStyle.plain, target: self, action: #selector(onCallBarcode))
        self.navigationItem.title = titleName
        
        
        NetworkUtil.shared.getDepts(apiKey: self.apiKey, success: { dataRs in do {
            print("emdeplam " + dataRs[0].ten_cd)
            self.listDept = dataRs
            for  i  in 0 ..< self.listDept.count {
                self.listDeptStr.append(self.listDept[i].ma_cd + " - " + self.listDept[i].ten_cd);
            }
            self.tableView.reloadData()
        }
        }){_ in
            
        }
        
        NetworkUtil.shared.getUsers(apiKey: self.apiKey, success: { dataRs in do {
            print("emdeplam " + dataRs[0].full_name)
            self.listUser = dataRs
            for  i  in 0 ..< self.listUser.count {
                self.listUserStr.append(self.listUser[i].user_name);
            }
            self.tableView.reloadData()
            }
        }){_ in
            
        }
    }


    
    @objc func onCallBarcode() {
        print("you tapped me !?")
        callBarcodeScanner()
    }
    
    func callBarcodeScanner(){
        let viewController = BarcodeScannerViewController()
        viewController.codeDelegate = self
        viewController.errorDelegate = self
        viewController.dismissalDelegate = self
        present(viewController, animated: true, completion: nil)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
}
extension String {
    func toJSON() -> Any? {
        guard let data = self.data(using: .utf8, allowLossyConversion: false) else { return nil }
        return try? JSONSerialization.jsonObject(with: data, options: .mutableContainers)
    }
}
