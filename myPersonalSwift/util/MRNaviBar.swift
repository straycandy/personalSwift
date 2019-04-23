//
//  MRNaviBar.swift
//  myPersonalSwift
//
//  Created by mengran on 2019/4/9.
//  Copyright © 2019年 straycandy. All rights reserved.
//

import Foundation
import UIKit
import SnapKit

class MRNaviBar: UIView {
    /// 背景图片
    public lazy var backgroundImage: UIImageView = {
        var backgroundImage = UIImageView()
        return backgroundImage
    }()
    
    /// 返回按钮
    public lazy var backBtn: UIButton = {
        var backBtn = UIButton()
        return backBtn
    }()
    
    /// 标题图片(居中) 大小为 120*30
    public lazy var titleImageView: UIImageView = {
        var titleImageView = UIImageView()
        return titleImageView
    }()
    
    /// 标题label(居中)
    public lazy var titleLabel: UILabel = {
        var titleLabel = UILabel()
        return titleLabel
    }()
    
    /// 右侧更多按钮
    public lazy var rightMoreBtn: UIButton = {
        var rightMoreBtn = UIButton()
        return rightMoreBtn
    }()
    
    convenience init(Height:Int) {
        self.init(frame: CGRect(x: 0, y: 0, width: Int(kScreenWidth), height: Height))
        self.addSubview(self.backgroundImage)
        self.addSubview(self.backBtn)
        self.addSubview(self.titleLabel)
        self.addSubview(self.titleImageView)
        self.addSubview(self.rightMoreBtn)
        self.cSetLayout()
    }
    
    private func cSetLayout() {
        self.backgroundImage.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
        
        self.backBtn.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(get375Width(5))
            make.bottom.equalToSuperview().offset(-get375Width(5))
            make.size.equalTo(CGSize(width: 44, height: 44))
        }
        
        self.titleImageView.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.centerY.equalTo(self.backBtn)
        }
        
        self.titleImageView.snp.makeConstraints { (make) in
            make.center.equalTo(titleImageView)
        }
        
        self.rightMoreBtn.snp.makeConstraints { (make) in
            make.right.equalToSuperview().offset(-get375Width(5))
            make.bottom.equalToSuperview().offset(-get375Width(5))
            make.size.equalTo(CGSize(width: 44, height: 44))
        }
    }
}
