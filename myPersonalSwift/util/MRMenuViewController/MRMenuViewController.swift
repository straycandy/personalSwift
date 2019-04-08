//
//  MRMenuViewController.swift
//  myGreatSwiftTest
//
//  Created by mengran on 2019/4/8.
//  Copyright © 2019年 ggV5. All rights reserved.
//

import Foundation
import UIKit

class MRMenuViewController : UIViewController {
    
    /// menu展示的样式
    ///
    /// - MRMenuTypeLabelOnly: menu只有一行文字
    /// - MRMenuTypeLabels: menu是上行2行的文字
    /// - MRMenuTypeImageThanLabel: menu优先展示图片，其次展示文字
    enum MRMenuType {
        case MRMenuTypeLabelOnly
        case MRMenuTypeLabels
        case MRMenuTypeImageThanLabel
    }
    
    lazy var menuView: MRScrollMenu = {
        var menu = MRScrollMenu()
        return menu
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //在viewDidLoad的时候，将menuView添加到self.view上
        self.view.addSubview(menuView);
    }
    
    func cSetMenusWithMenuDtosArray(_: NSArray, menuType: MRMenuType) {
        
    }
    
}
