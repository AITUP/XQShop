//
//  MainAD.swift
//  XQShop
//
//  Created by Xuqian on 16/3/23.
//  Copyright © 2016年 Qian xu. All rights reserved.
//

import UIKit

class MainAD: NSObject, DictModelProtocol {
    
    var code: Int = -1
    var msg: String?
    var data: AD?
    
    class func loadADData(completion:(data: MainAD?, error: NSError?) -> Void) {
        
        let path = NSBundle.mainBundle().pathForResource("AD", ofType: nil)
        let data = NSData(contentsOfFile: path!)
        if data != nil {
            let dict: NSDictionary = (try! NSJSONSerialization.JSONObjectWithData(data!, options: .AllowFragments)) as! NSDictionary
            let modelTool = DictModelManager.sharedInstance
            let data = modelTool.objectWithDictionary(dict, cls: MainAD.self) as? MainAD
            completion(data: data, error: nil)
        }
    }
    
    static func customClassMapping() -> [String : String]? {
        return ["data" : "\(AD.self)"]
    }
}

class AD: NSObject {
    var title: String?
    var img_name: String?
    var starttime: String?
    var endtime: String?
}
