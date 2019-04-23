//
//  MRMenuViewController.swift
//  myGreatSwiftTest
//
//  Created by mengran on 2019/4/8.
//  Copyright © 2019年 ggV5. All rights reserved.
//

import Foundation
import UIKit
import SnapKit

/// menu展示的样式
///
/// - MRMenuTypeLabelOnly: menu只有一行文字
/// - MRMenuTypeLabels: menu是上行2行的文字
/// - MRMenuTypeImageThanLabel: menu优先展示图片，其次展示文字
public enum MRMenuType {
    case MRMenuTypeLabelOnly
    case MRMenuTypeLabels
    case MRMenuTypeImageThanLabel
}

class MRMenuViewController : UIViewController {
    
    lazy var menuView: MRScrollMenu = {
        var menu = MRScrollMenu()
        return menu
    }()
    
    public lazy var naviBar: MRNaviBar = {
        var naviBar = MRNaviBar.init(Height: 64);
        return naviBar
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //先add
        self.view.addSubview(naviBar)
        self.view.addSubview(menuView)
        //再设置layout
        self.cSetLayout()
    }
    
    private func cSetLayout() {
        naviBar.snp.makeConstraints { (make) in
            make.top.left.width.equalToSuperview()
            make.height.equalTo(64 + Top_iPhoneX_Or_Later_Space)
        }
        menuView.snp.makeConstraints { (make) in
            make.top.equalTo(naviBar)
            make.left.right.equalToSuperview()
            make.height.equalTo(get375Width(40))
        }
    }
    
    public func cSetMenusWithMenuDtosArray(_: NSArray, menuType: MRMenuType) {
        
    }
    
}
