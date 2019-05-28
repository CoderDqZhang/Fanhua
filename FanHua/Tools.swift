//
//  Tools.swift
//  LiangPiao
//
//  Created by Zhang on 23/11/2016.
//  Copyright © 2016 Zhang. All rights reserved.
//

import UIKit
import MBProgressHUD


let KWINDOWDS = UIApplication.shared.keyWindow

let HUDBackGroudColor = "000000"
let CustomViewWidth:CGFloat = 190
let CustomViewFont = UIFont.init(name: ".HelveticaNeueInterface-Bold", size: 17.0)
let TextLabelMarger:CGFloat = 20

class Tools: NSObject {

    
    override init() {
        
    }
    
    static let shareInstance = Tools()
    
    func showLoading(_ view:UIView, msg:String?) -> MBProgressHUD {
        let hud = MBProgressHUD.showAdded(to: view, animated: true)
        hud.mode = .indeterminate
        hud.bezelView.backgroundColor = .black
        hud.bezelView.layer.cornerRadius = 10.0
        if msg != nil {
            hud.label.text = msg
            hud.label.numberOfLines = 0;
            hud.label.textColor = UIColor.white
            hud.label.font = CustomViewFont;
        }
        return hud
    }
    
    func hiddenLoading(hud:MBProgressHUD) {
        hud.hide(animated: true)
    }
    
    func showMessage(_ view:UIView, msg:String, autoHidder:Bool) -> MBProgressHUD {
        let hud = MBProgressHUD.showAdded(to: view, animated: true)
        hud.mode = .customView
        hud.bezelView.backgroundColor = .black
        hud.bezelView.layer.cornerRadius = 10.0
        hud.label.numberOfLines = 0;
        hud.label.textColor = UIColor.white
        hud.label.font = CustomViewFont;
        hud.minSize = CGSize.init(width: 100, height: 40)
        hud.label.text = msg;
        hud.bezelView.layer.frame = CGRect.init(x: 0, y: 0, width: SCRRENWIDHT, height: SCRRENHEIGHT)
        hud.hide(animated: true, afterDelay: 2.0)
        hud.removeFromSuperViewOnHide = true
        hud.margin = 10
        return hud
    }
    
   
}
