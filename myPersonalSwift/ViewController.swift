//
//  ViewController.swift
//  myPersonalSwift
//
//  Created by mengran on 2019/4/8.
//  Copyright © 2019年 straycandy. All rights reserved.
//

import UIKit

class ViewController: MRMenuViewController {
    /// 时间戳，单位是毫秒
    var serverTime = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        self.cSetCustomStyles()
        self.requestTimeDatas()
    }

    private func cSetCustomStyles() {
        self.naviBar.backgroundImage.image = UIImage.init(named: "SNMKXSMS_Navi_BackgroundImage")
        self.naviBar.titleImageView.image = UIImage.init(named: "SNMKZSQ_ZSQ_NaviTitle")
        self.naviBar.backBtn.setImage(UIImage.init(named: "SNMKXSMS_BackBtn"), for: UIControl.State.normal)
        self.naviBar.rightMoreBtn.setImage(UIImage.init(named: "SNMKXSMS_MoreBtn"), for: UIControl.State.normal)
    }
    
    /// 请求服务器时间
    private func requestTimeDatas() {
        MRServiceTool.requestTimeData { (timeStamp) in
            //时间戳单位是毫秒
            self.serverTime = timeStamp
            //获取服务器时间后，请求场次信息
            self.requestChangciDatas()
        }
    }
    /// 请求场次信息
    private func requestChangciDatas() {
        MRServiceTool.requestMainMenuData { (menuDtoArray) in
            let menuType = MRMenuType.MRMenuTypeLabels
            //得到接口回调后，将接口数据转换成MRMenuDto数据，并且设置menu
            let tempMutArray = NSMutableArray.init()
            var index = 0
            var firstIndex = 0
            var newPeopleIndex = 0
            for dto in menuDtoArray {
                guard dto.timeLong != nil else { continue }
                let changciName : String
                let dtoTimeLong = Int(dto.timeLong!)
                if dto.isNowTime == true {
                    changciName = "正在疯抢"
                    firstIndex = index
                }else if dtoTimeLong! < self.serverTime {
                    changciName = "已开抢"
                }else{
                    changciName = "即将开抢"
                }
                if dto.exclusiveType == "161000000100" {
                    newPeopleIndex = index
                }
                let transDto = MRMenuDto.init(menuType: menuType, menuName: dto.name, secMenuName: changciName, imageUrlStr: "", menuIndex: index)
                tempMutArray.add(transDto)
                index += 1;
            }
            if newPeopleIndex > 0 {
                firstIndex = newPeopleIndex
            }
            self.cSetMenusWithMenuDtosArray(tempMutArray as NSArray, menuType: menuType)
            self.moveToMenuIndex(menuIndex: firstIndex)
        }
    }
}

