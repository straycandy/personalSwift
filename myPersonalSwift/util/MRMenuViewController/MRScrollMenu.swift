//
//  MRScrollMenu.swift
//  myGreatSwiftTest
//
//  Created by mengran on 2019/4/8.
//  Copyright © 2019年 ggV5. All rights reserved.
//

import Foundation
import UIKit
import SnapKit

private let menuItemsTag = 10001

class MRScrollMenu: UIScrollView {
    /// 设置menu，此时会移除之前的menu，接着重新生成新的menu并且使用autoLayout布局
    ///
    /// - Parameter menuDtoArray: MRMenuDto 组成的array
    public func cSetItemsWithMenuDtoArray(_ menuDtoArray : [SNXSQGAcitivesDto] ,menuType: MRMenuType) {
        for view in self.subviews {
            if view.tag == menuItemsTag {
                view.removeFromSuperview()
            }
        }
        
        for menuDto in menuDtoArray {
            let menuItem = MRMenuItem.init(menuDto: menuDto)
            menuItem.tag = menuItemsTag;
            self.addSubview(menuItem);
            
        }
        
        
    }
}
