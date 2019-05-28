//
//  ContactView.swift
//  FanHua
//
//  Created by Zhang on 2019/5/28.
//  Copyright © 2019 Zhang. All rights reserved.
//

import UIKit

class ContactView: UIView {

    var segmented:UISegmentedControl!
    var pageView:PageView!
    var pageView1:PageView!
    var pageView2:PageView!
    
    var toolsButton:UIButton!
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.setUpView(frame: frame)
        self.backgroundColor = UIColor.init(white: 1, alpha: 0.9)
        self.layer.cornerRadius = 15
        self.layer.masksToBounds = true
    }
    
    func setUpContactView(){
        var imageArrays:[UIImage] = []
        imageArrays.append(UIImage.init(named: "好友名单")!)
        pageView = PageView.init(frame: CGRect.init(x: 0, y: 50, width: SCRRENWIDHT - 200, height: 400), imageArrays: imageArrays)
        pageView.tag = 100
        self.addSubview(pageView)
        
    }
    
    func setUpFindeFriendsView(){
        var imageArrays:[UIImage] = []
        imageArrays.append(UIImage.init(named: "好友申请")!)
        imageArrays.append(UIImage.init(named: "已是好友")!)
        pageView1 = PageView.init(frame: CGRect.init(x: 0, y: 50, width: SCRRENWIDHT - 200, height: 400), imageArrays: imageArrays)
        pageView1.tag = 200
        self.addSubview(pageView1)
        self.sendSubviewToBack(self.pageView1)
    }
    
    func setUpFriendsView(){
        var imageArrays:[UIImage] = []
        imageArrays.append(UIImage.init(named: "查找好友")!)
        pageView2 = PageView.init(frame: CGRect.init(x: 0, y: 50, width: SCRRENWIDHT - 200, height: 400), imageArrays: imageArrays)
        pageView2.tag = 300
        self.addSubview(pageView2)
        self.sendSubviewToBack(self.pageView2)

    }
    
    func setUpView(frame:CGRect){
        self.setUpContactView()
        let items = ["好友名单","好友申请","查找好友"]
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
            self.removeFromSuperview()
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
            if pageView2 != nil {
                pageView2.isHidden = true
            }
            toolsButton.setTitle("赠送", for: .normal)
        }else if sender.selectedSegmentIndex == 1{
            if self.pageView1 == nil {
                self.setUpFriendsView()
            }
            if pageView != nil {
                pageView.isHidden = true
            }
            if pageView1 != nil {
                pageView1.isHidden = false
            }
            if pageView2 != nil {
                pageView2.isHidden = true
            }
            toolsButton.setTitle("购买", for: .normal)
        }else{
            if self.pageView2 == nil {
                self.setUpFindeFriendsView()
            }
            if pageView != nil {
                pageView.isHidden = true
            }
            if pageView1 != nil {
                pageView1.isHidden = true
            }
            if pageView2 != nil {
                pageView2.isHidden = false
            }
            toolsButton.setTitle("确定", for: .normal)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
