//
//  FlowerModel.swift
//  FanHua
//
//  Created by Zhang on 2019/5/27.
//  Copyright © 2019 Zhang. All rights reserved.
//

import UIKit

class FlowerModel : NSObject, NSCoding{
    
    var disinsection : Int!
    var fertilizer : Int!
    var flowerpotName : String!
    var flowersName : String!
    var sun : Int!
    var water : Int!
    
    
    /**
     * Instantiate the instance using the passed dictionary values to set the properties values
     */
    init(fromDictionary dictionary: [String:Any]){
        disinsection = dictionary["disinsection"] as? Int
        fertilizer = dictionary["fertilizer"] as? Int
        flowerpotName = dictionary["flowerpotName"] as? String
        flowersName = dictionary["flowersName"] as? String
        sun = dictionary["sun"] as? Int
        water = dictionary["water"] as? Int
    }
    
    /**
     * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
     */
    func toDictionary() -> [String:Any]
    {
        var dictionary = [String:Any]()
        if disinsection != nil{
            dictionary["disinsection"] = disinsection
        }
        if fertilizer != nil{
            dictionary["fertilizer"] = fertilizer
        }
        if flowerpotName != nil{
            dictionary["flowerpotName"] = flowerpotName
        }
        if flowersName != nil{
            dictionary["flowersName"] = flowersName
        }
        if sun != nil{
            dictionary["sun"] = sun
        }
        if water != nil{
            dictionary["water"] = water
        }
        return dictionary
    }
    
    /**
     * NSCoding required initializer.
     * Fills the data from the passed decoder
     */
    @objc required init(coder aDecoder: NSCoder)
    {
        disinsection = aDecoder.decodeObject(forKey: "disinsection") as? Int
        fertilizer = aDecoder.decodeObject(forKey: "fertilizer") as? Int
        flowerpotName = aDecoder.decodeObject(forKey: "flowerpotName") as? String
        flowersName = aDecoder.decodeObject(forKey: "flowersName") as? String
        sun = aDecoder.decodeObject(forKey: "sun") as? Int
        water = aDecoder.decodeObject(forKey: "water") as? Int
        
    }
    
    /**
     * NSCoding required method.
     * Encodes mode properties into the decoder
     */
    @objc func encode(with aCoder: NSCoder)
    {
        if disinsection != nil{
            aCoder.encode(disinsection, forKey: "disinsection")
        }
        if fertilizer != nil{
            aCoder.encode(fertilizer, forKey: "fertilizer")
        }
        if flowerpotName != nil{
            aCoder.encode(flowerpotName, forKey: "flowerpotName")
        }
        if flowersName != nil{
            aCoder.encode(flowersName, forKey: "flowersName")
        }
        if sun != nil{
            aCoder.encode(sun, forKey: "sun")
        }
        if water != nil{
            aCoder.encode(water, forKey: "water")
        }
        
    }
    
}
