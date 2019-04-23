//
//  ViewController.swift
//  myPersonalSwift
//
//  Created by mengran on 2019/4/8.
//  Copyright © 2019年 straycandy. All rights reserved.
//

import UIKit

class ViewController: MRMenuViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        self.cSetCustomStyles()
        self.requestDatas()
    }

    private func cSetCustomStyles() {
        self.naviBar.backgroundImage.image = UIImage.init(named: "SNMKXSMS_Navi_BackgroundImage")
        self.naviBar.titleImageView.image = UIImage.init(named: "SNMKZSQ_ZSQ_NaviTitle")
        self.naviBar.backBtn.setImage(UIImage.init(named: "SNMKXSMS_BackBtn"), for: UIControl.State.normal)
        self.naviBar.rightMoreBtn.setImage(UIImage.init(named: "SNMKXSMS_MoreBtn"), for: UIControl.State.normal)
    }
    
    private func requestDatas() {
        MRServiceTool.loadMainMenuData { (menuDto) in
            
        }
    }
}

