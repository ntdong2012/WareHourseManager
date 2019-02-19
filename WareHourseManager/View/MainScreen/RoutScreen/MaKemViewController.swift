//
//  MaKemViewController.swift
//  WareHourseManager
//
//  Created by Dong Nguyen Thanh on 1/7/19.
//  Copyright © 2019 Dong Nguyen Thanh. All rights reserved.
//

import UIKit

class MaKemViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    @IBOutlet var collectionView : UICollectionView!
    
    var apiKey : String!
    var username : String!
    
    var ma_ca : String!
    var ma_dvcs : String!
    
    var ItemArr = [ItemObj]()
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.isNavigationBarHidden = true
        // Do any additional setup after loading the view.
        
        let item = ItemObj(name: "Nhận NVL về kho",imageId: "_01", apiCode: "01", apiType: "DC", apiSP: "NVL")
        let item2 = ItemObj(name: "Xuất NVL công đoạn",imageId: "_02", apiCode: "02", apiType: "DC", apiSP: "NVL")
        let item3 = ItemObj(name: "Nhận NVL công đoạn",imageId: "_03", apiCode: "03", apiType: "DC", apiSP: "NVL")
        let item4 = ItemObj(name: "Nhập TP cơ khí",imageId: "_04", apiCode: "01", apiType: "IR", apiSP: "SP")
        let item5 = ItemObj(name: "Nhập BTP công đoạn",imageId: "_05", apiCode: "10", apiType: "IR", apiSP: "SP")
        let item6 = ItemObj(name: "Xuất BTP công đoạn",imageId: "_06", apiCode: "07", apiType: "DC", apiSP: "SP")
        let item7 = ItemObj(name: "Nhập chốt ca",imageId: "_07", apiCode: "13", apiType: "IR", apiSP: "SP")
        let item8 = ItemObj(name: "Nhập TP hoàn thiện",imageId: "_08", apiCode: "15", apiType: "IR", apiSP: "SP")
        let item9 = ItemObj(name: "Xuất NVL sản xuất",imageId: "_09", apiCode: "61", apiType: "IS", apiSP: "NVL")
        let item10 = ItemObj(name: "Xuất TP mạ kẽm",imageId: "_10", apiCode: "62", apiType: "IS", apiSP: "SP")
        
        
        ItemArr.append(item);
        ItemArr.append(item2);
        ItemArr.append(item3);
        ItemArr.append(item4);
        ItemArr.append(item5);
        ItemArr.append(item6);
        ItemArr.append(item7);
        ItemArr.append(item8);
        ItemArr.append(item9);
        ItemArr.append(item10);
        
        let nib = UINib(nibName: "MyCollectionViewCell", bundle: nil)
        collectionView?.register(nib, forCellWithReuseIdentifier: "myCollectionViewCellID")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout : UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) ->CGSize {
        let noOfCellsInRow = 2
        let flowLayout = collectionViewLayout as! UICollectionViewFlowLayout
        let totalSpace = flowLayout.sectionInset.left
            + flowLayout.sectionInset.right
            + (flowLayout.minimumInteritemSpacing * CGFloat(noOfCellsInRow - 1))
        let size = Int((collectionView.bounds.width - totalSpace) / CGFloat(noOfCellsInRow))
        return CGSize(width: size, height: size)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "myCollectionViewCellID", for: indexPath) as! MyCollectionViewCell
        
        let obj = ItemArr[indexPath.row]
        
        cell.displayContent(label: obj.name, imageUID: obj.imageId)
        cell.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tap(_:))))
        
        return cell
    }
    
    @objc func tap(_ sender: UITapGestureRecognizer) {
        
        let location = sender.location(in: self.collectionView)
        let indexPath = self.collectionView.indexPathForItem(at: location)
        
        if let index = indexPath {
            print("Got clicked on index: \(index)!")
            
            let objClick = self.ItemArr[index.row] as ItemObj
            print ("name : " + objClick.name)
            let searchViewController = SearchViewController()
            searchViewController.apiCode = objClick.apiCode
            searchViewController.apiType = objClick.apiType
            searchViewController.apiTitle = objClick.name
            searchViewController.apiSP = objClick.apiSP
            searchViewController.apiKey = self.apiKey
            searchViewController.username = self.username
            searchViewController.ma_ca = self.ma_ca
            searchViewController.ma_dvcs = self.ma_dvcs
            self.navigationController!.pushViewController(searchViewController, animated: true)
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
