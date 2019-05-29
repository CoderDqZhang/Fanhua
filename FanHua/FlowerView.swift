//
//  FlowerView.swift
//  FanHua
//
//  Created by Zhang on 2019/5/28.
//  Copyright © 2019 Zhang. All rights reserved.
//

import UIKit
import ReactiveCocoa
import MBProgressHUD

enum FlowerViewType {
    case sun
    case water
    case weeding
    case fertilizer
    case confirm
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
    var selectIndex:Int!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backImage = UIImageView.init(frame: CGRect.init(x: 0, y: 0, width: frame.size.width, height: frame.size.height))
        backImage.image = UIImage.init(named: "矩形")
        let backView = UIView.init(frame: CGRect.init(x: 20, y: 20, width: frame.size.width - 40, height: frame.size.height - 40))
        backView.backgroundColor = UIColor.init(red: 237/255, green: 195/255, blue: 135/255, alpha: 1.0)
        self.addSubview(backImage)
        self.addSubview(backView)
        self.setUpView()
    }
    
    func setUpView(){
        imageView = UIImageView.init(frame: CGRect.init(x: 100, y: 30, width: 100, height: 200))
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
            self.model.water = Int(self.waterSlider.value)
            self.waterSlider.setValue(self.waterSlider.value, animated: true)
            self.saveModel()
            _ = Tools.shareInstance.showMessage(KWINDOWDS!, msg: "浇水成功", autoHidder: true)
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
            self.model.apply = Int(self.fertilizerlider.value)
            self.fertilizerlider.setValue(self.fertilizerlider.value, animated: true)
            self.saveModel()
            _ = Tools.shareInstance.showMessage(KWINDOWDS!, msg: "施肥成功", autoHidder: true)
        }
        self.addSubview(fertilizerButon)
        
        weedingButton = UIButton.init(type: .custom)
        weedingButton.frame = CGRect.init(x: frame.size.width - 100, y: 210, width: 70, height: 70)
        weedingButton.setTitle("除草", for: .normal)
        weedingButton.setTitleColor(.white, for: .normal)
        weedingButton.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        weedingButton.setBackgroundImage(UIImage.init(named: "浇水按键"), for: .normal)
        weedingButton.reactive.controlEvents(.touchUpInside).observeValues { (button) in
            if self.flowerViewClouse != nil {
                self.flowerViewClouse(.weeding)
            }
            _ = Tools.shareInstance.showMessage(KWINDOWDS!, msg: "除草成功", autoHidder: true)
            self.weedingSlider.value = self.weedingSlider.value + 20
            self.model.weeding = Int(self.weedingSlider.value)
            self.weedingSlider.setValue(self.weedingSlider.value, animated: true)
            self.saveModel()
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
            }
            _ = Tools.shareInstance.showMessage(KWINDOWDS!, msg: "光照成功", autoHidder: true)
            self.sunSlider.value = self.sunSlider.value + 20
            self.model.sun = Int(self.sunSlider.value)
            self.sunSlider.setValue(self.sunSlider.value, animated: true)
            self.saveModel()
        }
        self.addSubview(sunButton)
        
        
        waterLabel = UILabel.init(frame: CGRect.init(x: 40, y: 300, width: 100, height: 30))
        waterLabel.text = "除草"
        waterLabel.font = UIFont.systemFont(ofSize: 20)
        waterLabel.textAlignment = .left
        waterLabel.textColor = .white
        self.addSubview(waterLabel)
        
        fertilizerLabel = UILabel.init(frame: CGRect.init(x: 40, y: 340, width: 100, height: 30))
        fertilizerLabel.text = "浇水"
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
        
        waterSlider = UISlider.init(frame: CGRect.init(x: 80, y: 340, width: 150, height: 30))
        waterSlider.minimumValue = 0.0
        waterSlider.maximumValue =  100
        waterSlider.layer.masksToBounds = true
        waterSlider.setMinimumTrackImage(UIImage.init(named: "条上"), for: .normal)
        waterSlider.setMaximumTrackImage(UIImage.init(named: "条下"), for: .normal)
        waterSlider.value  = 50.0
        self.addSubview(waterSlider)
        
        fertilizerlider = UISlider.init(frame: CGRect.init(x: 80, y: 380, width: 150, height: 30))
        fertilizerlider.minimumValue = 0.0
        fertilizerlider.maximumValue =  100
        fertilizerlider.layer.masksToBounds = true
        fertilizerlider.setMinimumTrackImage(UIImage.init(named: "条上"), for: .normal)
        fertilizerlider.setMaximumTrackImage(UIImage.init(named: "条下"), for: .normal)
        fertilizerlider.value  = 50.0
        self.addSubview(fertilizerlider)
        
        
        weedingSlider = UISlider.init(frame: CGRect.init(x: 80, y: 300, width: 150, height: 30))
        weedingSlider.minimumValue = 0.0
        weedingSlider.maximumValue =  100
        weedingSlider.layer.masksToBounds = true
        weedingSlider.setMinimumTrackImage(UIImage.init(named: "条上"), for: .normal)
        weedingSlider.setMaximumTrackImage(UIImage.init(named: "条下"), for: .normal)
        weedingSlider.value  = 50.0
        self.addSubview(weedingSlider)
        
        
        sunSlider = UISlider.init(frame: CGRect.init(x: 80, y: 420, width: 150, height: 30))
        sunSlider.minimumValue = 0.0
        sunSlider.maximumValue =  100
        
        sunSlider.layer.masksToBounds = true
        sunSlider.setMinimumTrackImage(UIImage.init(named: "条上"), for: .normal)
        sunSlider.setMaximumTrackImage(UIImage.init(named: "条下"), for: .normal)
        sunSlider.value  = 50.0
        self.addSubview(sunSlider)
        
        
        let confirmButton = UIButton.init(type: .custom)
        confirmButton.frame = CGRect.init(x: (frame.size.width - 170) / 2, y: frame.size.height - 50, width: 170, height: 100)
        confirmButton.setTitle("收获", for: .normal)
        confirmButton.setTitleColor(.white, for: .normal)
        confirmButton.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        confirmButton.setBackgroundImage(UIImage.init(named: "done"), for: .normal)
        confirmButton.reactive.controlEvents(.touchUpInside).observeValues { (button) in
            if self.model.apply != 100 {
                _ = Tools.shareInstance.showMessage(KWINDOWDS!, msg: "施肥还不够呢", autoHidder: true)
                return
            }
            if self.model.water != 100 {
                _ = Tools.shareInstance.showMessage(KWINDOWDS!, msg: "浇水还不够呢", autoHidder: true)
                return
            }
            if self.model.weeding != 100 {
                _ = Tools.shareInstance.showMessage(KWINDOWDS!, msg: "除虫还不够呢", autoHidder: true)
                return
            }
            if self.model.sun != 100 {
                _ = Tools.shareInstance.showMessage(KWINDOWDS!, msg: "光照还不够呢", autoHidder: true)
                return
            }
            CacheManager.getSharedInstance().saveNormaltWarehouseModel(category: self.model)
            _ = Tools.shareInstance.showMessage(KWINDOWDS!, msg: "收获成功", autoHidder: true)
            self.deleteModel()
            self.removeFromSuperview()
            if self.flowerViewClouse != nil {
                self.flowerViewClouse(.confirm)
            }

            
        }
        self.addSubview(confirmButton)
        
    }
    
    func deleteModel(){
        let array = CacheManager.getSharedInstance().getCategoryModels()
        array?.removeObject(at: self.selectIndex)
        CacheManager.getSharedInstance().updateModel(array: array!)
    }
    
    func saveModel(){
        let array = CacheManager.getSharedInstance().getCategoryModels()
        array?.replaceObject(at: self.selectIndex, with: self.model!.toDictionary())
        CacheManager.getSharedInstance().updateModel(array: array!)
    }
    
    func setData(model:FlowerModel, _ index:Int){
        self.selectIndex = index
        self.model = model
        waterSlider.value = Float(model.water)
        fertilizerlider.value = Float(model.apply)
        weedingSlider.value = Float(model.weeding)
        sunSlider.value = Float(model.sun)

        imageView.image = UIImage.init(named: model.powFlowerName)
        
        self.waterSlider.setValue(waterSlider.value, animated: true)
        self.fertilizerlider.setValue(fertilizerlider.value, animated: true)
        self.weedingSlider.setValue(weedingSlider.value, animated: true)
        self.sunSlider.setValue(sunSlider.value, animated: true)

    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
