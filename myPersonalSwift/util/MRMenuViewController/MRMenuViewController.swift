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
/// - MRMenuTypeLabels: menu是上下两行的文字，且menu宽度是屏幕的1/5
/// - MRMenuTypeImageThanLabel: menu优先展示图片，其次展示文字(目前这个样式先不做了)
public enum MRMenuType {
    case MRMenuTypeLabelOnly
    case MRMenuTypeLabels
//    case MRMenuTypeImageThanLabel
}

class MRMenuViewController : UIViewController{
    var _menuType = MRMenuType.MRMenuTypeLabelOnly
    var _menuDtosArray = NSArray();
    
    /// 分类view
    lazy var menuView: MRScrollMenu = {
        var menu = MRScrollMenu()
        menu.showsVerticalScrollIndicator = false
        menu.showsHorizontalScrollIndicator = false
        menu.scrollViewDelegate = self;
        menu.bounces = false
        return menu
    }()
    
    /// 导航栏
    public lazy var naviBar: MRNaviBar = {
        var naviBar = MRNaviBar.init(Height: 64);
        return naviBar
    }()
    
    /// 下方放置子viewcontroller的scrollview
    public lazy var contentScrollView: UIScrollView = {
        var contentScrollView = UIScrollView.init()
        return contentScrollView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //先add
        self.view.addSubview(naviBar)
        self.view.addSubview(menuView)
        self.view.addSubview(contentScrollView)
        //再设置layout
        self.cSetLayout()
    }
    
    private func cSetLayout() {
        naviBar.snp.makeConstraints { (make) in
            make.top.left.width.equalToSuperview()
            make.height.equalTo(64 + Top_iPhoneX_Or_Later_Space)
        }
        menuView.snp.makeConstraints { (make) in
            make.top.equalTo(naviBar.snp_bottomMargin)
            make.left.right.equalToSuperview()
            make.height.equalTo(get375Width(40))
        }
        contentScrollView.snp.makeConstraints { (make) in
            make.top.equalTo(menuView.snp_bottomMargin)
            make.left.right.bottom.equalToSuperview()
        }
    }
    
    /// 设置类目
    ///
    /// - Parameters:
    ///   - menuDtosArray: 类目array
    ///   - menuType: 类目样式类型
    public func cSetMenusWithMenuDtosArray(_ menuDtosArray: NSArray, menuType: MRMenuType) {
        _menuType = menuType
        _menuDtosArray = menuDtosArray
        menuView.cSetItemsWithMenuDtoArray(_menuDtosArray as! [MRMenuDto])
        menuView.layoutIfNeeded()
    }
    
    /// 移动到第X个类目
    ///
    /// - Parameter menuIndex: 第X个类目。从0开始
    public func moveToMenuIndex(menuIndex : NSInteger) {
        menuView.mrMenuItemClickOfIndex(clickIndex: menuIndex)
    }
}

extension MRMenuViewController:MRScrollMenuDelegate {
    func mrScrollMenuDidSelectIndex(index: NSInteger) {
        
    }
}
