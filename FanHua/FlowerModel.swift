//
//  FlowerModel.swift
//  FanHua
//
//  Created by Zhang on 2019/5/28.
//  Copyright © 2019 Zhang. All rights reserved.
//

import UIKit

class FlowerModel : NSObject, NSCoding{
    
    var apply : Int!
    var flowerName : String!
    var powFlowerName : String!
    var powName : String!
    var senderTat : Int!
    var sun : Int!
    var water : Int!
    var weeding : Int!
    
    
    /**
     * Instantiate the instance using the passed dictionary values to set the properties values
     */
    init(fromDictionary dictionary: [String:Any]){
        apply = dictionary["apply"] as? Int
        flowerName = dictionary["flowerName"] as? String
        powFlowerName = dictionary["powFlowerName"] as? String
        powName = dictionary["powName"] as? String
        senderTat = dictionary["senderTat"] as? Int
        sun = dictionary["sun"] as? Int
        water = dictionary["water"] as? Int
        weeding = dictionary["weeding"] as? Int
    }
    
    /**
     * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
     */
    func toDictionary() -> [String:Any]
    {
        var dictionary = [String:Any]()
        if apply != nil{
            dictionary["apply"] = apply
        }
        if flowerName != nil{
            dictionary["flowerName"] = flowerName
        }
        if powFlowerName != nil{
            dictionary["powFlowerName"] = powFlowerName
        }
        if powName != nil{
            dictionary["powName"] = powName
        }
        if senderTat != nil{
            dictionary["senderTat"] = senderTat
        }
        if sun != nil{
            dictionary["sun"] = sun
        }
        if water != nil{
            dictionary["water"] = water
        }
        if weeding != nil{
            dictionary["weeding"] = weeding
        }
        return dictionary
    }
    
    /**
     * NSCoding required initializer.
     * Fills the data from the passed decoder
     */
    @objc required init(coder aDecoder: NSCoder)
    {
        apply = aDecoder.decodeObject(forKey: "apply") as? Int
        flowerName = aDecoder.decodeObject(forKey: "flowerName") as? String
        powFlowerName = aDecoder.decodeObject(forKey: "powFlowerName") as? String
        powName = aDecoder.decodeObject(forKey: "powName") as? String
        senderTat = aDecoder.decodeObject(forKey: "senderTat") as? Int
        sun = aDecoder.decodeObject(forKey: "sun") as? Int
        water = aDecoder.decodeObject(forKey: "water") as? Int
        weeding = aDecoder.decodeObject(forKey: "weeding") as? Int
        
    }
    
    /**
     * NSCoding required method.
     * Encodes mode properties into the decoder
     */
    @objc func encode(with aCoder: NSCoder)
    {
        if apply != nil{
            aCoder.encode(apply, forKey: "apply")
        }
        if flowerName != nil{
            aCoder.encode(flowerName, forKey: "flowerName")
        }
        if powFlowerName != nil{
            aCoder.encode(powFlowerName, forKey: "powFlowerName")
        }
        if powName != nil{
            aCoder.encode(powName, forKey: "powName")
        }
        if senderTat != nil{
            aCoder.encode(senderTat, forKey: "senderTat")
        }
        if sun != nil{
            aCoder.encode(sun, forKey: "sun")
        }
        if water != nil{
            aCoder.encode(water, forKey: "water")
        }
        if weeding != nil{
            aCoder.encode(weeding, forKey: "weeding")
        }
        
    }
    
}
