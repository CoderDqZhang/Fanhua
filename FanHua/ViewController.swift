//
//  ViewController.swift
//  FanHua
//
//  Created by Zhang on 2019/5/27.
//  Copyright © 2019 Zhang. All rights reserved.
//

import UIKit
import SnapKit
import ReactiveSwift
import ReactiveCocoa

let SCRRENWIDHT:CGFloat = UIScreen.main.bounds.size.width
let SCRRENHEIGHT:CGFloat = UIScreen.main.bounds.size.height


class ViewController: UIViewController {

    var imageView:UIImageView!
    var answerImageView:UIImageView!
    var answerView:UIView!
    
    var scrollerView:UIScrollView!
    
    var followName:String!
    var powName:String!
    
    var loginView:LoginView!
    
    var time:Timer!
    var timeLabel:UILabel!
    var count:Int = 30
    var answerimageView:UIImageView!
    
    let frames:[CGRect] = [CGRect.init(x: 330, y: 240, width: 130, height: 130),CGRect.init(x: 280, y: 450, width: 130, height: 130),CGRect.init(x: 150, y: 660, width: 130, height: 130),CGRect.init(x: 370, y: 850, width: 130, height: 130),CGRect.init(x: 990, y: 480, width: 130, height: 130),CGRect.init(x: 1870, y: 150, width: 130, height: 130),CGRect.init(x: 2170, y: 240, width: 130, height: 130),CGRect.init(x: 2170, y: 240, width: 130, height: 130),CGRect.init(x: 2720, y: 690, width: 230, height: 230),CGRect.init(x: 3300, y: 560, width: 120, height: 120),CGRect.init(x: 3500, y: 730, width: 180, height: 180),CGRect.init(x: 4150, y: 480, width: 130, height: 130),CGRect.init(x: 4320, y: 520, width: 90, height: 90),CGRect.init(x: 4950, y: 730, width: 190, height: 190),CGRect.init(x: 5150, y: 780, width: 140, height: 140),CGRect.init(x: 5250, y: 440, width: 90, height: 90),CGRect.init(x: 5350, y: 440, width: 110, height: 110),CGRect.init(x: 5800, y: 120, width: 140, height: 140),CGRect.init(x: 5950, y: 310, width: 90, height: 90),CGRect.init(x: 6150, y: 720, width: 190, height: 190)]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.setUpView()
//        self.setUpAnwser()
//        self.setUpLoginView()

    }
    
    func setUpLoginView(){
        loginView = LoginView.init(frame: CGRect.init(x: 0, y: 0, width: SCRRENWIDHT, height: SCRRENHEIGHT))
        loginView.backgroundColor = .white
        self.view.addSubview(loginView)
    }
    
    func setUpAnwser(){
        answerView = UIView.init(frame: CGRect.init(x: 0, y: 0, width: SCRRENWIDHT, height: SCRRENHEIGHT))
        answerView.backgroundColor = UIColor.init(white: 1, alpha: 0.5)
        let image = UIImage.init(named: "答题背景")
        
        answerImageView  = UIImageView.init(frame: CGRect.init(x: (SCRRENWIDHT - (image?.size.width)!) / 2, y: 60, width: SCRRENWIDHT, height: SCRRENWIDHT * (image?.size.height)! / (image?.size.width)!))
        answerImageView.image = image
        answerView.addSubview(answerImageView)
        answerImageView.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
            make.size.equalTo(CGSize.init(width: SCRRENWIDHT, height: SCRRENWIDHT * (image?.size.height)! / (image?.size.width)!))
        }
        
        timeLabel = UILabel.init(frame: CGRect.init(x: 70, y: 490, width: SCRRENWIDHT - 140, height: 120))
        timeLabel.numberOfLines = 0
        timeLabel.textAlignment = .center
        timeLabel.textColor = UIColor.init(red: 165.0/255.0, green: 97.0/255.0, blue: 67.0/255.0, alpha: 1)
        timeLabel.font = UIFont.systemFont(ofSize: 45)
        answerView.addSubview(timeLabel)
        
        let label = UILabel.init(frame: CGRect.init(x: 70, y: 390, width: SCRRENWIDHT - 140, height: 120))
        label.numberOfLines = 0
        label.textAlignment = .center
        label.textColor = UIColor.init(red: 165.0/255.0, green: 97.0/255.0, blue: 67.0/255.0, alpha: 1)
        label.font = UIFont.systemFont(ofSize: 45)
        label.text = "下列哪种食物可以有效的降血脂，预防心脑血管疾病？"
        answerView.addSubview(label)
        
        let rightButton = UIButton.init(type: .custom)
        rightButton.frame = CGRect.init(x: 100, y: 100, width: 200, height: 40)
        rightButton.setTitle("C.胡萝卜", for: .normal)
        rightButton.addTarget(self, action: #selector(self.answerLeftButtonClick(_:)), for: .touchDown)
        rightButton.setTitleColor(UIColor.init(red: 165.0/255.0, green: 97.0/255.0, blue: 67.0/255.0, alpha: 1), for: .normal)
        rightButton.titleLabel?.font = UIFont.systemFont(ofSize: 45)
        rightButton.tag = 1
        answerView.addSubview(rightButton)
        rightButton.snp.makeConstraints { (make) in
            make.right.equalTo(answerImageView.snp.right).offset(-130)
            make.bottom.equalTo(answerImageView.snp.bottom).offset(-170)
            make.size.equalTo(CGSize.init(width: 200, height: 60))
        }
        
        let centerButton = UIButton.init(type: .custom)
        centerButton.frame = CGRect.init(x: 100, y: 90, width: 200, height: 40)
        centerButton.setTitleColor(UIColor.init(red: 165.0/255.0, green: 97.0/255.0, blue: 67.0/255.0, alpha: 1), for: .normal)
        
        centerButton.titleLabel?.font = UIFont.systemFont(ofSize: 45)
        centerButton.setTitle("B.木耳", for: .normal)
        centerButton.addTarget(self, action: #selector(self.answerCenterButtonClick), for: .touchDown)
        answerView.addSubview(centerButton)
        centerButton.snp.makeConstraints { (make) in
            make.left.equalTo(answerView.snp.left).offset(260)
            make.bottom.equalTo(answerImageView.snp.bottom).offset(-170)
            make.size.equalTo(CGSize.init(width: 200, height: 60))
        }
        
        let leftButton = UIButton.init(type: .custom)
        leftButton.frame = CGRect.init(x: 100, y: 100, width: 200, height: 40)
        leftButton.setTitleColor(UIColor.init(red: 165.0/255.0, green: 97.0/255.0, blue: 67.0/255.0, alpha: 1), for: .normal)
        leftButton.titleLabel?.font = UIFont.systemFont(ofSize: 45)
        leftButton.setTitle("A.白菜", for: .normal)
        answerView.addSubview(leftButton)
        leftButton.tag = 2
        leftButton.addTarget(self, action: #selector(self.answerLeftButtonClick(_:)), for: .touchDown)
        leftButton.snp.makeConstraints { (make) in
            make.left.equalTo(answerImageView.snp.left).offset(10)
            make.bottom.equalTo(answerImageView.snp.bottom).offset(-170)
            make.size.equalTo(CGSize.init(width: 200, height: 60))
        }
        
        self.view.addSubview(answerView)
    }
    
    @objc func answerLeftButtonClick(_ sender:UIButton){
        if answerimageView == nil {
            answerimageView = UIImageView.init()
            let image = UIImage.init(named: "IMG_0837")
            answerimageView.image = image!
            answerView.addSubview(answerimageView)
        }
        if sender.tag == 1 {
            self.count = 30
            answerimageView.frame = CGRect.init(x: 450, y: 400, width: 400, height: 400)
        }else{
            self.count = 30
            answerimageView.frame = CGRect.init(x: 40, y: 400, width: 400, height: 400)
        }
        if time == nil {
            time = Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: { (time) in
                self.count = self.count - 1
                if self.count < 1 {
                    self.timeLabel.isHidden = true
                    self.answerimageView.isHidden = true
                }else{
                    self.timeLabel.isHidden = false
                    self.answerimageView.isHidden = false
                }
                self.timeLabel.text = "\(self.count)s后继续答题"
            })
        }
    }
    
    @objc func answerCenterButtonClick(){
        if time != nil {
            time.invalidate()
        }
        
        
        let image = UIImage.init(named: "IMG_0836")
        let imageView = UIImageView.init(frame: CGRect.init(x: 250, y: 560, width: 400, height: 400))
        imageView.image = image!
        answerView.addSubview(imageView)
        _ = Timer.scheduledTimer(withTimeInterval: 5, repeats: false, block: { (time) in
            self.answerView.removeFromSuperview()
        })
    }


    func setUpView(){
        scrollerView = UIScrollView.init(frame: CGRect.init(x: 0, y: 0, width: SCRRENWIDHT, height: SCRRENHEIGHT))
        scrollerView.backgroundColor = UIColor.red
        self.view.addSubview(scrollerView)
        
        
        let image = UIImage.init(named: "44c4dfdf8d2e1a734dbf941dd9367c2")
        imageView = UIImageView.init(frame: CGRect.init(x: 0, y: 0, width: (image?.size.width)! * SCRRENHEIGHT / (image?.size.height)!, height: SCRRENHEIGHT))
        imageView.image = image
        scrollerView.addSubview(imageView)
        
        let array = CacheManager.getSharedInstance().getCategoryModels()

        for index in 0...frames.count - 1 {
            let button = self.setUpFollowButton(frame: frames[index])
            button.tag = index + 1000
            if array != nil {
                for model in array! {
                    let flower = FlowerModel.init(fromDictionary: model as! [String : Any])
                    if flower.senderTat == index + 1000 {
                        button.setImage(UIImage.init(named: flower.powFlowerName), for: .normal)
                    }
                }
            }
            
            button.addTarget(self, action: #selector(self.followButtonSelect(_:)), for: .touchUpInside)
            scrollerView.addSubview(button)
        }
        
        scrollerView.contentSize = CGSize.init(width: (image?.size.width)! * SCRRENHEIGHT / (image?.size.height)!, height: SCRRENHEIGHT)
    }
    
    @objc func followButtonSelect(_ sender:UIButton) {
        
        let followView = UIView.init(frame: CGRect.init(x: 100, y: 100, width: SCRRENWIDHT - 200, height: SCRRENHEIGHT - 200))
        followView.backgroundColor = .white
        
        var imageArray:[UIImage]! = []
        let strs = ["1-1","1-4","1-5"]
        for str in strs {
            imageArray.append(UIImage.init(named: str)!)
        }
        let pageView = PageView.init(frame: CGRect.init(x: 0, y: 0, width: SCRRENWIDHT - 200, height: 400), imageArrays: imageArray)
        pageView.tag = 100
        followView.addSubview(pageView)
        
        var imageArrays:[UIImage]! = []
        let strsa = ["pow1","pow2","pow4","pow5","pow6","pow7","pow8"]
        for str in strsa {
            imageArrays.append(UIImage.init(named: str)!)
        }
        let pageView1 = PageView.init(frame: CGRect.init(x: 0, y: 400, width: SCRRENWIDHT - 200, height: 400), imageArrays: imageArrays)
        pageView1.tag = 200
        
        followView.addSubview(pageView1)
        
        self.view.addSubview(followView)
        
        let button1 = UIButton.init(type: .custom)
        button1.setTitle("种植", for: .normal)
        button1.backgroundColor = .brown
        button1.frame = CGRect.init(x: (SCRRENWIDHT - 400) / 2, y: 800, width: 200, height: 80)
        button1.reactive.controlEvents(.touchUpInside).observeValues { (butto) in
            let viewTag = self.view.viewWithTag(sender.tag) as! UIButton
            print()
            let name = "\(strsa[pageView1.selectIndex])-\(strs[pageView.selectIndex])"
            let image = UIImage.init(named: name)
            image?.scaling(to:viewTag.frame.size)
            viewTag.setImage(image, for: .normal)
            followView.removeFromSuperview()
            CacheManager.getSharedInstance().saveNormaltModel(category: FlowerModel.init(fromDictionary: [
                "powName": strsa[pageView1.selectIndex],
                "flowerName": strs[pageView.selectIndex],
                "powFlowerName": name,
                "senderTat": sender.tag,
                "sun": 0,
                "water": 0,
                "weeding": 0,
                "apply": 0
                ]))
        }
        followView.addSubview(button1)
    }
    
    
    func setUpFollowButton(frame:CGRect) ->UIButton{
        let followButton = UIButton.init(type: .custom)
        followButton.frame = frame
        return followButton
    }
}

