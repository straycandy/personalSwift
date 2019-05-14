//
//  MRMenuItem.swift
//  myPersonalSwift
//
//  Created by mengran on 2019/4/10.
//  Copyright © 2019年 straycandy. All rights reserved.
//

import Foundation
import UIKit

//分类的展示的view，分为背景uiview和文字label
class MRMenuItem: UIView {
    var menuDto : MRMenuDto
    var textLabelNormalColor = UIColor.colorWithHexString("222222")
    var secTextLabelNormalColor = UIColor.colorWithHexString("222222")
    var textLabelSelectColor = UIColor.colorWithHexString("dd2f2f")
    var secTextLabelSelectColor = UIColor.colorWithHexString("dd2f2f")
    
    var textLabelNormalFont = UIFont.boldSystemFont(ofSize: get375Width(15))
    var secTextLabelNormalFont = UIFont.systemFont(ofSize: get375Width(12))
    var textLabelSelectFont = UIFont.boldSystemFont(ofSize: get375Width(15))
    var secTextLabelSelectFont = UIFont.systemFont(ofSize: get375Width(12))
    
    //背景
    lazy var bgView: UIView = {
        var bgView = UIView()
        return bgView
    }()
    //展示的文字1
    lazy var textLabel: UILabel = {
        var textLabel = UILabel()
        textLabel.backgroundColor = UIColor.clear;
        textLabel.textColor = textLabelNormalColor
        textLabel.font = textLabelNormalFont
        textLabel.textAlignment = NSTextAlignment.center
        return textLabel
    }()
    //展示的文字2
    lazy var secTextLabel: UILabel = {
        var secTextLabel = UILabel()
        secTextLabel.backgroundColor = UIColor.clear;
        secTextLabel.textColor = secTextLabelNormalColor
        secTextLabel.font = secTextLabelNormalFont
        secTextLabel.textAlignment = NSTextAlignment.center
        return secTextLabel
    }()
    
    /// 高亮
    public func trunHighLighted() {
        switch self.menuDto.menuType {
        case .MRMenuTypeLabels?:
            self.textLabel.textColor = textLabelSelectColor
            self.textLabel.font = textLabelSelectFont
            self.secTextLabel.textColor = secTextLabelSelectColor
            self.secTextLabel.font = secTextLabelSelectFont
        default:
            self.textLabel.textColor = textLabelSelectColor
            self.textLabel.font = textLabelSelectFont
        }
    }
    
    /// 常亮
    public func trunNormal() {
        switch self.menuDto.menuType {
        case .MRMenuTypeLabels?:
            self.textLabel.textColor = textLabelNormalColor
            self.textLabel.font = textLabelNormalFont
            self.secTextLabel.textColor = secTextLabelNormalColor
            self.secTextLabel.font = secTextLabelNormalFont
        default:
            self.textLabel.textColor = textLabelNormalColor
            self.textLabel.font = textLabelNormalFont
        }
    }
    
    /// init
    ///
    /// - Parameters:
    ///   - menuDto: 类目数据
    ///   - frame: frame，因为会用snp布局，frame无用
    public init(menuDto : MRMenuDto, frame:CGRect) {
        self.menuDto = menuDto
        super.init(frame: frame)
        //添加view
        switch self.menuDto.menuType {
        case .MRMenuTypeLabels?:
            self.addSubview(self.bgView)
            self.addSubview(self.textLabel);
            self.addSubview(self.secTextLabel);
        default:
            //默认是MRMenuTypeLabelOnly
            self.addSubview(self.bgView)
            self.addSubview(self.textLabel);
        }
        //布局
        self.cSetLayout()
        //更新
        self.updateContentWithDto()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func cSetLayout() {
        switch self.menuDto.menuType {
        case .MRMenuTypeLabels?:
            bgView.snp.makeConstraints({ (make) in
                make.edges.equalTo(self)
                make.width.equalTo(CGFloat(kScreenWidth/5))
                make.height.equalTo(get375Width(60))
            })
            textLabel.snp.makeConstraints({ (make) in
                make.centerX.equalTo(self)
                make.centerY.equalTo(self).offset(-get375Width(15))
            })
            secTextLabel.snp.makeConstraints { (make) in
                make.centerX.equalTo(self)
                make.centerY.equalTo(self).offset(get375Width(2))
            }
        default:
            bgView.snp.makeConstraints({ (make) in
                make.edges.equalTo(self)
                make.width.equalTo(self.textLabel).offset(get375Width(12))
                make.height.equalTo(self.textLabel).offset(get375Width(6))
            })
            textLabel.snp.makeConstraints({ (make) in
                make.center.equalTo(self)
            })
        }
    }
    
    // !!!更新view
    private func updateContentWithDto() {
        switch self.menuDto.menuType {
        case .MRMenuTypeLabels?:
            self.textLabel.text = self.menuDto.menuName
            self.secTextLabel.text = self.menuDto.secMenuName
        default:
            self.textLabel.text = self.menuDto.menuName
        }
    }
}
