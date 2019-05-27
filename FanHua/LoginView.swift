//
//  LoginView.swift
//  FanHua
//
//  Created by Zhang on 2019/5/28.
//  Copyright © 2019 Zhang. All rights reserved.
//

import UIKit
import SnapKit

class LoginView: UIView {

    var titleLable:UIImageView!
    var descLabel:UIImageView!
    
    var avatarImageView:UIImageView!
    var userNameField:UITextField!
    var passwordField:UITextField!
    var loginButton:UIButton!
    var weChatButton:UIButton!
    var weiboButton:UIButton!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.init(red: 255.0/255.0, green: 250.0/255.0, blue: 243.0/255.0, alpha: 1)
        titleLable = UIImageView.init(frame: CGRect.init(x: (SCRRENWIDHT - 100 ) / 2, y: 100, width: 150, height: 70))
        titleLable.image = UIImage.init(named: "繁花")
        self.addSubview(titleLable)
        
        descLabel = UIImageView.init(frame: CGRect.init(x: (SCRRENWIDHT - 100 ) / 2, y: 190, width: 150, height: 60))
        descLabel.image = UIImage.init(named: "FANHUA")
        self.addSubview(descLabel)
        
        
        avatarImageView = UIImageView.init(frame: CGRect.init(x: (SCRRENWIDHT - 100 ) / 2, y: 310, width: 100, height: 50))
        avatarImageView.image = UIImage.init(named: "IMG_0872")
        self.addSubview(avatarImageView)
        
        userNameField = UITextField.init(frame: CGRect.init(x: 50, y: 440, width: (SCRRENWIDHT - 100 ), height: 60))
        userNameField.borderStyle = .line
        userNameField.font = UIFont.systemFont(ofSize: 30)
        userNameField.placeholder = "账户"
        self.addSubview(userNameField)
        
        passwordField = UITextField.init(frame: CGRect.init(x: 50, y: 520, width: (SCRRENWIDHT - 100 ), height: 60))
        passwordField.borderStyle = .line
        passwordField.font = UIFont.systemFont(ofSize: 30)
        passwordField.placeholder = "密码"
        self.addSubview(passwordField)
        
        
        weChatButton = UIButton.init(type: .custom)
        weChatButton.frame = CGRect.init(x: (SCRRENWIDHT - 260) / 2 + 90, y: 590, width: 60, height: 60)
        weChatButton.setBackgroundImage(UIImage.init(named: "WechatIMG181"), for: .normal)
        weChatButton.setImage(UIImage.init(named: "IMG_0875"), for: .normal)
        self.addSubview(weChatButton)
        
        weiboButton = UIButton.init(type: .custom)
        weiboButton.frame = CGRect.init(x: (SCRRENWIDHT - 260) / 2 + 170, y: 590, width: 60, height: 60)
        weiboButton.setBackgroundImage(UIImage.init(named: "WechatIMG181"), for: .normal)
        weiboButton.setImage(UIImage.init(named: "IMG_0876"), for: .normal)
        self.addSubview(weiboButton)
        
        loginButton = UIButton.init(type: .custom)
        loginButton.frame = CGRect.init(x: (SCRRENWIDHT - 260) / 2 + 30, y: 660, width: 260, height: 90)
        loginButton.titleLabel?.font = UIFont.systemFont(ofSize: 30)
        loginButton.setBackgroundImage(UIImage.init(named: "IMG_0981"), for: .normal)
        loginButton.setTitle("登录", for: .normal)
        loginButton.addTarget(self, action: #selector(self.loginButtonClick), for: .touchUpInside)
        self.addSubview(loginButton)
    }
    
    @objc func loginButtonClick(){
        self.removeFromSuperview()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
