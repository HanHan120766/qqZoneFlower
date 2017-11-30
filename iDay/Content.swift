//
//  Constant.swift
//  myProject
//
//  Created by 千云锋 on 17/2/21.
//  Copyright © 2017年 千云锋. All rights reserved.
//

import Foundation
import UIKit

struct Constant {

    struct DeviceType
    {
        static let IS_IPHONE_4_OR_LESS =  UIDevice.current.userInterfaceIdiom == .phone && ScreenSize.SCREEN_MAX_LENGTH < 568.0
        static let IS_IPHONE_5 = UIDevice.current.userInterfaceIdiom == .phone && ScreenSize.SCREEN_MAX_LENGTH == 568.0
        static let IS_IPHONE_6 = UIDevice.current.userInterfaceIdiom == .phone && ScreenSize.SCREEN_MAX_LENGTH == 667.0
        static let IS_IPHONE_6P = UIDevice.current.userInterfaceIdiom == .phone && ScreenSize.SCREEN_MAX_LENGTH == 736.0
        static let IS_IPHONE_X = UIDevice.current.userInterfaceIdiom == .phone && ScreenSize.SCREEN_MAX_LENGTH > 736.0
    }

    
    //MARK: Theme-主题
    struct Theme {
 
        static let Color1 = UIColor(rgba: "#ff33ff")
        static let Color2 = UIColor(rgba: "#a3a3a3")
        static let Color3 = UIColor(rgba: "#999")
        static let Color4 = UIColor(rgba: "#e72a92")
        static let Color5 = UIColor(rgba: "#91dd04")
        static let Color6 = UIColor(rgba: "#33e7e1")
        static let Color7 = UIColor(rgba: "#3f5e93")
        static let Color8 = UIColor(rgba: "#f5e61d")
        //font_31 数字“31”是在iphone6上的字号
        static var Font_64:UIFont{return UIFont.systemFont(ofSize: self.FontSize_64)}
        static var Font_34:UIFont{return UIFont.systemFont(ofSize: self.FontSize_34)}
        
        static var Font_31:UIFont{return UIFont.systemFont(ofSize: self.FontSize_31)}
        
        static var Font_29:UIFont{return UIFont.systemFont(ofSize: self.FontSize_29)}
        
        static var Font_27:UIFont{return UIFont.systemFont(ofSize: self.FontSize_27)}
        
        static var Font_25:UIFont{return UIFont.systemFont(ofSize: self.FontSize_25)}
        
        static var Font_23:UIFont{return UIFont.systemFont(ofSize: self.FontSize_23)}
        
        static var Font_21:UIFont{return UIFont.systemFont(ofSize: self.FontSize_21)}
        
        static var Font_19:UIFont{return UIFont.systemFont(ofSize: self.FontSize_19)}
        
        static var Font_17:UIFont{return UIFont.systemFont(ofSize: self.FontSize_17)}
        
        static var Font_16:UIFont{return UIFont.systemFont(ofSize: self.FontSize_16)}
        
        static var Font_15:UIFont{return UIFont.systemFont(ofSize: self.FontSize_15)}
        
        static var Font_14:UIFont{return UIFont.systemFont(ofSize: self.FontSize_14)}
        
        static var Font_13:UIFont{return UIFont.systemFont(ofSize: self.FontSize_13)}
        
        static var Font_11:UIFont{return UIFont.systemFont(ofSize: self.FontSize_11)}
        
        static var Font_10:UIFont{return UIFont.systemFont(ofSize: self.FontSize_10)}
        
        
        
        
        //font_31 数字“31”是在iphone6上的字号
        static var FontSize_64:CGFloat{return self.getFontSizeForScreenSizeByScal(64)}
        static var FontSize_34:CGFloat{return self.getFontSizeForScreenSizeByScal(34)}
        
        static var FontSize_31:CGFloat{return self.getFontSizeForScreenSizeByScal(31)}
        
        static var FontSize_29:CGFloat{return self.getFontSizeForScreenSizeByScal(29)}
        
        static var FontSize_27:CGFloat{return self.getFontSizeForScreenSizeByScal(27)}
        
        static var FontSize_25:CGFloat{return self.getFontSizeForScreenSizeByScal(25)}
        
        static var FontSize_23:CGFloat{return self.getFontSizeForScreenSizeByScal(23)}
        
        static var FontSize_21:CGFloat{return self.getFontSizeForScreenSizeByScal(21)}
        
        static var FontSize_19:CGFloat{return self.getFontSizeForScreenSizeByScal(19)}
        
        static var FontSize_17:CGFloat{return self.getFontSizeForScreenSizeByScal(17)}
        
        static var FontSize_16:CGFloat{return self.getFontSizeForScreenSizeByScal(16)}
        
        static var FontSize_15:CGFloat{return self.getFontSizeForScreenSizeByScal(15)}
        
        static var FontSize_14:CGFloat{return self.getFontSizeForScreenSizeByScal(14)}
        
        static var FontSize_13:CGFloat{return self.getFontSizeForScreenSizeByScal(13)}
        
        static var FontSize_11:CGFloat{return self.getFontSizeForScreenSizeByScal(11)}
        
        static var FontSize_10:CGFloat{return self.getFontSizeForScreenSizeByScal(10)}
        
        
        /**
         通过确定iphone6(s)上的的字号，来确定其它设备上的字号
         默认iphone6plus的字号比iphone6(s)上的大一号
         iphone5/5s/se/4s/4 上的设备字号比iphone(s)上的字号小一号
         */
        ///定好phone6的文字尺寸，剩下的都是递减量 返回font
        static func getFontForScreenSizeByScal(_ iph6Font:CGFloat,iph6pScal:CGFloat = -1,iph5Scal:CGFloat = 1,iph4Scal:CGFloat = 1)->UIFont{
            return UIFont.systemFont(ofSize: self.getFontSizeForScreenSizeByScal(iph6Font, iph6pScal: iph6pScal, iph5Scal: iph5Scal, iph4Scal: iph4Scal))
        }
        
