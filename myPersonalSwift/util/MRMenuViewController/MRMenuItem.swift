//
//  MRMenuItem.swift
//  myPersonalSwift
//
//  Created by mengran on 2019/4/10.
//  Copyright © 2019年 straycandy. All rights reserved.
//

import Foundation
import UIKit


class MRMenuItem: UIView {
    var menuDto : SNXSQGAcitivesDto
    
    public init(menuDto : SNXSQGAcitivesDto, frame:CGRect) {
        self.menuDto = menuDto
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
