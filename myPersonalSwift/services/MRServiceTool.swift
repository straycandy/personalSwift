//
//  MRServiceTool.swift
//  myPersonalSwift
//
//  Created by mengran on 2019/4/10.
//  Copyright © 2019年 straycandy. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

protocol NetworkToolProtocol {
    static func requestMainMenuData(completionHandler: @escaping (_ MeneDatas: [SNXSQGAcitivesDto]) -> ())
    static func requestTimeData(completionHandler: @escaping (_ timeStamp: NSInteger) -> ())
}

enum NetworkErrorType {
    case NoNetwork
}

extension NetworkToolProtocol {
    static func requestMainMenuData(completionHandler: @escaping (_ MeneDatas: [SNXSQGAcitivesDto]) -> ()) throws {
        //http://jua.suning.com/appRob/zsqsyggcpmv2_1_025_161000000140_6163653889_1_7230c1f4b50e477d6202ae465064f49015f694bd_ios_7.4.5_zsq1_12718490,12691159,12718488,12595187_.html
        let url = kPalmRushNewCommonURL + "/appRob/zsqsyggcpmv2_1_025_161000000100_7013893001_1_7230c1f4b50e477d6202ae465064f49015f694bd_ios_7.6.5_zsq1__.html"
        Alamofire.request(url).responseJSON { (response) in
            guard response.result.isSuccess else { return }
            if let value = response.result.value {
                let json = JSON(value).dictionary;
                let dataDic = json?["data"]?.dictionary;
                let activeDataArray = dataDic?["palamRobTimes"]?.array;
                if activeDataArray != nil {
                    let activeMutArray = NSMutableArray.init()
                    for element in activeDataArray! {
                        let activeDto = SNXSQGAcitivesDto.init(jsonData: element)
                        activeMutArray.add(activeDto)
                    }
                    completionHandler(activeMutArray as! [SNXSQGAcitivesDto])
                }else{
                    
                }
            }
        }
    }
    
    static func requestTimeData(completionHandler: @escaping (_ timeStamp: NSInteger) -> ()) {
        //http://jua.suning.com/sys/timeJsonp_.html
        let url = kPalmRushNewCommonURL + "/sys/timeJsonp_.html"
        Alamofire.request(url).responseJSON { (response) in
            guard response.result.isSuccess else { return }
            if let value = response.result.value {
                let json = JSON(value).dictionary;
                var servertime = json?["serverTime"]?.number?.intValue;
                if servertime == nil {
                    servertime = 0
                }
                completionHandler(servertime!)
            }
        }
    }
}

struct MRServiceTool: NetworkToolProtocol {}
