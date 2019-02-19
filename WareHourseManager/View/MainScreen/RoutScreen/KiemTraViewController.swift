//
//  KiemTraViewController.swift
//  WareHourseManager
//
//  Created by Dong Nguyen Thanh on 2/11/19.
//  Copyright © 2019 Dong Nguyen Thanh. All rights reserved.
//

import UIKit

class KiemTraViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
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
        
        let item = ItemObj(name: "Nhận sản phẩm lỗi",imageId: "_01", apiCode: "05", apiType: "DC", apiSP: "SP")
        let item2 = ItemObj(name: "Xuất sản phẩm lỗi",imageId: "_02", apiCode: "06", apiType: "DC", apiSP: "SP")
        let item3 = ItemObj(name: "Tính tồn kho",imageId: "_03", apiCode: "06", apiType: "DC", apiSP: "SP")
        ItemArr.append(item)
        ItemArr.append(item2)
        ItemArr.append(item3)
        
        let nib = UINib(nibName: "MyCollectionViewCell", bundle: nil)
        collectionView?.register(nib, forCellWithReuseIdentifier: "myCollectionViewCellID")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
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
            if(index.row == 0 || index.row == 1) {
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
            } else {
                Toast.showPositiveMessage(message: "Thành công")
            }
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
