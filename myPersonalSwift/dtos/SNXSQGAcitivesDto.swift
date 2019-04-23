//
//  SNXSQGAcitivesDto.swift
//  myPersonalSwift
//
//  Created by mengran on 2019/4/18.
//  Copyright © 2019 straycandy. All rights reserved.
//

import UIKit
import SwiftyJSON

struct SNXSQGAcitivesDto {
    let name : String?
    let isNowTime :Bool?
    let time :String?
    let timeLong :String?
    let timeDesc :String?
    let exclusiveType :String?
    
    public init(jsonData: JSON) {
        name = jsonData["name"].stringValue
        isNowTime = jsonData["name"].boolValue
        time = jsonData["time"].stringValue
        timeLong = jsonData["timeLong"].stringValue
        timeDesc = jsonData["timeDesc"].stringValue
        exclusiveType = jsonData["exclusiveType"].stringValue
    }
    
}
