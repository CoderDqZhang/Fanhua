//
//  CacheManager.swift
//  FanHua
//
//  Created by Zhang on 2019/5/27.
//  Copyright © 2019 Zhang. All rights reserved.
//

import UIKit
import YYCache

let kEncodedObjectPath = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.documentDirectory, FileManager.SearchPathDomainMask.userDomainMask, true).last! as String
let kEncodeUserCachesDirectory = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.documentDirectory, FileManager.SearchPathDomainMask.userDomainMask, true).first! as String

class CacheManager: NSObject {
    
    private static let _sharedInstance = CacheManager()
    
    var userCache = YYKVStorage.init(path: kEncodeUserCachesDirectory, type: YYKVStorageType.file)
    var otherCache = YYKVStorage.init(path: kEncodedObjectPath, type: YYKVStorageType.file)
    
    class func getSharedInstance() -> CacheManager {
        
        return _sharedInstance
    }
    
    private override init() {} // 私有化init方法
    
    func saveMyFlower(myFlower:Int){
        UserDefaults.standard.set(myFlower, forKey: "MyFlowers")
    }
    
    func getMyFlower() -> Int{
        if UserDefaults.standard.bool(forKey: "MyFlowers") {
            return UserDefaults.standard.integer(forKey: "MyFlowers")
        }
        return 0
    }
    
    func saveNormaltModel(category:FlowerModel){
        var array = NSMutableArray.init()
        if (CacheManager._sharedInstance.otherCache?.itemExists(forKey: "FlowerModel"))! {
            let item:Data = ((CacheManager._sharedInstance.otherCache?.getItemValue(forKey: "FlowerModel"))!)
            array =  NSKeyedUnarchiver.unarchiveObject(with: item) as! NSMutableArray
        }
        
        array.add(category.toDictionary())
        
        CacheManager._sharedInstance.otherCache?.saveItem(withKey: "FlowerModel", value: NSKeyedArchiver.archivedData(withRootObject: array), filename: "FlowerModel", extendedData: nil)
    }
    
    func updateModel(array:NSMutableArray) {
        CacheManager._sharedInstance.otherCache?.saveItem(withKey: "FlowerModel", value: NSKeyedArchiver.archivedData(withRootObject: array), filename: "FlowerModel", extendedData: nil)
    }
    
    func getCategoryModels() ->NSMutableArray? {
        if (CacheManager._sharedInstance.otherCache?.itemExists(forKey: "FlowerModel"))! {
            let item:Data = ((CacheManager._sharedInstance.otherCache?.getItemValue(forKey: "FlowerModel"))!)
            return NSKeyedUnarchiver.unarchiveObject(with: item) as? NSMutableArray
        }
        return nil
    }
    
    
    func saveNormaltWarehouseModel(category:FlowerModel){
        var array = NSMutableArray.init()
        if (CacheManager._sharedInstance.otherCache?.itemExists(forKey: "WarehouseFlowerModel"))! {
            let item:Data = ((CacheManager._sharedInstance.otherCache?.getItemValue(forKey: "WarehouseFlowerModel"))!)
            array =  NSKeyedUnarchiver.unarchiveObject(with: item) as! NSMutableArray
        }
        
        array.add(category.toDictionary())
        
        CacheManager._sharedInstance.otherCache?.saveItem(withKey: "WarehouseFlowerModel", value: NSKeyedArchiver.archivedData(withRootObject: array), filename: "WarehouseFlowerModel", extendedData: nil)
    }
    
    func updateWarehouseModel(array:NSMutableArray) {
        CacheManager._sharedInstance.otherCache?.saveItem(withKey: "WarehouseFlowerModel", value: NSKeyedArchiver.archivedData(withRootObject: array), filename: "WarehouseFlowerModel", extendedData: nil)
    }
    
    func getWarehouseModels() ->NSMutableArray? {
        if (CacheManager._sharedInstance.otherCache?.itemExists(forKey: "WarehouseFlowerModel"))! {
            let item:Data = ((CacheManager._sharedInstance.otherCache?.getItemValue(forKey: "WarehouseFlowerModel"))!)
            return NSKeyedUnarchiver.unarchiveObject(with: item) as? NSMutableArray
        }
        return nil
    }
}

