//
//  RZColorfulSwift.swift
//  RZColorfulSwift
//
//  Created by 若醉 on 2018/8/14.
//  Copyright © 2018年 rztime. All rights reserved.
//

import Foundation
import UIKit

enum RZConferInsertPosition {
    case Default
    case Header
    case End
    case Cursor
}

typealias ColorfulBlock = ((_ confer: RZColorfulConferrer) -> Void)


// MARK: - NSAttributedString 扩展
extension NSAttributedString {
    
    /// 富文本 归纳
    static func rz_colorfulConfer(confer:ColorfulBlock) -> NSAttributedString? {
        let connferrer = RZColorfulConferrer.init()
        confer(connferrer)
        return connferrer.confer();
    }
    
    static func htmlString(_ html: String?) ->NSAttributedString? {
        if html?.count == 0 || html == nil {
            return nil;
        }
        let data = html!.data(using: String.Encoding.unicode)
        do {
            return try NSAttributedString.init(data: data!, options: [NSAttributedString.DocumentReadingOptionKey.documentType : NSAttributedString.DocumentType.html], documentAttributes: nil)
        } catch let error as NSError {
            print("html转换失败:\(error.localizedDescription)")
        }
        return nil
    }
}


// MARK: - 对Label的富文本支持
extension UILabel {
    
    /// 设置富文本 （原内容将被清空）
    func rz_colorfulConfer(confer:ColorfulBlock?) -> Void {
        self.rzSetAttributedText(attr: nil)
        self.rz_colorfulConferInsetToLocation(0, confer)
    }
    
    /// 在指定位置插入富文本
    func rz_colorfulConferInsetTo(position: RZConferInsertPosition, _ append:ColorfulBlock?) -> Void {
        var location = 0;
        switch position {
        case .Default, .Cursor :
            location = self.getCursorLocation()
        case .Header :
            location = 0
        case .End :
            location = self.getEndLocation()
        }
        self.rz_colorfulConferInsetToLocation(location, append)
    }
    
    /// 在指定位置处加入富文本
    func rz_colorfulConferInsetToLocation(_ location:Int, _ confer:ColorfulBlock?) -> Void {
        if confer == nil {
            return ;
        }
        var loc = location;
        if loc < 0 {
            loc = 0;
        }
        
        let conferrerColorful = NSAttributedString.rz_colorfulConfer(confer: confer!)
        if conferrerColorful?.length == 0 || conferrerColorful == nil {
            return ;
        }
        var originAttr = self.rzAttributedString()
        if  originAttr == nil{
            originAttr = NSAttributedString.init()
        }
        let attr = NSMutableAttributedString.init(attributedString:originAttr!)
        attr.insert(conferrerColorful!, at: loc)
        self .rzSetAttributedText(attr: attr)
    }
    
    // 文本框的内容
    func rzAttributedString() -> NSAttributedString? {
        return self.attributedText;
    }
    // 设置文本框的内容
    func rzSetAttributedText(attr : NSAttributedString?) -> Void {
        self.attributedText = attr;
    }
    // 尾部的位置
    func getEndLocation() -> Int {
        return (self.attributedText?.length)!
    }
    // 光标的位置
    func getCursorLocation() -> Int {
        return (self.attributedText?.length)!
    }
}


// MARK: - 对TextView的富文本的支持
extension UITextView {
    
    /// 设置富文本 （原内容将被清空）
    func rz_colorfulConfer(confer:ColorfulBlock?) -> Void {
        self.rzSetAttributedText(attr: nil)
        self.rz_colorfulConferInsetToLocation(0, confer)
    }
    
    /// 在指定位置插入富文本
    func rz_colorfulConferInsetTo(position: RZConferInsertPosition, _ append:ColorfulBlock?) -> Void {
        var location = 0;
        switch position {
        case .Default, .Cursor :
            location = self.getCursorLocation()
        case .Header :
            location = 0
        case .End :
            location = self.getEndLocation()
        }
        self.rz_colorfulConferInsetToLocation(location, append)
    }
    
