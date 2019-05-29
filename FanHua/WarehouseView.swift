//
//  WarehouseView.swift
//  FanHua
//
//  Created by Zhang on 2019/5/28.
//  Copyright © 2019 Zhang. All rights reserved.
//

import UIKit

typealias WarehouseViewClouse = (_ flower:Int) ->Void

class WarehouseView: UIView {

    var segmented:UISegmentedControl!
    var pageView:PageView!
    var pageView1:PageView!
    
    var toolsButton:UIButton!
    var warehouseViewClouse:WarehouseViewClouse!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.setUpView(frame: frame)
        self.backgroundColor = UIColor.init(white: 1, alpha: 0.9)
        self.layer.cornerRadius = 15
        self.layer.masksToBounds = true
    }
    
    func setUpMyHouseView(){
        let array = CacheManager.getSharedInstance().getWarehouseModels()!
        if array.count > 0 {
            var imageArrays:[UIImage] = []
            for str in array {
                let model = FlowerModel.init(fromDictionary: str as! [String : Any])
                imageArrays.append(UIImage.init(named: model.powFlowerName)!)
            }
            pageView = PageView.init(frame: CGRect.init(x: 0, y: 50, width: SCRRENWIDHT - 200, height: 500), imageArrays: imageArrays)
            pageView.tag = 200
            self.addSubview(pageView)
        }else{
            _ = Tools.shareInstance.showMessage(KWINDOWDS!, msg: "暂时没有数据，请收获属于自己的第一支植物吧", autoHidder: true)
        }
        
    }
    
    func setUpStoreView(){
        let array = CacheManager.getSharedInstance().getWarehouseModels()!
        if array.count > 0 {
            var imageArrays:[UIImage] = []
            for str in array {
//                let model = FlowerModel.init(fromDictionary: str as! [String : Any])
                imageArrays.append(UIImage.init(named: "商店 集市")!)
            }
            pageView1 = PageView.init(frame: CGRect.init(x: 0, y: 50, width: SCRRENWIDHT - 200, height: 400), imageArrays: imageArrays)
            pageView1.tag = 100
            self.addSubview(pageView1)
        }else{
            _ = Tools.shareInstance.showMessage(KWINDOWDS!, msg: "暂时没有数据，请收获属于自己的第一支植物吧", autoHidder: true)
        }
        self.sendSubviewToBack(self.pageView1)
    }
    
    func setUpView(frame:CGRect){
        self.setUpMyHouseView()
        let items = ["我的仓库","商店"]
        segmented = UISegmentedControl(items: items)
        segmented.setBackgroundImage(UIImage.init(named: "选中标题"), for: .normal, barMetrics: UIBarMetrics.default)
        //设置中心位置
        segmented.frame = CGRect.init(x: 150, y: 30, width: frame.size.width - 300, height: 60)
        //设置默认选中的索引,索引从0开始
        segmented.selectedSegmentIndex = 0
        //添加监听事件
        segmented.addTarget(self, action: #selector(self.segementClick(_:)), for: .valueChanged)
        //修改选项颜色
        segmented.tintColor = UIColor.white
        //修改选项文字
        //修改选项内容偏移位置
        segmented.setContentOffset(CGSize(width: 5, height: 5), forSegmentAt: 1)
        //添加到视图中
        self.addSubview(segmented)
        
        toolsButton = UIButton.init(type: .custom)
        toolsButton.setTitle("出售", for: .normal)
        toolsButton.backgroundColor = .brown
        toolsButton.frame = CGRect.init(x: (frame.size.width - 200) / 2, y: 500, width: 200, height: 80)
        
        toolsButton.reactive.controlEvents(.touchUpInside).observeValues { (butto) in
            if self.toolsButton.titleLabel?.text == "出售" {
                CacheManager.getSharedInstance().saveMyFlower(myFlower:  CacheManager.getSharedInstance().getMyFlower() + 20)
                self.removeFromSuperview()

            }else{
                if CacheManager.getSharedInstance().getMyFlower() < 20 {
                    _ = Tools.shareInstance.showMessage(KWINDOWDS!, msg: "您暂时没钱", autoHidder: true)
                }else{
                    CacheManager.getSharedInstance().saveMyFlower(myFlower:  CacheManager.getSharedInstance().getMyFlower() - 20)
                    self.removeFromSuperview()

                }
            }
            if self.warehouseViewClouse != nil {
                self.warehouseViewClouse(CacheManager.getSharedInstance().getMyFlower())
            }
        }
        self.addSubview(toolsButton)
    }
    
    
    @objc func segementClick(_ sender:UISegmentedControl) {
        if sender.selectedSegmentIndex == 0 {
            if pageView != nil {
                pageView.isHidden = false
            }
            if pageView1 != nil {
                pageView1.isHidden = true
            }
            toolsButton.setTitle("出售", for: .normal)
        }else{
            if self.pageView1 == nil {
                self.setUpStoreView()
            }

            if pageView != nil {
                pageView.isHidden = true
            }
            if pageView1 != nil {
                pageView1.isHidden = false
            }
            toolsButton.setTitle("购买", for: .normal)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
