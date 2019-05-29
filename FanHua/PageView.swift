//
//  PageView.swift
//  FanHua
//
//  Created by Zhang on 2019/5/28.
//  Copyright © 2019 Zhang. All rights reserved.
//

import UIKit
import SnapKit

class PageView: UIView {

    var leftButton:UIButton!
    var rightButton:UIButton!
    var centerView:UIView!
    var scrollerPage:UIScrollView!
    
    var originX:CGFloat = 0
    var selectIndex:Int = 0
    var maxCount:Int = 0
    
    
    init(frame: CGRect,imageArrays:[UIImage]) {
        super.init(frame: frame)
        self.setUpView(frame: frame, imageArrays: imageArrays)
    }
    
    func setUpView(frame:CGRect,imageArrays:[UIImage]){
        maxCount = imageArrays.count
        centerView = UIView.init(frame: CGRect.init(x: 50, y: 0, width: frame.size.width - 100, height: frame.size.height))
        scrollerPage = UIScrollView.init(frame: CGRect.init(x: 0, y: 0, width: frame.size.width - 100, height: frame.size.height))
        scrollerPage.isPagingEnabled = true
        scrollerPage.contentSize = CGSize.init(width: (CGFloat(imageArrays.count - 1) * (frame.size.width - 100)), height: frame.size.height)
        for index in 0...imageArrays.count - 1 {
            let imageView = UIImageView.init(frame: CGRect.init(x: (frame.size.width - 100) * CGFloat(index) + 50, y: 0, width: frame.size.width - 200, height: frame.size.height))
            imageView.image = imageArrays[index]
            imageView.contentMode = .center
            imageView.backgroundColor = .clear
            scrollerPage.addSubview(imageView)
        }
        scrollerPage.delegate = self
        centerView.addSubview(scrollerPage)
        self.addSubview(centerView)
        
        leftButton = UIButton.init(type: .custom)
        leftButton.setBackgroundImage(UIImage.init(named: "21559008296_.pic"), for: .normal)
        leftButton.addTarget(self, action: #selector(self.leftButtonClick(_:)), for: .touchUpInside)
        self.addSubview(leftButton)
        
        rightButton = UIButton.init(type: .custom)
        rightButton.setBackgroundImage(UIImage.init(named: "31559008313_.pic"), for: .normal)
        rightButton.addTarget(self, action: #selector(self.rightButtonClick(_:)), for: .touchUpInside)
        self.addSubview(rightButton)
        
        leftButton.snp.makeConstraints { (make) in
            make.left.equalToSuperview()
            make.centerY.equalToSuperview()
            make.size.equalTo(CGSize.init(width: 40, height: 80))
        }
        
        rightButton.snp.makeConstraints { (make) in
            make.right.equalToSuperview()
            make.centerY.equalToSuperview()
            make.size.equalTo(CGSize.init(width: 40, height: 80))
        }
    }
    
    @objc func leftButtonClick(_ sender:UIButton) {
        if selectIndex != 0 {
            self.scrollerPage.setContentOffset(CGPoint.init(x: self.originX - (frame.size.width - 100), y: 0), animated: true)
        }
    }
    
    @objc func rightButtonClick(_ sender:UIButton) {
        if selectIndex != maxCount - 2 {
            self.scrollerPage.setContentOffset(CGPoint.init(x:self.originX + (frame.size.width - 100), y: 0), animated: true)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension PageView : UIScrollViewDelegate {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        selectIndex = Int(scrollView.contentOffset.x / ((frame.size.width - 100)))
        originX = scrollView.contentOffset.x

    }
    
    func scrollViewDidEndScrollingAnimation(_ scrollView: UIScrollView) {

    }
    
    func scrollViewDidScrollToTop(_ scrollView: UIScrollView) {
        
    }
    
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        
    }
    
    func scrollViewWillBeginDecelerating(_ scrollView: UIScrollView) {
        
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        
    }
}
