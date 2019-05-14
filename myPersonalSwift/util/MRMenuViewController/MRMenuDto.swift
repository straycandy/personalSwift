//
//  MRMenuDto.swift
//  myPersonalSwift
//
//  Created by mengran on 2019/5/7.
//  Copyright © 2019 straycandy. All rights reserved.
//

import Foundation
struct MRMenuDto {
    let menuType: MRMenuType?
    let menuName :String?
    let secMenuName :String?
    let imageUrlStr :String?
    /// menu的index，从0开始
    let menuIndex :NSInteger?
}