    /// 在指定位置处加入富文本
    func rz_colorfulConferInsetToLocation(_ location:Int, _ confer:ColorfulBlock?) -> Void {
        if confer == nil {
            return ;
        }
        var loc = location;
        if loc < 0 {
            loc = 0;
        }
        
        let conferrerColorful = NSAttributedString.rz_colorfulConfer(confer: confer!)
        if conferrerColorful?.length == 0 || conferrerColorful == nil {
            return ;
        }
        var originAttr = self.rzAttributedString()
        if  originAttr == nil{
            originAttr = NSAttributedString.init()
        }
        let attr = NSMutableAttributedString.init(attributedString:originAttr!)
        attr.insert(conferrerColorful!, at: loc)
        self .rzSetAttributedText(attr: attr)
    }
    
    // 文本框的内容
    func rzAttributedString() -> NSAttributedString? {
        return self.attributedText;
    }
    // 设置文本框的内容
    func rzSetAttributedText(attr : NSAttributedString?) -> Void {
        self.attributedText = attr;
    }
    // 尾部的位置
    func getEndLocation() -> Int {
        return (self.attributedText?.length)!
    }
    // 光标的位置
    func getCursorLocation() -> Int {
        return self.selectedRange.location
    }
}


// MARK: - 对TextField的富文本支持
extension UITextField {
    
    /// 设置富文本 （原内容将被清空）
    func rz_colorfulConfer(confer:ColorfulBlock?) -> Void {
        self.rzSetAttributedText(attr: nil)
        self.rz_colorfulConferInsetToLocation(0, confer)
    }
    
    /// 在指定位置插入富文本
    func rz_colorfulConferInsetTo(position: RZConferInsertPosition, _ append:ColorfulBlock?) -> Void {
        var location = 0;
        switch position {
        case .Default, .Cursor :
            location = self.getCursorLocation()
        case .Header :
            location = 0
        case .End :
            location = self.getEndLocation()
        }
        self.rz_colorfulConferInsetToLocation(location, append)
    }
    
    /// 在指定位置处加入富文本
    func rz_colorfulConferInsetToLocation(_ location:Int, _ confer:ColorfulBlock?) -> Void {
        if confer == nil {
            return ;
        }
        var loc = location;
        if loc < 0 {
            loc = 0;
        }
        
        let conferrerColorful = NSAttributedString.rz_colorfulConfer(confer: confer!)
        if conferrerColorful?.length == 0 || conferrerColorful == nil {
            return ;
        }
        var originAttr = self.rzAttributedString()
        if  originAttr == nil{
            originAttr = NSAttributedString.init()
        }
        let attr = NSMutableAttributedString.init(attributedString:originAttr!)
        attr.insert(conferrerColorful!, at: loc)
        self .rzSetAttributedText(attr: attr)
    }
    
    // 文本框的内容
    func rzAttributedString() -> NSAttributedString? {
        return self.attributedText;
    }
    // 设置文本框的内容
    func rzSetAttributedText(attr : NSAttributedString?) -> Void {
        self.attributedText = attr;
    }
    // 尾部的位置
    func getEndLocation() -> Int {
        return (self.attributedText?.length)!
    }
    // 光标的位置
    func getCursorLocation() -> Int {
        return self.selectedRange().location
    }
    
    func selectedRange() -> NSRange {
        let beginning = self.beginningOfDocument;
        let selectedRange = self.selectedTextRange;
        let selectionStart = selectedRange!.start;
        let selectionEnd = selectedRange!.end;
        
        let location = self.offset(from: beginning, to: selectionStart)
        let length = self.offset(from: selectionStart, to: selectionEnd)
        
        return NSRange.init(location: location, length: length)
    }
    
    func setSelectedRange(range: NSRange) -> Void {
        let beginning = self.beginningOfDocument;
        let startPosition = self.position(from: beginning, offset: range.location)!
        let endPosition = self.position(from: beginning, offset: range.location + range.length)!
        let selectionRange = self.textRange(from: startPosition, to: endPosition)
        self.selectedTextRange = selectionRange
    }
}
