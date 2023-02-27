//
//  Colors.swift
//  TravelAssist
//
//  Created by liang.wang on 26/8/2022.
//  Copyright © 2022 CoverMore. All rights reserved.
//

import Foundation
import SwiftUI


extension Color {
    static let orangeButton = Color(hex: "#FF671B")
    static let primaryButton = orangeButton
    static let secondaryButton = Color(hex: "#000070C9")
    static let disabledButton = Color(hex: "#C4C4C4")
    static let listGray = Color(hex: "#F2F2F2")
    static let characterGrey = Color(hex: "#2F2F2F")
    static let primaryBlue = Color(hex: "00355D")
    static let lightBlue = Color(hex: "#01518f")
    static let lighterBlue = Color(hex: "#005596")
    static let deepBlue = Color(hex: "#01213B")
    static let validationColor = Color(hex: "FF3B30")
    static let textFieldLabel = Color(hex: "3C3C43")
    static let riskLevelLow = Color(hex: "33825B")
    static let riskLevelModerate = Color(hex: "44AE72")
    static let riskLevelMedium = Color(hex: "FBC84A")
    static let riskLevelHigh = Color(hex: "DF8653")
    static let grayF6 = Color(hex: "#F6F6F6")
    static let grayE0 = Color(hex: "#E0E0E0")
    static let grayDA = Color(hex: "#DADADA")
    static let textColor = Color(hex: "222829")
    static let intelligenceCircleBlue = Color(hex: "#002F52")
    static let riskLevelExtreme = Color(hex: "#AB3E3E")
//    static let blackText = WtpSetting.isLeisure() ? Color(hex: "#555555") : .apacDarkText
    static let black22 = Color(hex: "#222829")
    static let seperatorColor = Color(hex: "D2D2D2")
}

// MARK: - APAC

extension Color {
    static let apacBlue = Color(hex: "#00345C") // page background
    static let apacBlueVariant = Color(hex: "#005596")
    static let apacDarkText = Color.apacGray800
    static let apacLightText = Color.apacWhite
    static let apacOrange = Color.orangeButton // used for tint color
    static let apacOrangeVariant = Color(hex: "#FF8549")
    static let apacWhite = Color.apacGray50
    static let apacTintColor = apacOrange
    static let naviBarTitleColor = Color.apacDarkText
    static let apacError = Color(hex: "#B00020")

    static let apacGray900 = Color(hex: "#101828")
    static let apacGray800 = Color(hex: "#1D2939")
    static let apacGray700 = Color(hex: "#344054")
    static let apacGray600 = Color(hex: "#475467")
    static let apacGray500 = Color(hex: "#667085")
    static let apacGray400 = Color(hex: "#98A2B3")
    static let apacGray300 = Color(hex: "#D0D5DD")
    static let apacGray200 = Color(hex: "#E4E7EC")
    static let apacGray100 = Color(hex: "#F2F4F7")
    static let apacGray50 = Color(hex: "#F9FAFB")

    static let riskUnrated = Color(hex: "#606060")
    static let riskLow = Color(hex: "#01AE2D")
    static let riskMedium = Color(hex: "#F5B800")
    static let riskModerate = Color(hex: "#FF671B")
    static let riskHigh = Color(hex: "#FA0000")
    static let riskExtreme = Color(hex: "#C20000")
    static let apacTextFieldBgColor = Color(hex: "#FCFCFD")
}
extension Color {
    init(hex: String) {
        var hexWithoutSymbol = hex
        if hexWithoutSymbol.hasPrefix("#") {
            hexWithoutSymbol = String(hexWithoutSymbol.dropFirst())
        }

        let scanner = Scanner(string: hexWithoutSymbol)
        var hexInt: UInt32 = 0x0
        scanner.scanHexInt32(&hexInt)

        var r: UInt32!, g: UInt32!, b: UInt32!
        switch hexWithoutSymbol.count {
        case 3: // #RGB
            r = ((hexInt >> 4) & 0xF0 | (hexInt >> 8) & 0x0F)
            g = ((hexInt >> 0) & 0xF0 | (hexInt >> 4) & 0x0F)
            b = ((hexInt << 4) & 0xF0 | hexInt & 0x0F)
        case 6: // #RRGGBB
            r = (hexInt >> 16) & 0xFF
            g = (hexInt >> 8) & 0xFF
            b = hexInt & 0xFF
        default:
            // TODO: ERROR
            break
        }

        self.init(
            red: CGFloat(r) / 255,
            green: CGFloat(g) / 255,
            blue: CGFloat(b) / 255
        )
    }
}

//extension Color {
//    func uiColor() -> UIColor {
//        UIColor(self)
//    }
//}
