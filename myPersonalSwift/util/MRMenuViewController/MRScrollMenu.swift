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


@objc protocol MRScrollMenuDelegate {
    @objc optional func mrScrollMenuDidSelectIndex(index:NSInteger)
}

class MRScrollMenu: UIScrollView{
    weak var scrollViewDelegate: MRScrollMenuDelegate?
    var menuItemsArray = Array<MRMenuItem>()
    var selectItemIndex = 0
    var selectItem : MRMenuItem? = nil
    /// 设置menu，此时会移除之前的menu，接着重新生成新的menu并且使用autoLayout布局
    ///
    /// - Parameter menuDtoArray: MRMenuDto 组成的array
    public func cSetItemsWithMenuDtoArray(_ menuDtoArray : [MRMenuDto]) {
        //移除之前的
        for view in self.menuItemsArray {
            view.removeFromSuperview()
        }
        self.menuItemsArray.removeAll()
        //遍历生成现在的
        for menuDto in menuDtoArray {
            let menuItem = MRMenuItem.init(menuDto: menuDto, frame: CGRect.init(x: 0, y: 0, width: 40, height: 20))
            menuItem.newTapGesture { (tap) in
                tap.numberOfTouchesRequired = 1
                }.whenTaped { (tap) in
                    self.mrMenuItemClick(clickedItem: menuItem)
            }
            self.addSubview(menuItem);
            self.menuItemsArray.append(menuItem)
        }
        self.menuItemsArray.snp.distributeViewsAlong(axisType: .horizontal, fixedSpacing: 0, leadSpacing: 0, tailSpacing: 0);
    }
    
    public func mrMenuItemClickOfIndex(clickIndex: NSInteger) {
        guard clickIndex < self.menuItemsArray.count else {
            print("数组越界，func：\(#function)")
            return
        }
        let clickItem = self.menuItemsArray[clickIndex]
        self.mrMenuItemClick(clickedItem: clickItem)
    }
    
    /// 点击items
    ///
    /// - Parameter clickedItem: 当前点击的item
    func mrMenuItemClick(clickedItem: MRMenuItem) {
        //通知vc点击了当前index
        scrollViewDelegate?.mrScrollMenuDidSelectIndex!(index: clickedItem.menuDto.menuIndex ?? 0)
        //设置item高亮和常亮
        if self.selectItem != nil {
            self.selectItem?.trunNormal()
        }
        clickedItem.trunHighLighted()
        self.selectItem = clickedItem
        //自己移动到当前index
        var num = clickedItem.menuDto.menuIndex ?? 0
        switch clickedItem.menuDto.menuType {
        case .MRMenuTypeLabels?:
            if num <= 2 {
                num = 0;
            }else if num >= self.menuItemsArray.count - 2{
                num = self.menuItemsArray.count - 5;
            }else{
                num = num - 2;
            }
        default:
            num = num + 0
        }
        let moveItem = self.menuItemsArray[num]
        self.finalShouldMoveToItem(moveItem: moveItem)
    }
    
    private func finalShouldMoveToItem(moveItem: MRMenuItem) {
        self.setContentOffset(moveItem.frame.origin, animated: true)
    }
}

