//
//  Const.swift
//  myPersonalSwift
//
//  Created by mengran on 2019/4/9.
//  Copyright © 2019年 straycandy. All rights reserved.
//

import Foundation
import UIKit

let kScreenWidth = UIScreen.main.bounds.size.width;
let kScreenHeight = UIScreen.main.bounds.size.height;

let iPhoneX_Or_Later = UIScreen.main.bounds.height == 812 || UIScreen.main.bounds.height == 1218 || UIScreen.main.bounds.height == 896 || UIScreen.main.bounds.height == 1344

let Top_iPhoneX_Or_Later_Space = iPhoneX_Or_Later ? 24 : 0

public protocol translateWidth {
}

extension Int: translateWidth {
}

extension UInt: translateWidth {
}

extension Float: translateWidth {
}

extension Double: translateWidth {
}

extension CGFloat: translateWidth {
}

func get375Width(_ transSpace : translateWidth ) -> CGFloat {
    var floatValue : CGFloat = 0
    
    if let value = transSpace as? CGFloat {
        floatValue = value
    }else if let value = transSpace as? Int {
        floatValue = CGFloat(value)
    }else if let value = transSpace as? Float {
        floatValue = CGFloat(value)
    }else if let value = transSpace as? UInt {
        floatValue = CGFloat(value)
    }else if let value = transSpace as? Double {
        floatValue = CGFloat(value)
    }
    let v = CGFloat(floatValue * kScreenWidth / 375.0)
    
    return v;
}

