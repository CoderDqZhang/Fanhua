//
//  WarehouseView.swift
//  FanHua
//
//  Created by Zhang on 2019/5/28.
//  Copyright © 2019 Zhang. All rights reserved.
//

import UIKit

class WarehouseView: UIView {

    var segementView:UISegmentedControl!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        segementView = UISegmentedControl.init(frame: CGRect.init(x: 150, y: 100, width: SCRRENHEIGHT - 300, height: 30))
        segementView.setTitle("好友名单", forSegmentAt: 0)
        segementView.setTitle("好友申请", forSegmentAt: 1)
        segementView.setTitle("查找好友", forSegmentAt: 2)
        segementView.addTarget(self, action: #selector(self.segementClick(_:)), for: .valueChanged)
        self.addSubview(segementView)
    }
    
    
    @objc func segementClick(_ sender:UISegmentedControl) {
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