        //定好phone6的文字尺寸，剩下的都是递减量 返回font size
        static func getFontSizeForScreenSizeByScal(_ iph6Font:CGFloat,iph6pScal:CGFloat = -1,iph5Scal:CGFloat = 1,iph4Scal:CGFloat = 1)->CGFloat{
            return self.getFontForScreenSize(iph6Font-iph6pScal, iph6: iph6Font, iph5: iph6Font-iph5Scal, iph4: iph6Font-iph4Scal)
        }
        
        //依次为：iphone6p,iphone6,iphone5(5s,se),iphone4(s)
        static func getFontForScreenSize(_ iph6p:CGFloat,iph6:CGFloat,iph5:CGFloat,iph4:CGFloat)->CGFloat{
            
            var font:CGFloat = 0
            
            if DeviceType.IS_IPHONE_6P{
                font = iph6p
            }
            else if DeviceType.IS_IPHONE_X{
                font = iph6p
            }
            else if DeviceType.IS_IPHONE_6{
                font = iph6
            }
            else if DeviceType.IS_IPHONE_5{
                font = iph5
            }
            else if DeviceType.IS_IPHONE_4_OR_LESS{
                font = iph4
            }
            
            //最小字号为：7
            return font > 0 ? font : 7
        }
    }
    
    struct ScreenSize
    {
        static let SCREEN_BOUNDS:CGRect     = UIScreen.main.bounds
        static let SCALE_SCREEN:CGFloat     = UIScreen.main.scale
        static let SCREEN_WIDTH:CGFloat     = UIScreen.main.bounds.size.width
        static let SCREEN_HEIGHT:CGFloat    = UIScreen.main.bounds.size.height
        
        static let SCREEN_MAX_LENGTH:CGFloat = max(ScreenSize.SCREEN_WIDTH, ScreenSize.SCREEN_HEIGHT)
        static let SCREEN_MIN_LENGTH:CGFloat = min(ScreenSize.SCREEN_WIDTH, ScreenSize.SCREEN_HEIGHT)
        
        static let SCREEN_HEIGHT_SCALE:CGFloat  = ScreenSize.SCREEN_HEIGHT / 736
        static let SCREEN_WIDTH_SCALE:CGFloat   = ScreenSize.SCREEN_WIDTH / 414
    }

    
    struct ScreenSizeV2
    {
        static let SCALE_SCREEN     = UIScreen.main.scale
        static let SCREEN_WIDTH     = UIScreen.main.bounds.size.width
        static let SCREEN_HEIGHT    = UIScreen.main.bounds.size.height
        
        static let SCREEN_MAX_LENGTH:CGFloat    = max(ScreenSize.SCREEN_WIDTH, ScreenSize.SCREEN_HEIGHT)
        static let SCREEN_MIN_LENGTH:CGFloat    = min(ScreenSize.SCREEN_WIDTH, ScreenSize.SCREEN_HEIGHT)
        static let SCREEN_WIDTH_SCALE:CGFloat   = ScreenSize.SCREEN_WIDTH / 750
        static let SCREEN_HEIGHT_SCALE:CGFloat  = ScreenSize.SCREEN_HEIGHT / 1334
        
        static let SCREEN_BOUNDS: CGRect = UIScreen.main.bounds
        
        //各种间距
        static let MARGIN_4:CGFloat    = 4 * SCREEN_WIDTH_SCALE
        static let MARGIN_8:CGFloat    = 8  * SCREEN_WIDTH_SCALE
        static let MARGIN_10:CGFloat   = 10 * SCREEN_WIDTH_SCALE
        static let MARGIN_13:CGFloat   = 13 * SCREEN_WIDTH_SCALE
        static let MARGIN_15:CGFloat   = 15 * SCREEN_WIDTH_SCALE
        static let MARGIN_16:CGFloat   = 16 * SCREEN_WIDTH_SCALE
        static let MARGIN_20:CGFloat   = 20 * SCREEN_WIDTH_SCALE
        static let MARGIN_26:CGFloat   = 26 * SCREEN_WIDTH_SCALE
        static let MARGIN_30:CGFloat   = 30 * SCREEN_WIDTH_SCALE
        static let MARGIN_36:CGFloat   = 36 * SCREEN_WIDTH_SCALE
        static let MARGIN_38:CGFloat   = 38 * SCREEN_WIDTH_SCALE
        static let MARGIN_40:CGFloat   = 40 * SCREEN_WIDTH_SCALE
        static let MARGIN_44:CGFloat   = 44 * SCREEN_WIDTH_SCALE
        static let MARGIN_49:CGFloat   = 49 * SCREEN_WIDTH_SCALE
        static let MARGIN_60:CGFloat   = 60 * SCREEN_WIDTH_SCALE
        static let MARGIN_64:CGFloat   = 64 * SCREEN_WIDTH_SCALE
        static let MARGIN_68:CGFloat   = 68 * SCREEN_WIDTH_SCALE
        static let MARGIN_150:CGFloat   = 150 * SCREEN_WIDTH_SCALE
        
        static let LINE_HEIGHT:CGFloat   = 0.5 * SCREEN_WIDTH_SCALE
    }

}
