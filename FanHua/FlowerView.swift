//
//  FlowerView.swift
//  FanHua
//
//  Created by Zhang on 2019/5/28.
//  Copyright © 2019 Zhang. All rights reserved.
//

import UIKit
import ReactiveCocoa

enum FlowerViewType {
    case sun
    case water
    case weeding
    case fertilizer
}

typealias FlowerViewClouse = (_ type:FlowerViewType)->Void

class FlowerView: UIView {

    var backImage:UIImageView!
    var imageView:UIImageView!
    var waterButton:UIButton!
    var fertilizerButon:UIButton!
    var weedingButton:UIButton!
    var sunButton:UIButton!
    
    var waterLabel:UILabel!
    var fertilizerLabel:UILabel!
    var weedingLabel:UILabel!
    var sunLabel:UILabel!
    
    var waterSlider:UISlider!
    var fertilizerlider:UISlider!
    var weedingSlider:UISlider!
    var sunSlider:UISlider!

    var flowerViewClouse:FlowerViewClouse!
    
    var model:FlowerModel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backImage = UIImageView.init(frame: CGRect.init(x: 0, y: 0, width: frame.size.width, height: frame.size.height))
        backImage.image = UIImage.init(named: "矩形")
        self.addSubview(backImage)
        self.setUpView()
    }
    
    func setUpView(){
        imageView = UIImageView.init(frame: CGRect.init(x: 0, y: 0, width: 300, height: 400))
        self.addSubview(imageView)
        
        waterButton = UIButton.init(type: .custom)
        waterButton.frame = CGRect.init(x: frame.size.width - 100, y: 30, width: 70, height: 70)
        waterButton.setTitle("浇水", for: .normal)
        waterButton.setTitleColor(.white, for: .normal)
        waterButton.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        waterButton.setBackgroundImage(UIImage.init(named: "浇水按键"), for: .normal)
        waterButton.reactive.controlEvents(.touchUpInside).observeValues { (button) in
            if self.flowerViewClouse != nil {
                self.flowerViewClouse(.water)
            }
            self.waterSlider.value = self.waterSlider.value + 20
        }
        self.addSubview(waterButton)
        
        fertilizerButon = UIButton.init(type: .custom)
        fertilizerButon.frame = CGRect.init(x: frame.size.width - 100, y: 120, width: 70, height: 70)
        fertilizerButon.setTitle("施肥", for: .normal)
        fertilizerButon.setTitleColor(.white, for: .normal)
        fertilizerButon.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        fertilizerButon.setBackgroundImage(UIImage.init(named: "浇水按键"), for: .normal)
        fertilizerButon.reactive.controlEvents(.touchUpInside).observeValues { (button) in
            if self.flowerViewClouse != nil {
                self.flowerViewClouse(.fertilizer)
            }
            self.fertilizerlider.value = self.fertilizerlider.value + 20
        }
        self.addSubview(fertilizerButon)
        
        weedingButton = UIButton.init(type: .custom)
        weedingButton.frame = CGRect.init(x: frame.size.width - 100, y: 210, width: 70, height: 70)
        weedingButton.setTitle("除虫", for: .normal)
        weedingButton.setTitleColor(.white, for: .normal)
        weedingButton.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        weedingButton.setBackgroundImage(UIImage.init(named: "浇水按键"), for: .normal)
        weedingButton.reactive.controlEvents(.touchUpInside).observeValues { (button) in
            if self.flowerViewClouse != nil {
                self.flowerViewClouse(.weeding)
            }
            self.weedingSlider.value = self.weedingSlider.value + 20
        }
        self.addSubview(weedingButton)
        
        
        sunButton = UIButton.init(type: .custom)
        sunButton.setTitle("光照", for: .normal)
        sunButton.setTitleColor(.white, for: .normal)
        sunButton.frame = CGRect.init(x: frame.size.width - 100, y: 300, width: 70, height: 70)
        sunButton.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        sunButton.setBackgroundImage(UIImage.init(named: "浇水按键"), for: .normal)
        sunButton.reactive.controlEvents(.touchUpInside).observeValues { (button) in
            if self.flowerViewClouse != nil {
                self.flowerViewClouse(.sun)
                self.sunSlider.value = self.sunSlider.value + 20
            }
        }
        self.addSubview(sunButton)
        
        
        waterLabel = UILabel.init(frame: CGRect.init(x: 40, y: 300, width: 100, height: 30))
        waterLabel.text = "浇水"
        waterLabel.font = UIFont.systemFont(ofSize: 20)
        waterLabel.textAlignment = .left
        waterLabel.textColor = .white
        self.addSubview(waterLabel)
        
        fertilizerLabel = UILabel.init(frame: CGRect.init(x: 40, y: 340, width: 100, height: 30))
        fertilizerLabel.text = "除草"
        fertilizerLabel.font = UIFont.systemFont(ofSize: 20)
        fertilizerLabel.textAlignment = .left
        fertilizerLabel.textColor = .white
        self.addSubview(fertilizerLabel)
        
        weedingLabel = UILabel.init(frame: CGRect.init(x: 40, y: 380, width: 100, height: 30))
        weedingLabel.text = "施肥"
        weedingLabel.font = UIFont.systemFont(ofSize: 20)
        weedingLabel.textAlignment = .left
        weedingLabel.textColor = .white
        self.addSubview(weedingLabel)
        
        sunLabel = UILabel.init(frame: CGRect.init(x: 40, y: 420, width: 100, height: 30))
        sunLabel.text = "关照"
        sunLabel.font = UIFont.systemFont(ofSize: 20)
        sunLabel.textAlignment = .left
        sunLabel.textColor = .white
        self.addSubview(sunLabel)
        
        waterSlider = UISlider.init(frame: CGRect.init(x: 70, y: 340, width: 100, height: 30))
        waterSlider.minimumValue = 0.0
        waterSlider.maximumValue =  100
        waterSlider.layer.masksToBounds = true
        waterSlider.minimumValueImage = UIImage.init(named: "条上")
        waterSlider.maximumTrackTintColor = .white
        waterSlider.value  = 50.0
        self.addSubview(waterSlider)
        
        fertilizerlider = UISlider.init(frame: CGRect.init(x: 70, y: 380, width: 100, height: 30))
        fertilizerlider.minimumValue = 0.0
        fertilizerlider.maximumValue =  100
        fertilizerlider.layer.masksToBounds = true
        fertilizerlider.minimumValueImage = UIImage.init(named: "条上")
        fertilizerlider.maximumTrackTintColor = .white
        fertilizerlider.value  = 50.0
        self.addSubview(fertilizerlider)
        
        
        weedingSlider = UISlider.init(frame: CGRect.init(x: 70, y: 300, width: 100, height: 30))
        weedingSlider.minimumValue = 0.0
        weedingSlider.maximumValue =  100
        weedingSlider.layer.masksToBounds = true
        weedingSlider.minimumValueImage = UIImage.init(named: "条上")
        weedingSlider.maximumTrackTintColor = .white
        weedingSlider.value  = 50.0
        self.addSubview(weedingSlider)
        
        
        sunSlider = UISlider.init(frame: CGRect.init(x: 70, y: 420, width: 100, height: 30))
        sunSlider.minimumValue = 0.0
        sunSlider.maximumValue =  100
        
        sunSlider.layer.masksToBounds = true
        sunSlider.minimumValueImage = UIImage.init(named: "条上")
        sunSlider.maximumTrackTintColor = .white
        sunSlider.value  = 50.0
        self.addSubview(sunSlider)
        
    }
    
    func setData(model:FlowerModel){
        self.model = model
        waterSlider.value = Float(model.water)
        fertilizerlider.value = Float(model.apply)
        weedingSlider.value = Float(model.weeding)
        sunSlider.value = Float(model.sun)

    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
